#!/binbash
# Install all non-obsolete android sdk packages.
# author: Tai Le Tien (letientai299 at gmail.com)

function install_sdk {
  android update sdk -u -s -a -t "$1"
}

function fetch_non_obsoled_package_indices {
  # Fetch the sdk list using non-https connections
  android list sdk -u -s -a |\
    # Filter obsoleted packages
    sed '/\(Obsolete\)/d' |\
    # Filter to take only the index number of package
    sed 's/^[ ]*\([0-9]*\).*/\1/' |\
    # Remove the empty lines
    sed -n 's/^[^ $]/\0/p'
}

for package_index in  $(fetch_non_obsoled_package_indices)
do
  echo "====================================================================="
  echo "Start to install package:  ${package_index}"
  echo "====================================================================="
  # Auto accept license
  echo -e "y" | install_sdk "${package_index}"
  echo
  echo
done
