# Synony.rb

A script to replace words in text with their synonyms.

## Install

Once you have the source locally, install the needed gems.

`bundle install --path=.bundle`

## Usage

Reads text from the filenames given, or stdin, or a combination of the two. Replaces words in the text with a random synonym. The modified text is written to stdout.

```
# From stdin
$ echo "We each stand alone." | bin/synony replace
> We aside accept orphan.

# From a file
$ bin/synony replace file1.txt
> We severally banister solo.

# From multiple files
$ bin/synony replace file1.txt file2.txt
> We any obstinacy particularly.
So themselves asked, like strength we get off respecting?

# From multiple files and stdin
$ echo 'Which way do we go!?' |  bin/synony replace file1.txt - file2.txt
> We respectively suffer one by one.
Which lay repeat we occurrence?!
So monad asked, like concupiscence we acta current?
```

## Notes

- Skips over certain common words
- Retains whitespace and punctuation
- Loses capitalization on words
- Chooses a random synonym for each word
- Leaves original word if no synonym is found
- Doesn't handle contractions well

## License

MIT

