#!/usr/bin/env sh
set -x

cd Benchmarks/

for fn in *; do
    cd "$fn"
    swift test -c release
    cd ..
done
