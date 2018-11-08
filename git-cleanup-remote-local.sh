#! /bin/bash

git fetch -p origin && git branch -r --merged | grep -vG 'master*' | grep -vG 'develop*' | grep -vG '1.x.x*' | xargs -L1 git branch -rd
