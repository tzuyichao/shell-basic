#!/bin/bash

echo "Pid: $$"

for i in {1..3}
do
  bash ./test.sh
done