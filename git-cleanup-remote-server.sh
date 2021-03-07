echo off

git fetch -p origin
git branch -r --merged | grep -v -e 'master$' -e 'develop$' -e 'main$' | sed 's@origin/@@' | xargs -L1 git push origin -d
