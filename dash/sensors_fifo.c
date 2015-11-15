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
#define LOG_TAG "DASH - fifo"

#include "sensors_log.h"
#include <pthread.h>
#include "sensors_fifo.h"
#include "sensors_list.h"

#include "hardware_legacy/power.h"

#define FIFO_LEN 8

static struct sensors_fifo_t {
	pthread_mutex_t mutex;
	pthread_cond_t data_cond;

	int fifo_i;
	sensors_event_t fifo[FIFO_LEN];

	int wake_lock_acquire;
	int wake_lock_release;
} sensors_fifo;

void sensors_fifo_init()
{
	pthread_mutex_init(&sensors_fifo.mutex, NULL);
	pthread_cond_init(&sensors_fifo.data_cond, NULL);
	sensors_fifo.wake_lock_acquire = 0;
	sensors_fifo.wake_lock_release = 0;
}

void sensors_fifo_deinit()
{
	if (sensors_fifo.wake_lock_acquire)
		release_wake_lock("DASH");
	pthread_mutex_destroy(&sensors_fifo.mutex);
}

void sensors_fifo_put(sensors_event_t *data)
{
	struct sensor_t* sensor;

	pthread_mutex_lock(&sensors_fifo.mutex);

	if (sensors_fifo.fifo_i < FIFO_LEN) {
		sensors_fifo.fifo[sensors_fifo.fifo_i++] = *data;

		sensor = sensors_list_get_sensor_from_handle(data->sensor);
		if (sensor && (sensor->flags & SENSOR_FLAG_WAKE_UP)) {
			if (!sensors_fifo.wake_lock_acquire)
				acquire_wake_lock(PARTIAL_WAKE_LOCK, "DASH");
			sensors_fifo.wake_lock_acquire++;
		}
	}

	pthread_cond_broadcast(&sensors_fifo.data_cond);
	pthread_mutex_unlock(&sensors_fifo.mutex);
}

int sensors_fifo_get_all(sensors_event_t *data, int len)
{
	int i;
	struct sensor_t* sensor;

	/* This function deliberately drops all packets above len. */
	pthread_mutex_lock(&sensors_fifo.mutex);
	if (sensors_fifo.wake_lock_release) {
	    sensors_fifo.wake_lock_acquire -= sensors_fifo.wake_lock_release;
	    sensors_fifo.wake_lock_release = 0;
	    if (!sensors_fifo.wake_lock_acquire)
	        release_wake_lock("DASH");
	}
	pthread_cond_wait(&sensors_fifo.data_cond, &sensors_fifo.mutex);

	for (i = 0; (i < sensors_fifo.fifo_i) && (i < len); i++) {
		data[i] = sensors_fifo.fifo[i];
		
		sensor = sensors_list_get_sensor_from_handle(data[i].sensor);
		if (sensor && (sensor->flags & SENSOR_FLAG_WAKE_UP))
			sensors_fifo.wake_lock_release++;
	}
	sensors_fifo.fifo_i = 0;
	pthread_mutex_unlock(&sensors_fifo.mutex);

	return i;
}

