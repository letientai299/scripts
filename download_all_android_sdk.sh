#!/bin/bash
# Install all non-obsolete android sdk packages.

function install_sdk {
  android update sdk -u -s -a -t "$1"
}



# install_sdk 163

function fetch_non_obsoled_package_indices {
  # Fetch the sdk list
  android list sdk -u -s -a |\
    # Filter obsoleted packages
    sed '/\(Obsolete\)/d' |\
    # Filter to take only the package index
    sed 's/^[ ]*\([0-9]*\).*/\1/' |\
    # Filter the empty lines
    sed -n 's/^[^ $]/\0/p'
    # Send the output to the for loop one by one
}



for package_index in  $(fetch_non_obsoled_package_indices)
do
  echo -ne "y" | install_sdk "${package_index}"
  echo "====================================================================="
  echo.
done
