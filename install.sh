#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
CURRENT_DIR=$(pwd)

# Find all files to link
FILES=$(find "$CURRENT_DIR" \
            -type f \
            -not -path "${CURRENT_DIR}/.git/*" \
            -not -path "${CURRENT_DIR}/.gitignore" \
            -not -path "${CURRENT_DIR}/README.md" \
            -not -path "${CURRENT_DIR}/install.sh")

# Create symbolic links in home directory
for FILE in $FILES; do
    RELATIVE_PATH="${FILE/$CURRENT_DIR\/}"
    TARGET_PATH="${HOME}/${RELATIVE_PATH}"

    # Check if the file exists
    if [[ ! -f "$TARGET_PATH" || ! -L "$TARGET_PATH" ]]; then
        PARENT_DIR=$(dirname "$TARGET_PATH")

        # Create the parent directory if needed
        if [ ! -d "$PARENT_DIR" ]; then
            echo "DIRECTORY: $PARENT_DIR"
            mkdir -p "$PARENT_DIR"
        fi

        # Create the symbolic link
        echo "SYMLINK: $TARGET_PATH -> $FILE"
        ln -s -f "$FILE" "$TARGET_PATH"
    fi
done
