#!/bin/sh
# Remove agency registry on uninstall.
# Env: AIS_DATA_DIR

rm -f "$AIS_DATA_DIR/registry.yaml"
