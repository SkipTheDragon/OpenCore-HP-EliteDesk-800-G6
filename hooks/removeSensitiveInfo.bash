#!/bin/bash

load_env_file() {
    local file="$1"
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" =~ ^[[:space:]]*([a-zA-Z_][a-zA-Z0-9_]*)[[:space:]]*=[[:space:]]*(.*)[[:space:]]*$ ]]; then
            export "${BASH_REMATCH[1]}"="${BASH_REMATCH[2]}"
        fi
    done < "$file"
}
load_env_file ../.env

# Define the array containing search and replace pairs
search_replace=(
    "$SystemUUID:your-value-here"
    "$SystemUUID2:your-value-here"
    "$SystemSerialNumber:your-value-here"
    "$SystemSerialNumber2:your-value-here"
    "$ROM:your-value-here"
    "$MLB:your-value-here"
)

# Function to perform search and replace
function search_and_replace {
    input_file="$1"
    input_folder="$2"
    cd $input_folder
    for pair in "${search_replace[@]}"; do
        search_term="${pair%%:*}"
        replace_term="${pair#*:}"
        sed -i'' -e "s/$search_term/$replace_term/g" "$input_file"
    done
}

# Example usage
search_and_replace "config.plist" "../EFI/OC/"

echo "Search and replace completed."
