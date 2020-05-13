#!/bin/sh -eu

# "set -e" is short for "set -o errexit", that is, abort the script if a
# command returns with a non-zero exit code.

# "set -u" is short for "set -o nounset", that is, abort the script if a
# variable name is dereferenced when the variable hasn't been set.ty

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

# ==========================================================
# handle errors
# ==========================================================

# exit if any statement returns a non-true value
set -euo pipefail

# check if filename was passed
# get usage instruction from the head
# for the error message
if [ $# -eq 0 ]
then
        printf '%s\n' "Missing the file name.\n"
        head -n 6 prosereport.sh
        exit
fi

# check for logs
if [ ! -d logs/ ]
then
    mkdir logs/
fi

# getting the filename which should always be the last argument
# from http://goo.gl/n1gAjm
# It uses the fact that for implicitly loops over the arguments if you don't
# tell it what to loop over, and the fact that for loop variables aren't scoped:
# they keep the last value they were set to.

for last; do true; done
source=$last

# test if file exists
if [ ! -e "$last" ]
then
    printf '%s\n' "Cannot find $last!"
    exit
fi

# ==========================================================
# clean, strip stop-words
# ==========================================================

# check for pandoc and attempt to strip html
# supress output of command check to null device
# if
#     ! command -v pandoc >/dev/null
# then
#     printf "Pandoc not found. Not a big deal. Will skip stripping html characters."
#     clean=$( cat "$source" )
# else
#     clean=$( pandoc -f markdown -t plain "$source" )
# fi
clean=$( cat "$source" )

# get uniq counts minus common english words
# remove punctuation
nopunct=$( printf '%s\n' "$clean" | tr -d "[:punct:]")

# remove blank lines

# everything to lower case
normal=$( printf '%s\n' "$nopunct" | tr '[:upper:]' '[:lower:]' | tr -d '0123456789' )

# remove blank space with grep
# tokenize and sort by frequency
printf '%s\n' "$normal" | tr ' ' '\n' > logs/all-words.txt
grep . logs/all-words.txt | sort | uniq -c | sort -hr > logs/word-count.txt

# remove stowords with set intersection
# comm was a nice trick for set intersection
# but does not work here because we have more than one of
# each word
# comm -23 temp.txt stop-words.txt > temp2.txt
# cut -c 9 was a nice trick too that was not needed
# cat temp2.txt | uniq -c | sort -hr | cut -c 9- | sort > report.log

# cat logs/word-count.txt | grep -vwFf dicts/stop-words.txt > logs/minus-stop.txt
# grep -xF -f dicts/stop-words.txt _
# sort dicts/stop-words.txt logs/all-words.txt | uniq -d > logs/minus-stop.txt
grep -vwF -f dicts/stop-words.txt logs/all-words.txt > logs/minus-stop.txt

# ==========================================================
# word counts
# ==========================================================

# display character and word counts
# wc returns '32143 filename.txt'
# use cut to grab the number only
#chars=$( printf '%s\n' "$clean" | wc -c | cut -d' ' -f1 )
words=$( printf '%s\n' "$clean" | wc -w | cut -d' ' -f1 )

# count sentences

# ==========================================================
# type to token ratio
# ==========================================================

typetoken () {

    # # sample 1k words randomly
    # # only perform STTR on files longer than 1k words
    # #if [ wc -logs/word-count.txt - "$last" ]

    # minlen=1000
    # length=$( wc -l logs/all-words.txt | cut -d' ' -f1 )

    # if [ "$length" -gt "$minlen" ]
    # then
    #     shuf -n "$minlen" logs/all-words.txt > logs/1k-sample.txt
    # fi

    # # count types
    types=$( cat logs/all-words.txt | uniq | wc -l )
    tokens=$( cat logs/all-words.txt | wc -l )

    echo $types
    echo $tokens

    # get type-token ratio
    #
    # ttr=$( printf '%s\n' "scale=2; $types/$minlen" | bc -l )
    #ttr=$( $types/$tokens )
    #return $ttr
}

# ==========================================================
# show everything nicely
# ==========================================================

report () {

    # set the colors
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    bold=$(tput bold)
    normal=$(tput sgr0)

    clear
    printf '%s\n' "    =================================="
    printf '%s\n' "     ${bold}summary for $source"
    printf '%s\n' "    ----------------------------------"
    printf '%s\n' "        ${bold}words:               ${RED}$words${NC}"
    printf '%s\n' "        ${bold}characters:          ${RED}$chars${NC}"
    # printf '%s\n' "        ${bold}type-token ratio:    ${RED}$ttr${NC}"
    # tput sgr0                               # Reset colors to "normal."
    # printf '%s\n' " \r"
    # printf '%s\n' "    ${bold}your 25 most used words are:"
    # tput sgr0                               # Reset colors to "normal."
    # printf '%s\n' " \r"
    # head -n 25 logs/minus-stop.txt | column
    # printf '%s\n' " \r"
}

typetoken
# report
