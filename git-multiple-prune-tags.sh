#/bin/bash

for name in */
do
	echo "Prune tag for repo $name"
	cd $name
	git fetch --prune origin '+refs/tags/*:refs/tags/*'
	cd ..
done
