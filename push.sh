#!/bin/sh
VERSION=1.0.2
echo "pushing $VERSION"

setup_git() {
    echo "setting up git"
  git config --global user.email "manish.kumar@paypermint.in"
  git config --global user.name "ppm-manish"
}

commit_files() {
    echo "git clone mnzz-ios"

    git clone https://${TOKEN}:x-oauth-basic@github.com/ppm-manish/mnzz-ios.git
    mkdir -p mnzz-ios/Framework
    rm mnzz-ios/Framework/*
    cp releases/Mnzz-iOS-$VERSION.tar.gz mnzz-ios/Framework/Mnzz-iOS-$VERSION.tar.gz
    cd mnzz-ios
    
    echo "commiting files"
    git remote -v
    git checkout master
    git add Framework/Mnzz-iOS-$VERSION.tar.gz
    echo "git status before commit"
    git status
    git commit --message "Upload framework $VERSION"
    echo "git status after commit"
    git status
    echo "git log after commit"
    git log
    git push -u origin master 
}

setup_git
commit_files