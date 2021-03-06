#!/bin/sh
cd `dirname $0`
set -e

for FILE in `ls data | head -100`
do
  curl -f --data-binary "@data/$FILE" -H 'Content-type:text/csv; charset=utf-8' 'http://localhost:8983/solandra/reuters/update/csv?commit=true&separator=%09&escape=\&fieldnames=id,text&header=false'
done