#!/bin/bash
set -ouex pipefail

# 1. Download the akmod-intel-ipu6 package
# We use 'dnf download' to fetch the latest version from RPMFusion
echo "Downloading akmod-intel-ipu6..."
dnf download --resolve akmod-intel-ipu6

# 2. Install it using rpm with --noscripts
# This skips the %post scriptlet that tries to build the module immediately
echo "Installing akmod-intel-ipu6 without scripts..."
rpm -Uvh --noscripts akmod-intel-ipu6-*.rpm

# 3. Cleanup the downloaded rpm
rm akmod-intel-ipu6-*.rpm
