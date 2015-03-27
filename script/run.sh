#!/bin/bash

BOOKID="$1"
ARCHIVE="/media/archive"

#DIRECTORY_STRUCTURE="[TYPE]/[FORMAT]"

#TYPE_MASTER="master"
#TYPE_DERIVATIVE="derivatives"

#INPUT_PRIORITY="EPUB,DTBook,HTML,DAISY 2.02,ZedAI"

##################################################################
########## Parse input arguments and locate input book ###########
##################################################################


if [ -z "$BOOKID" ]; then
    echo "book id is not set; please provide the book id as the first argument"
    exit
fi

if [ "`echo "$BOOKID" | grep -v "/" | wc -l`" = "0" ]; then
    echo "\"$BOOKID\" is not a book ID"
    exit
fi

FILETYPE="UNKNOWN"
INPUT_PATH=""
if [ "`find "$ARCHIVE"/*/*/* -maxdepth 0 -type d | sed 's/.*\///' | grep "$BOOKID"`" = "$BOOKID" ]; then
    FILETYPE="DIRECTORY"
    INPUT_PATH="`find "$ARCHIVE"/*/*/* -maxdepth 0 -type d | grep "$BOOKID\$"`"
    
elif [ "`find "$ARCHIVE"/*/*/* -maxdepth 0 -type f | sed 's/.*\///' | sed 's/\..*//' | grep "$BOOKID"`" = "$BOOKID" ]; then
    FILETYPE="FILE"
    EXTENSION="`find "$ARCHIVE"/*/*/* -maxdepth 0 -type f | sed 's/.*\///' | grep "^$BOOKID\." | sed 's/.*\.//'`"
    echo "extension: $EXTENSION"
    INPUT_PATH="`find "$ARCHIVE"/*/*/* -maxdepth 0 -type f | grep "$BOOKID.$EXTENSION\$"`"
    
else
    echo "there are no books in the archive with the book id \"$BOOKID\""
    exit
fi

echo "input path: $INPUT_PATH"

EPUB_TYPE=""
EPUB_PATH=""
EPUBOCF_TYPE=""
EPUBOCF_PATH=""
DTBOOK_TYPE=""
DTBOOK_PATH=""
DAISY202_TYPE=""
DAISY202_PATH=""
PEF_TYPE=""
PEF_PATH=""
ZEDAI_TYPE=""
ZEDAI_PATH=""
DAISY3_TYPE=""
DAISY3_PATH=""
HTML_TYPE=""
HTML_PATH=""

INPUT_FORMAT="`echo "$INPUT_PATH" | sed 's/\/[^/]*\$//' | sed 's/^.*\///'`"
if [ "`echo "$INPUT_FORMAT" | grep / | wc -l`" = "1" ]; then
    echo "unable to parse input format: \"$INPUT_FORMAT\" based on path: \"$INPUT_PATH\""
    exit
fi

echo "input format: $INPUT_FORMAT"

##################################################################
########## Parse input arguments and locate input book ###########
##################################################################

echo "TODO: invoke validations and conversions here"







exit # below are just notes

nordic-epub3-validator
nordic-epub3-asciimath-to-mathml



output formats:
epub, daisy3, daisy202, html, dtbook, zedai, pef

epub
 * nordic-epub3-validator
 * nordic-epub3-asciimath-to-mathml
 * nordic-epub3-to-dtbook
 * nordic-epub3-to-html
 * epub3-to-daisy202
 * 
 

conversion paths:

epub3-to-