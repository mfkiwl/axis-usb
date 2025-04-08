#!/bin/bash
# Use TMP dir to clone
TMP=`mktemp --directory`
pushd ${TMP}
git clone --depth=1 https://github.com/psuggate/axi-ddr3-lite.git
cd axi-ddr3-lite
git checkout 1952d91976bb5ec6912a0f1a99de8148fbab9e1f
popd
mkdir -p axi-ddr3-lite/sim
cp -a ${TMP}/axi-ddr3-lite/bench/ddr3.v axi-ddr3-lite/sim/
cp -a ${TMP}/axi-ddr3-lite/bench/*.vh axi-ddr3-lite/sim/
cp -a ${TMP}/axi-ddr3-lite/rtl/* axi-ddr3-lite/
cp -a ${TMP}/axi-ddr3-lite/*.md axi-ddr3-lite/
echo "removing temp directory ${TMP}"
rm -rf ${TMP}
