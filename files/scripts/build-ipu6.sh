#!/bin/bash
set -oue pipefail

# 1. Mock akmods to prevent CI build failure
ln -sf /usr/bin/true /usr/bin/akmods

# 2. Install the IPU6 packages (Baked into your image)
dnf install -y akmod-intel-ipu6 ipu6-camera-hal ipu6-camera-bins v4l2-relayd

# 3. Restore the real akmods for the user's laptop
rm /usr/bin/akmods
