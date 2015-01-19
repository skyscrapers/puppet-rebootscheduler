#!/bin/bash

## PUPPETIZED

# Only reboot if /var/run/reboot-required exists

if [ -f "/var/run/reboot-required" ]; then
  /usr/bin/logger -t rebootscheduler "found /var/run/reboot-required - rebooting now!"
  /sbin/reboot
else
  /usr/bin/logger -t rebootscheduler "no reboot required"
  echo "Aborting - no reboot required"
fi
