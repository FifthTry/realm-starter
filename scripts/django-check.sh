#!/usr/bin/env bash

set -e
cd dj
../venv/bin/python manage.py check
../venv/bin/python manage.py makemigrations --check --dry-run
