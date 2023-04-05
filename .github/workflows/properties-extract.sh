#!/bin/bash

# Check if YAML file and env parameter are provided as arguments
if [ $# -lt 2 ]; then
  echo "Usage: $0 <yaml_file> <env>"
  exit 1
fi

# Extract key-value pairs from specified env section in YAML file using yq tool (you may need to install yq first), github action supports this
sandbox=$2
values=$(yq eval ".$sandbox | to_entries | map(\"-D\" + .key + \"=\" + .value) | join(\" \")" "$1")

# Print output to console
echo "$values"
