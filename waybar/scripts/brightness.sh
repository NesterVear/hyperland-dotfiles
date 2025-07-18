#!/bin/bash

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( current * 100 / max ))
echo "${percent}%"

