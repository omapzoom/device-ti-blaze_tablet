/*
 * Copyright (C) 2008 The Android Open Source Project
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

#ifndef ANDROID_BMP085_SENSOR_H
#define ANDROID_BMP085_SENSOR_H

#include <stdint.h>
#include <errno.h>
#include <sys/cdefs.h>
#include <sys/types.h>

#include "sensors.h"
#include "SensorBase.h"
#include "InputEventReader.h"

/*****************************************************************************/

struct input_event;

class BMP085Sensor : public SensorBase {
public:
            BMP085Sensor();
    virtual ~BMP085Sensor();

    enum {
        Pressure   = 0,
        Temperature = 1,
        numSensors
    };

    virtual int readEvents(sensors_event_t* data, int count);
    virtual bool hasPendingEvents() const;
    virtual int enable(int32_t handle, int enabled);

private:
    int mEnabled;
    uint32_t mPendingMask;
    InputEventCircularReader mInputReader;
    sensors_event_t mPendingEvents[numSensors];
    bool mHasPendingEvent;
    char input_sysfs_path[PATH_MAX];
    int input_sysfs_path_len;


};

/*****************************************************************************/

#endif  // ANDROID_BMP085_SENSOR_H
