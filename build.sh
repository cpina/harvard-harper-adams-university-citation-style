#!/bin/bash

set -e
set -u

mkdir -p tmp
output_file="tmp/bibliography-actual.html"
expected_file="bibliography-expected.html"

./filter_urls.py test_bibliography_ha_style_carles.bib test_bibliography_ha_style_no_urls.bib

pandoc --pdf-engine=xelatex \
	--bibliography test_bibliography_ha_style_no_urls.bib \
	--csl harvard-harper-adams-university.csl \
	-f markdown example-citations.md \
	-o "$output_file"

echo "$output_file done"
if cmp "$output_file" "$expected_file"
then
	echo "Same files!"
else
	echo "Some differences"
	echo
	echo "diff -u "$output_file" "$expected_file"| ydiff -s --wrap"
	echo
	echo "vimdiff +\"windo set wrap\" \"$output_file\" \"$expected_file\""
fi
