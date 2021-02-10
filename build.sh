#!/bin/bash

export KERNELNAME="BrawlKernel"

export LOCALVERSION=1

export KBUILD_BUILD_USER=Sssira

export KBUILD_BUILD_HOST=DroneCi

export TOOLCHAIN=clang

export DEVICES=whyred

source helper

gen_toolchain

send_msg "Start building OC ${KERNELNAME} ${LOCALVERSION} for ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam -overclock

	build ${i} -newcam -overclock
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "Build succesfully in $((DIFF / 60))m $((DIFF % 60))s"

