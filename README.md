# Synony.rb

A script to replace words in text with their synonyms.

## Install

Once you have the source locally, install the needed gems.

`bundle install --path=.bundle`

## Usage

Reads text from the filenames given, or stdin, or a combination of the two. Replaces words in the text with their synonyms. The modified text is written to stdout.

```
# From stdin
$ echo "We each stand alone." | bin/synony replace
> We all abide absolute.

# From a file
$ bin/synony replace file1.txt
> We all abide absolute.

# From multiple files
$ bin/synony replace file1.txt file2.txt
> We all abide absolute.
So ace asked, as aim we abide about?

# From multiple files and stdin
$ echo 'Which way do we go!?' |  bin/synony replace file1.txt - file2.txt
> We all abide absolute.
Which access accompany we abide!?
So ace asked, as aim we abide about?
```

## Notes

- Skips over certain common words
- Retains whitespace and punctuation
- Loses capitalization on words
- Chooses the first synonym found
- Leaves original word if no synonym is found

## License

MIT

