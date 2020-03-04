#!/bin/bash
#find . -type f -name '*.png' -print0 | while IFS= read -r -d '' file; do
#    cwebp -q i80 $file -o $file.webp
#done
for file in public/**/**/*.png; do cwebp -q 80 "$file" -o "${file%.*}.webp"; done
