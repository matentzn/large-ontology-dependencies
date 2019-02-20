#!/bin/sh
OBO=http://purl.obolibrary.org/obo

rm pr.obo
wget --no-check-certificate $OBO/pr.obo -O pr.obo
rm pr.obo.gz
gzip pr.obo 

wget --no-check-certificate $OBO/pr.obo -O pr.owl
rm pr.owl.gz
gzip pr.owl

wget --no-check-certificate $OBO/nbcbitaxon.owl -O nbcbitaxon.owl
rm nbcbitaxon.owl.gz
gzip nbcbitaxon.owl 