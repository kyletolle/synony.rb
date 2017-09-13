# Synony.rb

A script to replace words in text with their synonyms.

## Install

Once you have the source locally, install the needed gems.

`bundle install --path=.bundle`

## Usage

Pass the text you wish synonymized in to STDIN. The replaced text will be available via STDOUT.

```
$ echo "We each stand alone." | bin/synony replace
We all abide absolute.
```

## License

MIT

