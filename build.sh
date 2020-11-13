#!/bin/bash

set -e
set -u

BIBTEX_FILE="test_bibliography_ha_style_examples.bib"

mkdir -p tmp
OUTPUT_HTML_FILE="tmp/bibliography-actual.html"
OUTPUT_PDF_FILE="tmp/bibliography-actual.pdf"
OUTPUT_MARKDOWN_FILE="tmp/bibliography-actual.md"
EXPECTED_FILE="bibliography-expected.html"

# removes urls if they are tagged as no-urls
./filter_urls.py "$BIBTEX_FILE" test_bibliography_ha_style_no_urls.bib

for OUTPUT_FILE in "$OUTPUT_HTML_FILE" # "$OUTPUT_PDF_FILE" "$OUTPUT_MARKDOWN_FILE"
do
	pandoc --pdf-engine=xelatex \
		--bibliography test_bibliography_ha_style_no_urls.bib \
		--csl harvard-harper-adams-university.csl \
		-f markdown example-citations.md \
		-o "$OUTPUT_FILE"
	echo "Generated file: $OUTPUT_FILE"
done

echo
echo "Expected file : $EXPECTED_FILE"

if cmp "$OUTPUT_HTML_FILE" "$EXPECTED_FILE" > /dev/null
then
	echo
	echo "PASS! (generated and expected HTML files are the same)"
else
	echo
	echo "FAILED! (generated and expected HTML are not the same)"
	echo
	# echo "diff -u "$output_file" "$expected_file"| ydiff -s --wrap"
	echo "See differences with:"
	echo "vimdiff +\"windo set wrap\" \"$(pwd)/$OUTPUT_HTML_FILE\" \"$(pwd)/$EXPECTED_FILE\""
fi
