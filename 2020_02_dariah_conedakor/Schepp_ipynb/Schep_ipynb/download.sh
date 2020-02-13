#!/bin/bash -e

PAGE=1

mkdir -p artworks

# fetch all pages of entities in a loop. IF you reuse this code, make sure to
# find the current total amount of results returned by the first page. This
# would then tell you how many pages to fetch, e.g. if you get a total of
# 105234 results, that's 105234 / 500 = 210.460 so you would fetch 211 pages.
while (( PAGE < 204 )); do
  URL="https://kor.uni-frankfurt.de/entities.json?include=datings&kind_id=6&per_page=500&page=$PAGE"
  curl "$URL" > artworks/$PAGE.json
  (( PAGE += 1 ))
done
