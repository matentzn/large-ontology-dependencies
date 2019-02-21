#!/bin/sh
OBO=http://purl.obolibrary.org/obo
ROBOT=robot

for ontology in pr ncbitaxon chebi go; do
  rm -f $ontology.obo
  wget --no-check-certificate $OBO"/"$ontology.obo -O $ontology.obo
  robot merge --input $ontology.obo --output $ontology.tmp.obo && mv $ontology.tmp.obo $ontology.obo
  rm -f $ontology.obo.gz
  gzip $ontology.obo 
  rm -f $ontology.owl
  wget --no-check-certificate $OBO"/"$ontology.owl -O $ontology.owl
  robot merge --input $ontology.owl --output $ontology.tmp.owl && mv $ontology.tmp.owl $ontology.owl
  rm -f $ontology.owl.gz
  gzip $ontology.owl
done 