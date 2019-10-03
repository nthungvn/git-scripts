#/bin/bash

# project=( list of folder seprate by space)
# echo "${project[@]}"
for name in */
do
	echo "Prune tag for repo $name"
	cd $name
	git fetch --prune origin '+refs/tags/*:refs/tags/*'
	cd ..
done
$SHELL

