#!/bin/bash

set -ueo pipefail

SOURCE=https://github.com/CRG-CNAG/docker-almalinux-perlbrew
VARIANTS=(base pyenv pyenv3 pyenv-java pyenv3-java pyenv23 pyenv23-java)
BRANCHES=(8)
LATEST=8
BASETAG=biocorecrg/almalinux-perlbrew

TEMPDIR=$HOME/tmp
WORKDIR=$TEMPDIR/docker-almalinux-perlbrew

if [ -d "$WORKDIR" ]; then
	exit 1
fi

mkdir -p $WORKDIR


function dockerBuildPush () {

	cd $1
	GROUP=""
	if [ "${1}" != "base" ]; then
        	GROUP="-$1"
	fi

	TAG=":$3"
 
	docker buildx build --no-cache -t $2$GROUP$TAG .
	docker buildx build --push $2$GROUP$TAG    

	if [ "$3" == $LATEST ]; then
		docker buildx build -t $2$GROUP .
		docker buildx build --push $2$GROUP
    	fi

}


# Iterate branches
for i in ${BRANCHES[@]}; do
	
	cd $WORKDIR

	mkdir ${i}

	CURDIR=$WORKDIR/$i
	cd ${CURDIR}
	
	git clone $SOURCE .

	BRANCH=$i
	if [ "${BRANCH}" == ${LATEST} ]; then
		BRANCH=main
	fi

	git checkout $BRANCH

	for v in ${VARIANTS[@]}; do
		cd $CURDIR
		dockerBuildPush $v $BASETAG $i
	done

			
done

# Clean everything
rm -rf $WORKDIR

