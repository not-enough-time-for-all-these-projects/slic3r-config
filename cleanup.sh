#!/bin/bash

set -e
set -x

# Work from project root
cd "$(realpath $(git rev-parse --show-toplevel))"

# Adjust slic3r.ini
sed -i slic3r.ini \
 -e 's/\(last_output_path =\).*/\1 \/tmp/g' \
 -e 's/\(config_directory =\).*/\1 \/tmp/g' \
 -e 's/\(skein_directory =\).*/\1 \/tmp/g' \
 -e 's/\(last_version_check =\).*/\1 1628251687/g' \
 -e 's/\(filament =\).*/\1 anycubic\-i3mega/g' \
 -e 's/\(print =\).*/\1 anycubic\-i3mega/g' \
 -e 's/\(printer =\).*/\1 anycubic\-i3mega/g'

sed -i slic3r.ini {filament,print,printer}/anycubic-i3mega.ini \
	-e "s/^# generated by .*$//g"
