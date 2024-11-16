#!/bin/bash
set -e
echo "Starting Apache..."
apache2ctl configtest || { echo "Apache configtest failed"; exit 1; }
apache2ctl -D FOREGROUND

