#!/bin/bash
if  [[ $1 == '-h'  || $1 == '--help' ]] ; then
echo "Usage: diffconfig commit1 commit2  : compares .config of two commits"
echo "       diffconfig commit1           : compares commit to curent .config  "
exit 1
fi


KERNEL_SRC=/home/ron/kernel/linux-5.6-rc7
KERNEL_OUT=$PWD
diffconfig=${KERNEL_SRC}/scripts/diffconfig

if [ $# == 1 ] ; then
git show $1:.config > firstcommit
cat .config > secondcommit
elif [ $# == 2 ] ; then
git show $1:.config > firstcommit
git show $2:.config > secondcommit

elif [ $# == 0 ] ;then
git show HEAD:.config > firstcommit
cat .config > secondcommit
else
echo "Too many argumets"
exit 2

fi


KBUILD_OUTPUT=${KERNEL_OUT} $diffconfig firstcommit secondcommit

