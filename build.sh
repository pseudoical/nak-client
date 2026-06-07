#!/bin/bash

set -eux

gcc main.s -o ./main -O0 $(pkg-config --libs gtk4 webkitgtk-6.0)
