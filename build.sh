#!/usr/bin/env sh

# Build Laser Perimiter System
echo "building laser alarm system..."
docker build -f hawkeye/laser_alarm.Dockerfile -t hawkeye/perimiter .