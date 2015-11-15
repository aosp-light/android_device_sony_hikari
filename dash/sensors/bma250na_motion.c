/*
 * Copyright (C) 2012 Sony Mobile Communications AB.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "DASH - bma250_motion"

#include <string.h>
#include "sensors_log.h"
#include <unistd.h>
#include <fcntl.h>
#include <linux/input.h>
#include <errno.h>
#include "sensors_list.h"
#include "sensors_fifo.h"
#include "sensors_select.h"
#include "sensor_util.h"
#include "sensors_id.h"
#include "sensors_config.h"
#include "sensors_sysfs.h"

#define BMA250_MOTION_NAME "bma250_motion"

static int bma250_motion_init(struct sensor_api_t *s);
static int bma250_motion_activate(struct sensor_api_t *s, int enable);
static int bma250_motion_set_delay(struct sensor_api_t *s, int64_t ns);
static void bma250_motion_close(struct sensor_api_t *s);
static void *bma250_motion_read(void *arg);

struct sensor_desc {
	struct sensors_select_t select_worker;
	struct sensors_sysfs_t sysfs;
	struct sensor_t sensor;
	struct sensor_api_t api;

	int motion;
};

static struct sensor_desc bma250_motion = {
	.sensor = {
		name: "BMA250 accelerometer",
		vendor: "Bosch Sensortec GmbH",
		version: sizeof(sensors_event_t),
		handle: SENSOR_PICK_UP_GESTURE_HANDLE,
		type: SENSOR_TYPE_PICK_UP_GESTURE,
		power: 0.15,
		flags: SENSOR_FLAG_WAKE_UP,
	},
	.api = {
		init: bma250_motion_init,
		activate: bma250_motion_activate,
		set_delay: bma250_motion_set_delay,
		close: bma250_motion_close
	},
};

static int bma250_motion_init(struct sensor_api_t *s)
{
	struct sensor_desc *d = container_of(s, struct sensor_desc, api);
	int fd;

	fd = open_input_dev_by_name(BMA250_MOTION_NAME, O_RDONLY | O_NONBLOCK);
	if (fd < 0) {
		ALOGE("%s: failed to open input dev %s, error: %s\n",
			__func__, BMA250_MOTION_NAME, strerror(errno));
		return -1;
	}
	close(fd);

	sensors_sysfs_init(&d->sysfs, BMA250_MOTION_NAME, SYSFS_TYPE_INPUT_DEV);
	sensors_select_init(&d->select_worker, bma250_motion_read, s, -1);

	return 0;
}

static int bma250_motion_activate(struct sensor_api_t *s, int enable)
{
	struct sensor_desc *d = container_of(s, struct sensor_desc, api);
	int fd = d->select_worker.get_fd(&d->select_worker);

	/* suspend/resume will be handled in kernel-space */
	if (enable && (fd < 0)) {
		fd = open_input_dev_by_name(BMA250_MOTION_NAME,
			O_RDONLY | O_NONBLOCK);
		if (fd < 0) {
			ALOGE("%s: failed to open input dev %s, error: %s\n",
				__func__, BMA250_MOTION_NAME, strerror(errno));
			return -1;
		}
		d->motion = 0;
		d->select_worker.set_fd(&d->select_worker, fd);
		d->select_worker.resume(&d->select_worker);
		d->sysfs.write_int(&d->sysfs, "slope_mode", 0x77);
	} else if (!enable && (fd > 0)) {
		d->sysfs.write_int(&d->sysfs, "slope_mode", 0x00);
		d->select_worker.suspend(&d->select_worker);
		d->select_worker.set_fd(&d->select_worker, -1);
	}
	return 0;
}

static int bma250_motion_set_delay(struct sensor_api_t *s, int64_t ns)
{
	return 0;
}

static void bma250_motion_close(struct sensor_api_t *s)
{
	struct sensor_desc *d = container_of(s, struct sensor_desc, api);

	d->select_worker.destroy(&d->select_worker);
}

static void *bma250_motion_read(void *arg)
{
	struct sensor_api_t *s = arg;
	struct sensor_desc *d = container_of(s, struct sensor_desc, api);
	struct input_event event;
	int fd = d->select_worker.get_fd(&d->select_worker);

	while (read(fd, &event, sizeof(event)) > 0) {
		switch (event.type) {
		case EV_ABS:
			if (event.code == ABS_MISC)
				d->motion = 1;
			break;

		case EV_SYN:
			if (d->motion) {
				sensors_event_t sd;

			    memset(&sd, 0, sizeof(sd));
			    sd.sensor = d->sensor.handle;
			    sd.type = d->sensor.type;
			    sd.version = d->sensor.version;
			    sd.timestamp = get_current_nano_time();
			    sd.data[0] = 1.0;

			    sensors_fifo_put(&sd);

			    d->motion = 0;
			}
			break;
		}
	}

	return NULL;
}

list_constructor(bma250na_motion_init_driver);
void bma250na_motion_init_driver()
{
	(void)sensors_list_register(&bma250_motion.sensor, &bma250_motion.api);
}
