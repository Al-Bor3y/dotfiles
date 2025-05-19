#!/bin/bash

polybar --reload audio &

sleep 2.5

polybar --reload left &
polybar --reload center &
polybar --reload processor &
polybar --reload clock &
