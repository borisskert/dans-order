# dans-order

This repo is a solution for a college's problem. He needs the perfect order for his guitar tunings.

## Build

To build this project you will need [Haskell Tool Stack](https://docs.haskellstack.org).

```shell
$ stack build
```

## Run tests

```shell
$ stack test
```

## Usage

### Help

```shell
$ stack run -- -h
dansorder - Dan\'s Order of Guitar Tunings

Usage: dansorder [JSON-INPUT]
                 [-f|--file JSON-INPUT-FILE]
                 [-h|--help]

Available options:
  --help         Show this help text
  --file         Reads contents of a specified JSON file
```

### Process input

This program takes input in JSON format. 

```shell
$ stack run -- [\"F#ADGHE\",\"EADGHE\",\"DAC#EHE\",\"DADF#AD\",\"DGDGAD\",\"CGDGAD\",\"HGDGAD\",\"CGCGAD\",\"D#BCGBD\"]
```

#### Output

```
["F#ADGHE","EADGHE","DAC#EHE","DADF#AD","DGDGAD","CGDGAD","HGDGAD","CGCGAD","D#BCGBD"]
```
