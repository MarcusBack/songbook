#!/bin/bash

cd /home/marcus/Documents/dev/latex/songs
echo "Building songbook.tex"
pdflatex songbook.tex
echo ""
echo "Building index"
ln -s ~/mysongs/share/songs/* .

eco ""
echo "texlua songidx.lua mySongbook.sxd mySongbook.sbx"
texlua songidx.lua mySongbook.sxd mySongbook.sbx
texlua songidx.lua mySongbookAuthor.sxd mySongbookAuthor.sbx

unlink bible.can
unlink catholic.can
unlink greek.can
unlink protestant.can
unlink tanakh.can
unlink songidx.lua

echo ""
echo "Building final songbook"
pdflatex songbook.tex

echo ""
echo "Cleaning up"
rm *.aux

