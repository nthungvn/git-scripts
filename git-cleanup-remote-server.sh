#! /bin/bash

git fetch -p origin && git branch -r --merged | grep -vG 'master*' | grep -vG 'develop*' | grep -vG '1.x.x*' | sed 's@origin/@@' | xargs -L1 git push origin -d
