# Homelab

## Overview

This repository contains configuration files for setting up and managing a personal homelab environment.

Everything is managed using Docker and Docker Compose for easy deployment and maintenance.

## Hardware

The powerhouse of this homelab is actually pretty modest.

This makes it even more awesome as it clearly shows you don't need expensive gear to get some useful services up & running.

It consists of:
🧠 Raspberry Pi 4 (8GB RAM) → running as the main server
💾 Kingston Canvas Go! Plus 128GB microSD card → for the OS and Docker
🗃️ Hitachi 2.5" 500GB HDD → drive pulled from an old laptop, connected via SATA to USB 3.0 enclosure for storage

... and that's it!

The Pi is running up-to-date Raspberry Pi OS and is connected to home network via Ethernet for reliable connectivity.

## Optimizations

These are some Raspberry Pi related optimizations that are not version-controlled but are worth mentioning:

- [log2ram](https://github.com/azlux/log2ram)
  - Reduces the number of writes to the microSD card by storing logs in RAM and syncing them to disk periodically.
  - This reduces the wear and tear on the microSD card, prolonging its lifespan.
  - When your set everything up and your microSD card fails, you'll realize how important this is.
- Disable display manager
  - `sudo systemctl stop display-manager`
  - This frees up some system resources since GUI is not needed 99% of the time.
  - Even though `lightdm` is pretty lightweight, disabling it can free up some RAM and CPU cycles for other services.
