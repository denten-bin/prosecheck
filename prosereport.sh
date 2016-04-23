#!/bin/sh
# Usage:
#           sh prosereport.sh [-s|-l] filename.md
#
#           -s short report (not implemented yet)
#           -l long report (not implemented yet)
#
# Assumptions:
#           * assume clean .txt or .markdown
#           * strip comments if pandoc is available
#           * assume your paragraphs are separated by newlines


## check if filename was passed
## get usage instruction from the head
## for the error message
if [ $# -eq 0 ]
then
        echo "Missing the file name.\n"
        head -n 6 prosereport.sh
        exit
fi

# getting the filename which should always be the last argument
# from http://goo.gl/n1gAjm
# It uses the fact that for implicitly loops over the arguments if you don't
# tell it what to loop over, and the fact that for loop variables aren't scoped:
# they keep the last value they were set to.

for last; do true; done
source=$last

# check for pandoc and attempt to strip html
# supress output of command check to null device
if
    ! command -v pandocx >/dev/null
then
    echo "Pandoc not found. Not a big deal. Will skip stripping html characters."
    clean=$( cat $source )
else
    clean=$( pandoc -f markdown -t plain "$source")
fi

# display character and word counts
# wc returns '32143 filename.txt'
# use cut to grab the number only
words=$( echo $clean | wc -w | cut -d' ' -f1 )
chars=$( echo $clean | wc -c | cut -d' ' -f1 )

# get sentence counts

# get uniq counts minus common english words

# show everything
echo "words: ""$words"
echo "characters: ""$chars"

# clean up
