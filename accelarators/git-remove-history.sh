#!/bin/zsh
echo "Important !!! Make sure you are Checked out to the Branch in which you want to remove the history"
echo "your Repository URL: (usually looks like https://github.com/example.git) "
read gitURL
git clone $gitURL
if [ $? -eq 0 ]
then
dir=$(basename $gitURL | cut -f1 -d".")
cd $dir
echo "From Which Branch you want to delete the History ? "
read BranchName
git checkout $BranchName
echo "Enter your commit message here:"
read CommitMessage
git checkout --orphan new_br
git add -A
git commit -am "$CommitMessage"
git branch -D $BranchName
git branch -m $BranchName
git push -f origin $BranchName
echo "finished successfully "
fi
