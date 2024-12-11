#!/bin/bash
rm -rf sources/ttf
mkdir sources/ttf
cd sources/sfd
./generate.pe *.sfd
cd ../..
mv sources/sfd/*.ttf sources/ttf/
rm -rf fonts
rm -rf build

source venv/bin/activate
fonts2svg -c 000000,00ff00,e3ab45,ff0000  sources/ttf/Khaanaa-black.ttf sources/ttf/Khaanaa-green.ttf \
sources/ttf/Khaanaa-yellow.ttf sources/ttf/Khaanaa-red.ttf
addsvg sources/ttf/SVGs/ sources/ttf/Khaanaa.ttf
maximum_color --colr_version 0 --bitmaps sources/ttf/Khaanaa.ttf
mkdir -p fonts/otsvg fonts/ttf fonts/woff2 fonts/cbdt
cp sources/ttf/Khaanaa.ttf fonts/otsvg/
ttx -x SVG -x FFTM  -o KhaanaaColorEmoji.ttx -v build/Khaanaa.keep_glyph_names.added_glyf_colr_0.ttf
ttx -x SVG -x FFTM -o KhaanaaCBDT.ttx -v build/Khaanaa.added_cbdt.ttf
ttx -d fonts/ttf/ KhaanaaColorEmoji.ttx
ttx -d fonts/woff2/ --flavor woff2 KhaanaaColorEmoji.ttx
ttx -d fonts/cbdt/ KhaanaaCBDT.ttx
mv KhaanaaColorEmoji.ttx sources/ttx/
mv KhaanaaCBDT.ttx sources/ttx/
cp -r sources/ttf/SVGs public/
cp fonts/woff2/* public/woff2/* 
