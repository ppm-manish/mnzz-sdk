#!/bin/sh
VERSION=1.0.2
echo "pushing $VERSION"

setup_git() {
    echo "setting up git"
  git config --global user.email "manish.kumar@paypermint.in"
  git config --global user.name "ppm-manish"
}

commit_files() {
    echo "commiting files"
    git remote -v
  git checkout master
  git add -f releases/Mnzz-iOS-$VERSION.tar.gz
    echo "git status before commit"
  git status
  git commit --message "Upload framework $VERSION"
    echo "git status after commit"
  git status
    echo "git log after commit"
  git log
}

upload_files() {
    echo "uploading files"
    echo ${TOKEN}
  git remote add origin https://${TOKEN}:x-oauth-basic@github.com/ppm-manish/mnzz-ios.git > /dev/null 2>&1
    git remote -v
    echo "git remote set"
    git pull
    ls -l
  git push -u origin master 
    echo "git log after push"
    git log
}

setup_git
commit_files
upload_files