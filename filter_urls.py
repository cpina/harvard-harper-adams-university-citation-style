#!/usr/bin/env /home/jen/university/msc_harper_adams/git/harper-adams-style/venv/bin/python3

import argparse

import bibtexparser
from bibtexparser.bparser import BibTexParser


def filter_urls_out(input_file_path, output_file_path):
    parser = BibTexParser(common_strings=False)

    # it says that report is non-standard and ignored otherwise
    parser.ignore_nonstandard_types = False

    # avoid touching fields
    parser.homogenise_fields = False

    # read
    bibtex_input_file = open(input_file_path)
    bib_database = bibtexparser.load(bibtex_input_file, parser)

    for entry in bib_database.entries:
        if 'no-url' in entry.get('keywords', []):
            del entry['url']
            print('Should exclude url')

    # write
    bibtex_output_file = open(output_file_path, 'w')
    bibtexparser.dump(bib_database, bibtex_output_file)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Filter out urls from a BibTeX if it has the keyword no-url')
    parser.add_argument('input_file_path')
    parser.add_argument('output_file_path')

    args = parser.parse_args()
    filter_urls_out(args.input_file_path, args.output_file_path)
