# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

module Synony
  class CLI < Thor
    WORDS_TO_SKIP = ['a', 'the', 'of', 'an']

    desc "run", "Replace text in STDIN with a synonym, returning the resulting string on STDOUT"
    def replace
      split_up_text = STDIN.read.split(/(\W)/)

      replaced_text =
        split_up_text.map do |fragment|
          next fragment if fragment == ''
          next fragment if fragment =~ /[[:space:]]/
          next fragment if fragment =~ /[[:punct:]]/
          next fragment if WORDS_TO_SKIP.include?(fragment)

          entries = Thesaurus.lookup(fragment)
          if entries.any?
            next entries.first.root
          else
            next fragment
          end
        end

      STDOUT.write(replaced_text.join(''))
    end
  end
end
