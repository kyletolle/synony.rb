# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'synony/version'

module Synony
  class CLI < Thor
    WORDS_TO_SKIP = ['a', 'the', 'of', 'an']

    desc 'replace [FILE ...]', 'Replace each word in files/stdin with a synonym; return the modified text on stdout'
    def replace(filename=nil, *extra_filenames)
      ARGV.shift # Remove the command from the args
      split_up_text = ARGF.read.split(/(\W)/)

      replaced_text =
        split_up_text.map do |fragment|
          next fragment if fragment == ''
          next fragment if fragment =~ /[[:space:]]/
          next fragment if fragment =~ /[[:punct:]]/
          word = fragment.downcase
          next fragment if WORDS_TO_SKIP.include?(word)

          entries = Thesaurus.lookup(word)
          if entries.any?
            new_word = entries.sample.root
            new_word.capitalize! if fragment.chr.match(/[[:upper:]]/)
            next new_word
          else
            next fragment
          end
        end

      $stdout.write(replaced_text.join(''))
    end

    desc 'version', 'Return library version'
    def version
      puts Synony::VERSION
    end
  end
end

