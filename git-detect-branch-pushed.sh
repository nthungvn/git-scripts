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

modules=*/

for repo in ${modules[@]}
do
    cd $repo
    print ""

    echo "The repo: $repo is in-progressing"

    git checkout $branch > /dev/null 2>&1
    git pull origin > /dev/null 2>&1

    latest_tag_hash=`git rev-list --tags --max-count=1`
    latest_tag=`git describe --tags $latest_tag_hash`
    print "   - The latest tag $latest_tag with hash $latest_tag_hash"

    latest_commit_hash=`git rev-parse HEAD`
    print "   - The latest commit hash $latest_commit_hash"

    numberOfCommitFromParent=`git rev-list --count $latest_commit_hash ^$latest_tag`

    if [ $numberOfCommitFromParent -gt 1 ]; then # We compare with 1 due to we skip 1 commit increase version
        print "Repo $repo has changed and pushed code due to has $numberOfCommitFromParent from parent"
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
