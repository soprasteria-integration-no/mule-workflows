#!/bin/bash

# Check if YAML file and sandbox parameter are provided as arguments
if [ $# -lt 2 ]; then
  echo "Usage: $0 <yaml_file> <sandbox>"
  exit 1
fi

# Extract key-value pairs from specified sandbox section in YAML file using yq tool (you may need to install yq first)
sandbox=$2
values=$(yq eval ".$sandbox | to_entries | map(\"-D\" + .key + \"=\" + .value) | join(\" \")" "$1")

# Print output to console
echo "$values"