#!/usr/bin/env bash

if [[ ! -f train.json ]]; then
    cd raw_NYT
    python generate.py --file-type train
    mv new_train.json ../train.json
    cd ..
fi

if [[ ! -f dev.json ]]; then
    cd raw_NYT
    python raw_NYT/generate.py --file-type valid
    mv raw_NYT/new_valid.json ../dev.json
    cd ..
fi

if [[ ! -f test.json ]]; then
    cd raw_NYT
    python raw_NYT/generate.py --file-type test
    mv raw_NYT/new_test.json ../test.json
    cd ..
fi

echo "Running build_data..."

python build_data.py