#! /bin/bash

git branch --merged | grep -vG 'master*' | grep -vG 'develop*' | grep -vG '1.x.x*' | sed 's@origin/@@' | xargs -L1 git branch -d
