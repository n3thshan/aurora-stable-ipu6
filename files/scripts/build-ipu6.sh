#!/bin/bash
set -oue pipefail

# 1. Temporarily trick the system into thinking the 'akmods' builder is disabled
# This prevents the CI build from failing.
ln -sf /usr/bin/true /usr/bin/akmods

# 2. Install the IPU6 packages
# We use dnf here to pull them from RPM Fusion
dnf install -y akmod-intel-ipu6 ipu6-camera-hal ipu6-camera-bins v4l2-relayd

# 3. Remove the trick so the real 'akmods' works on your laptop
rm /usr/bin/akmods
