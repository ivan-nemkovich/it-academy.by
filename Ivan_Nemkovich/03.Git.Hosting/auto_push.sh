#!/bin/bash

# This script pushes to remote repositories automatically

for repository in $(git remote)
do
	git push $repository --all
	echo "Pushing to $repository"
done
echo "Done"
