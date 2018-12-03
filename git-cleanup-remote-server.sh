#! /bin/bash

git fetch -p origin
git branch -r --merged | grep -v -e 'master$' -e 'develop$' -e '1\.x\.x$' -e '2\.x\.x$' | sed 's@origin/@@' | xargs -L1 git push origin -d
