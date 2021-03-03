#!/bin/bash

printf "Please enter a path where you need to restore data: "
read path_to_restore
cat ./*.tar.gz | tar xzf - -g /dev/null --ignore-zeros -C "${path_to_restore}"