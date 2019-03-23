"""
File: laser_alarm.py
Author: Zachary King <kingzach77@gmail.com>

A script for running a continuous laser-powered alarm
for permiter intrusion detection.

Note: expects a Light-Dependent Resistor (LDR)
to be connected to GPIO pin 17; this can be configured
using the environment variable `LDR_PIN`.

Basic concept derived from the official Raspberry Pi
project found here:
    https://github.com/raspberrypilearning/laser-tripwire
"""

import os
import signal
from datetime import datetime

from gpiozero import LightSensor

import utils


MACHINE = utils.machine()
SERVICE = 'perimiter_intrusion'
NAME = os.environ.get('HAWKEYE_PERIMITER_NAME', MACHINE)


def log(msg):
    ts = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print('{} | {}'.format(ts, msg))


def alert():
    log('perimiter intrusion detected')
    utils.alert('perimiter alarm triggered at {}'.format(
        NAME), SERVICE, utils.ALERT_INTRUSION)


def main():
    ldr_pin = int(os.environ.get('LDR_PIN', '17'))
    sensor = LightSensor(ldr_pin, charge_time_limit=0.01, threshold=0.2)
    sensor.when_dark = alert

    while True:
        pass


if __name__ == '__main__':
    main()
