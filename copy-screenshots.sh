#!/bin/bash
languages="ar de en es fr hi id ja ko pt ru zh-CN zh-TW"
for lang in $languages; do
    convert ~/Documents/projects/timecop-screenshots/ios/light/$lang/iPhone\ Xs\ Max-Portrait-dashboard.png ~/Documents/projects/timecop-screenshots/ios-mask.png -alpha Off -compose CopyOpacity -composite -trim ./public/$lang/images/timecop-screenshot-iphone-x.png
    convert ~/Documents/projects/timecop-screenshots/ios/dark/$lang/iPhone\ Xs\ Max-Portrait-dashboard.png ~/Documents/projects/timecop-screenshots/ios-mask.png -alpha Off -compose CopyOpacity -composite -trim ./public/$lang/images/timecop-screenshot-iphone-x-dark.png
done
cp ./public/en/images/timecop-screenshot-iphone-x.png ./public/images/timecop-screenshot-iphone-x.png
cp ./public/en/images/timecop-screenshot-iphone-x-dark.png ./public/images/timecop-screenshot-iphone-x-dark.png

for file in public/**/*.png; do
    cwebp -q 50 "$file" -o "${file%.*}.webp";
done