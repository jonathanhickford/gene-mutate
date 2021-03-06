gene-mutate
===========

## Description
Given a Fasta formatted reference gene transcript file, asks for which protein (1 indexed, bioinformatics style) is mutated, which position in the codon is mutated and what base it is mutated too.  It then returns information about the reference protein and mutated protein.


## Build Status
[![Build Status](https://api.shippable.com/projects/546b1f84d46935d5fbbde453/badge?branchName=master)](https://app.shippable.com/projects/546b1f84d46935d5fbbde453/builds/latest)

## Installation and Usage

```shell
bundle install
ruby run.rb FASTA_FILE
#FASTA_FILE is the path to a Fasta formatted file, it must contain at least the cDNA transcripts, Coding sequences (CDS) and Ammino acid sequences
```

## Example
### Input
```shell
Protein Number?  1
Which base has been substituted within the protein (xyz)?  x
Which base has it been substituted to (actg)?  t
```

### Output
```shell
Reference protein: M
Reference protein names: ["methionine"]
Regerence protein codes: ["Met"]
Reference codon: atg

Mutated protein: L
Mutated protein names: ["leucine"]
Mutated protein codes: ["Leu"]
Mutated codon: ttg
```

