#!/usr/bin/env python3

import bibtexparser
from bibtexparser.bparser import BibTexParser

parser = BibTexParser(common_strings=False)

# it says that report is non-standard and ignored otherwise
parser.ignore_nonstandard_types = False

# avoid touching fields
parser.homogenise_fields = False

# read
bibtex_input_file = open('test_bibliography_ha_style_carles.bib')
bib_database = bibtexparser.load(bibtex_input_file, parser)

for entry in bib_database.entries:
    if 'no-url' in entry.get('keywords', []):
        del entry['url']
        print('Should exclude url')

# write
bibtex_output_file = open('test_output.bib', 'w')
bibtexparser.dump(bib_database, bibtex_output_file)
