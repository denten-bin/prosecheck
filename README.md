## prosereport

A simple, powerful prose reporting tool for the command line.

**Goals**: To create a lean, minimally invasive prose reporting tool, without
external dependencies, written in pure Shell.  Portability through POSIX
compliance. A report view that gives a rich,
[Conky](https://github.com/brndnmtthws/conky)-like summary of prose style.
Develop iteratively.

**Non-goals**: Spell check should be done elsewhere. We do not seek to be
authoritative or complete. Rather target sane defaults and reasonable
coverage.

## Feature list

[x] word, character count
[ ] sentence, paragraph count
[ ] strip html if pandoc is available
[ ] Common words minus stop words
[ ] ignore HTML
[ ] reading difficulty
[ ] average sentence length
[ ] sentence length variation
[ ] weasel word index
[ ] sentence to paragraph ratio
[ ] root report (port from nltk)
[ ] latinate word index
[ ] adverb ratio vs. some writer
[ ] long introductory clause
[ ] a few sample texts with each metric comparative

## Similar tools

[Conky](https://github.com/brndnmtthws/conky)
