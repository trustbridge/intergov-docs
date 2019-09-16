#!/bin/bash
#
# This script builds the docs.
# It assumes this working copy (intergov-docs/)
# is adjacent to a copy of the intergov codebase
#
# This system is a kludge around a problem with the readthedocs setup.
#
# Do not edit the files in this repo directly,
# your changes will get clobbered!
#
CODE_SRC_DIR=../intergov
DOC_BUILD_DIR=$CODE_SRC_DIR/docs
DOC_SRC_DIR=$(pwd)

cd $DOC_BUILD_DIR
make html
# TODO: delte absent files first
# for file in $(ls) that is not in $KEEP_LIST,
# if it is not in ls ...
cp -r _build/html/* $DOC_SRC_DIR
touch $DOC_SRC_DIR/.nojekyll

#
# Then, commit the changes and push them to GitHub.
# The GitHub Pages mechanism will publish them.
#
# To change the docs, change the document source
# in the $CODE_SRC_DIR and follow normal GitHub PR workflow.
#
