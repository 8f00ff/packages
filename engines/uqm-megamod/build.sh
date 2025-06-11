#!/bin/bash

# CLONE PHASE
git clone https://github.com/JHGuitarFreak/UQM-MegaMod.git source
pushd source
git checkout "$COMMIT_TAG"
popd

# BUILD PHASE
cp -rfv ./config.state source
pushd "source"
patch src/config_unix.h.in < ../config_unix.h.in.diff
./build.sh uqm reprocess_config
./build.sh uqm
popd

# COPY PHASE
cp -v source/UrQuanMasters "${diststart}/2645580/dist/uqm-megamod"
cp -v assets/uqm-megamod.sh "${diststart}/2645580/dist/uqm-megamod.sh"
mkdir -p "${diststart}/2645580/dist/megamod/content/packages" "${diststart}/2645580/dist/megamod/content/addons"
echo -e "${COMMIT_TAG}"'\n\n$Format:%ad$' > "${diststart}/2645580/dist/megamod/content/version"
