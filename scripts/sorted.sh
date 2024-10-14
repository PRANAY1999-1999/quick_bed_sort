#!/bin/bash

# $1 : list of input files separated by spaces
# $2 : output files

echo $1 | tr ' ' '\n' | while read fname
 
do
    sort -k2 -k3 $fname

done >> $2 
