#! /bin/bash

git branch --merged | grep -v -e 'master$' -e 'develop$' -e '1\.x\.x$' -e '2\.x\.x$' | xargs -L1 git branch -d
