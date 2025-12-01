#!/bin/bash
set -e

mkdir -p build
cd build

cmake .. -GNinja

ninja

./text_editor