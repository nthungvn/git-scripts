echo off

git fetch -p origin
git branch -r --merged | grep -v -e 'master$' -e 'develop$' -e 'main$' | xargs -L1 git branch -rd
