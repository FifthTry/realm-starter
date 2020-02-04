#!/usr/bin/env bash

set -e
cd dj
../venv/bin/python manage.py migrate
