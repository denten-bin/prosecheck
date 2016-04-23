## `prosecheck`

*A clean,<sup>1</sup> powerful,<sup>2</sup> portable<sup>3</sup> prose
analysis console for the [command line][2].*


<sup>1. easy to install and it does something useful out of the box without
complexity</sup><br></sup>
<sup>2. smart, advanced options for those wanting to use them<br></sup>
<sup>3. written in [POSIX][1] complaint shell, easy to install, and working on
almost any platform without dependencies
</sup>

[1]: http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Portable-Shell.html#Portable-Shell
[2]: http://en.flossmanuals.net/command-line/index/

`prosecheck` does not seek to be authoritative or complete. Rather it targets
sane defaults and reasonable coverage to help authors write better prose.

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
- [ ] modularize

*0.3*
- [ ] root report (port from nltk)
- [ ] adverb ratio vs. some writer
- [ ] long introductory clause
- [ ] add tests w/ Travis

*0.4*
- [ ] report generation
- [ ] linting
- [ ] port proselint / prosechck

*0.5*
- [ ] .tex, .docx, and .odt support
- [ ] comparison with other authors
- [ ] json output
- [ ] man page

*0.6*
- [ ] remove dependency on Pandoc to strip html

## Installation, Screenshots

TBA

## Similar tools

- [`conky`](https://github.com/brndnmtthws/conky)
- [`proselint`](https://github.com/amperser/proselint)
- [`textlint`](https://github.com/textlint/textlint)
