#!/bin/bash
date=$1
find ./$date/ -name "*.dav" -exec mv {} ./$date/ \;
find ./$date/ -name "*.dav" | cut -d'/' -f3 | while read LINE; do echo "file '$LINE'" >> ./$date/listOfVideos.txt; done;
ffmpeg -f concat -safe 0 -i ./$date/listOfVideos.txt -c copy ./$date/${date}_FULL.mp4
find ./$date/001 -exec rm -rf {} \;
find ./$date -not -name "${date}_FULL.mp4" -exec rm {} \;
