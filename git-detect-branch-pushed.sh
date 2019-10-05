#!/bin/bash

#Usage: script_name $branch $isDebug

function print {
    if [ $isDebug == true ]; then
        echo $1
    fi
}

# Branch that need to be check includes refs string
branch=$1
isDebug=$2

declare -a moduleChanged

for repo in */
do
    cd $repo
    print ""

    echo "The repo: $repo is in-progressing"
    latest_tag=`git describe --abbrev=0`
    latest_tag_hash=`git show-ref -s $latest_tag`
    print "   - The latest tag $latest_tag with hash $latest_tag_hash"


    latest_commit=`git ls-remote origin -h $branch`
    latest_commit_hash=($latest_commit) #Point to element at index 0 by default
    print "   - The latest commit hash $latest_commit_hash"

    if [ $latest_tag_hash != $latest_commit_hash ]; then
        print "Repo $repo has changed and pushed code"
        moduleChanged+=($repo)
    else
        print "Repo $repo is up to date"
    fi
    cd ..
done

echo "The list of module that need to be checked:"
for repo in ${moduleChanged[@]}
do
    echo $repo
done
