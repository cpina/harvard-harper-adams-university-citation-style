# Harvard Harper Adams University citation style

**This repository and style file is not endorsed by the Harper Adams University.**

This repository contains: 

* [Harper Adams University citation style](#use-harper-adams-university-citation-style) in CSL format
* [Background](#background) on the style
* [Files](#files-in-the-repository) description of the files and how to use them

## Use Harper Adams University citation style

To use the Harper Adams University citation style in CSL format with reference managers and different writing tools (such as LaTeX, Pandoc, RMarkdown): download the file `harvard-harper-adams-university.csl` from your reference manager (e.g. Zotero, Mendeley) or from the [Citation Ctyle Language](https://github.com/citation-style-language/styles/) repository (if available).

## Background

This repository contains some [tooling](#tools) that helped us to verify the style and documentation of what we have done to put this style together. This background information is not necessary to use the style (see the [Quick start](#quick-start) section) but this particular section will explain how it was put together. 

We have prepared a Harper Adams University citation style using the [Citation Style Language](https://citationstyles.org/) format. Here are some examples and documentation on how we have prepared it.

The style is based on the [Harvard Anglia Ruskin style](https://github.com/citation-style-language/styles/blob/master/harvard-anglia-ruskin-university.csl) with modifications (this was the closest example we could find to get started).

We used the [Guide for Authors](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm) to tweak it to conform to the Harper Adams University style. Sadly there are some inconsistencies between recommendations and examples, that we have flagged to the librarians. In case of inconsistencies in the examples we have followed, the recommendation of the library team.

### Style verification

Not all of the potential reference types have been tested and fully checked due to time constraints. As far as we are aware, the following types have been verified against the [Guide for Authors Referencing Examples A to Z](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=#ref-examples):

* [Book with author (print and online)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=B#Book-with-author-(print-and-online-that-have-full-publication-details)) 
* [Book with editor (print and online)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=B#Book-with-an-editor-(print-and-online-that-have-full-publication-details))
* [Command paper and white paper](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=C#Command-paper-and-white-paper)
* [Journal article (online only)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=J#Journal-article-(online-only))
* [Journal article (print and online content the same)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=J#Journal-article-(where-the-print-and-online-content-is-exactly-the-same))
* [Market/consumer report (print)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=M#Market/consumer-report-(print))
* [Market/consumer report and market information (online)](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=M#Market/consumer-report-and-market-information-(Online))
* [Online Farm (virtual farm) data](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm?title=O#Online-Farm-(virtual-farm)-Data)

Each of these types can be see in the `documents.bib` and `expected.html` files. There are also an additional four examples which are not in the Harper Adams Guide for Authors. 
More types will be verified as time allows. 

### Known errors

 * For the document with author "IGD (Institute of Grocery Distribution)" (see document in "Market/consumer report (print)"): the guide for authors says that the citation should be **(IGD, 2008)** but the reference should be **IGD (Institute of Grocery Distribution). 2008. UK grocery retail outlook. Watford: IGD.** As far as we know currently the citation style language does not support short and long author names.

### Testing 

We have tested this using [Zotero](http://zotero.org/) with [Better BibTeX plugin](https://retorque.re/zotero-better-bibtex/installation/) using the exporter `Better BibLaTeX` which allows us to:

 * Force italics in titles: `This article describes <i>names of species</i>`
 * Protect the case: `Cross pollination of ‘Sundrop’ apricot (<span class="nocase">prunus armeniaca</span> L.) <span class="nocase">by</span> honeybees`)
 * Keywords for the `no-url` keyword. Keywords are exported and used by `filter_urls.py` to generate another .bib file to be used 

See the file [test-style.sh](#test-stylesh)

## Files in the repository

### expected.html

Based on the [Harper Adams Guide for Authors](https://www.harper-adams.ac.uk/university-life/library/study-skills/citing-and-referencing.cfm) the HTML output of different documents. This is what we aim to generate and correspond to the examples explained in the [verification](#style-verification) section.

### document-example.md

A minimal Markdown document citing documents.

### harper-adams-university-harvard.csl

The current citation style.

### test-style.sh

Test the style: using Pandoc, this will generates HTML output based on: `document-example.md` text, `documents.bib` BibLaTeX and `harper-adams-university-harvard.csl`.

The output will be: `PASS!` or `FAILED!` with information for this.

### tools/filter_urls.py

Script to filter URLs out of the reference based on the `no-url` document keyword.

### requirements.txt

If you want to use `filter_urls.py` you need to install bibtexparser. This can be done using `pip3 install -r requirements.txt`. Needs Python and pip installed.

### examples/

To be documented and cleaned soon.


Jen Thomas, Carles Pina Estany
November 2020
