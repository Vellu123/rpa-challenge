#!/bin/bash

setup() {
    python3 -m venv ./venv
    . ./venv/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
}

test() {
    . ./venv/bin/activate
    echo "TESTING"
    python run_robot.py --dryrun
}

challenge1() {
    . ./venv/bin/activate
    python run_robot.py -gd
}

full_run() {
    setup
    challenge1
}

"$@"