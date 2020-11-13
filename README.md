# Harvard Harper Adams University citation style

If you want to use the Harper Adams University citation style in CSL format (supported by different reference managers like Zotero, Mendeley) and different writing tools (like LaTeX, Pandoc): download the file `harvard-harper-adams-university.csl` from your reference manager or from (if available) [Citation Ctyle Language](https://github.com/citation-style-language/styles/) repository.

This repository is some tooling that helped us to verify the style and documentation of what we have done. If you only want to use the style you can just download it or find it in your reference manager.

We have prepared a Harper Adams University citation style using the [Citation Style Language](https://citationstyles.org/) format. Here are some examples and documentation on how we have prepared it.

The style is based on the [Harvard Anglia Rusking style](https://github.com/citation-style-language/styles/blob/master/harvard-anglia-ruskin-university.csl) with modifications.

We used the [Guide for Authors](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm) for the Harper Adams University style. Sadly there are some inconsistencies that we have flagged to the librarians. In case of inconsistencies in the examples we have followed the recommendation of the library team.

We have tested this using Zotero only. We used Zotero which allows us to:
 * Force italics in titles: `This article describes <i>name of species</i>`
 * Protect the case: `Cross pollination of ‘Sundrop’ apricot (<span class="nocase">prunus armeniaca</span> L.) <span class="nocase">by</span> honeybees`)
 * Keywords for the `no-url` keyword. Keywords are exported and used by `filter_urls.py` to generate another .bib file to be used 

# What is in this repository?
## bibliography-expected.html

Based on the [Harper Adams Guide for Authors](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm) the HTML output of different documents. This is what we aim to generate.

## document-example.md

A minimal Markdown document citing documents

## harvard-harper-adams-university.csl

The current citation style

## test-style.sh

Test the style: using Pandoc will generates HTML output based on: `document-example.md` text, `documents.bib` BibLaTeX and `harvard-harper-adams-university.csl`

The output will be: `PASS!` or `FAILED!` with information for this.

## tools/filter_urls.py

Script to filter URLs out of based on the `no-url` document keyword.

## requirements.txt

If you want to use `filter_urls.py` you need to install bibtexparser. You can do it doing `pip3 install -r requirements.txt`. Needs Python and pip installed.

## examples/

To be documented and cleaned soon
