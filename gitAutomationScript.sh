#This script is for automating the staging and commiting in git.
#Further I plan to automate of creating a repo on github and connecting it to local git repo. And much more Automation

#Firstly you need to commit unsaved changes, and then add repo to Github.
git add .
echo "Added all files to staging area"
echo $(git status)

echo ""
#If you wish to take a sentence in arguments, use "$1" and if just single words, use $1. Note 1 represents any number.
git commit -m "$1"

