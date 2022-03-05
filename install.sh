#!/usr/bin/env bash

set -e

find . -name install.sh -mindepth 2 | while read installer; do sh -c $installer; done
