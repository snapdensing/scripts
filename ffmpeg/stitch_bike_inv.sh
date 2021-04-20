#!/bin/bash
# Stitches together MOV files from action cam mounted on bike
# Rotates footage by 180 degrees (action cam mounted inverted)
ls *.MOV > list.txt
sed -i -e 's/^/file\ \x27/' list.txt
sed -i -e 's/$/\x27/' list.txt
ffmpeg -f concat -safe 0 -i list.txt -c copy temp.mkv
ffmpeg -i temp.mkv -vf "transpose=1,transpose=1" output.mp4
rm -rf temp.mkv
rm -rf list.txt
