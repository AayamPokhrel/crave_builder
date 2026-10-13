#!/bin/bash

# Rom source repo
repo init -u https://github.com/The-Clover-Project/manifest.git -b 17 --git-lfs --depth=1 --no-clone-bundle

echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b clover https://github.com/AayamPokhrel/local_manifests.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

/opt/crave/resync.sh

# Export
export BUILD_USERNAME=prabhu
export BUILD_HOSTNAME=crave
export TZ="Asia/Kathmandu"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch clover_stone-userdebug-cp2a
echo "====== lunch Success ======="

# Install clean
mka installclean

# Build rom
mka clover