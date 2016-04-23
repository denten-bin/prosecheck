## prosecheck

A simple, powerful, portable prose analysis console for the command line.

**Goals**: To create a lean prose reporting tool without external
dependencies, written in POSIX complaint shell. A report view that gives a
rich, [Conky](https://github.com/brndnmtthws/conky)-like summary of prose
style.

**Non-goals**: Spell check should be done elsewhere. We do not seek to be
authoritative or complete. Rather target sane defaults and reasonable
coverage.

## Roadmap

*0.1*
[x] word, character count
[x] strip html if pandoc is available
[ ] common words minus stop words
[ ] sentence, paragraph count
[ ] average sentence length
[ ] reading difficulty
[ ] sentence length variation
[ ] sentence to paragraph ratio

*0.2*
[ ] pretty output
[ ] weasel word index

*0.3*
[ ] root report (port from nltk)
[ ] adverb ratio vs. some writer
[ ] long introductory clause

*0.4*
[ ] report generation
[ ] linting
[ ] port proselint / prosechck

*0.5*
[ ] .tex, .docx, and .odt support
[ ] comparison with other authors
[ ] json output
[ ] man page

## Installation

TBA

## Similar tools

- [Conky](https://github.com/brndnmtthws/conky)
- [`proselint`](https://github.com/amperser/proselint),
- [`textlint`](https://github.com/textlint/textlint)
