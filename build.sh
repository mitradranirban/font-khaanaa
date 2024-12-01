#!/bin/bash

rm -rf fonts
rm -rf build
source venv/bin/activate
fonts2svg -c 000000,00ff00,ffff00,ff0000  sources/ttf/Khaanaa-Black.ttf sources/ttf/Khaanaa-green.ttf \
sources/ttf/Khaanaa-yellow.ttf sources/ttf/Khaanaa-red.ttf
addsvg sources/ttf/SVGs/ sources/ttf/Khaanaa.ttf
maximum_color sources/ttf/Khaanaa.ttf
mkdir -p fonts/ttf fonts/woff2
ttx -x SVG   -o KhaanaColorEmoji.ttx -v build/Khaanaa.keep_glyph_names.added_glyf_colr_1.ttf
ttx -d fonts/ttf/ KhaanaColorEmoji.ttx
ttx -d fonts/woff2/ --flavor woff2 KhaanaColorEmoji.ttx
