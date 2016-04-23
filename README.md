## prosecheck

*A clean,^1 powerful, portable prose analysis console for the command line.*

`clean` means it is easy to install and it does something useful out of the
box without complexity. `powerful` means there are smart, advanced options for
those wanting to use them. `portable` means it is written in [POSIX][1] complaint
shell and will work on almost any platform without dependencies.

[1]: http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Portable-Shell.html#Portable-Shell

We do not seek to be authoritative or complete. Rather target sane defaults
and reasonable coverage to help authors write better prose.

## Roadmap

*0.1*
- [x] word, character count
- [x] strip html if pandoc is available
- [ ] common words minus stop words
- [ ] sentence, paragraph count
- [ ] average sentence length
- [ ] reading difficulty
- [ ] sentence length variation
- [ ] sentence to paragraph ratio
- [ ] move development to dash

*0.2*
- [ ] pretty output
- [ ] weasel word index

*0.3*
- [ ] root report (port from nltk)
- [ ] adverb ratio vs. some writer
- [ ] long introductory clause

*0.4*
- [ ] report generation
- [ ] linting
- [ ] port proselint / prosechck

*0.5*
- [ ] .tex, .docx, and .odt support
- [ ] comparison with other authors
- [ ] json output
- [ ] man page

## Installation

TBA

## Similar tools

- [Conky](https://github.com/brndnmtthws/conky)
- [`proselint`](https://github.com/amperser/proselint),
- [`textlint`](https://github.com/textlint/textlint)
