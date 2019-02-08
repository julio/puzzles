require "stringio"

class SuffixFinder
  # ---------------------------------------------------------------------------
  def initialize
    @suffixes = Hash.new(0)
    @words    = {}
  end

  # ---------------------------------------------------------------------------
  def find_common_words(options)
    source      = options[:source] || File.open("/usr/share/dict/words", "r")
    word_length = options[:word_length]

    source.each_line do |word|
      word.strip!
      if word.length == word_length
        # sometimes the same word shows up twice, as a
        # proper noun for example
        word.downcase!
        unless already_found?(word)
          @suffixes[word[1..word_length-1]] += 1
          @words[word] = :found
        end
      end
    end
    source.close
    self
  end

  # ---------------------------------------------------------------------------
  def frequencies(options={:word_length => 4})
    find_common_words(options)

    @suffixes = @suffixes.sort {|e1,e2| e2[1] <=> e1[1]}
    counts = Hash.new([])
    @suffixes.each do |suffix|
      counts[suffix[1]] += [suffix[0]]
    end
    counts = counts.sort {|e1,e2| e2[0] <=> e1[0]}

    yield(counts) if block_given?

    counts
  end

  private

  # ---------------------------------------------------------------------------
  def already_found?(word)
    @words[word]
  end
end

require "test/unit"

class SuffixFrequencyTest < Test::Unit::TestCase
  def test_should_know_the_number_of_times_the_most_common_suffix_is_for_4_letter_words
    prefixes_sorted_by_frequency = SuffixFinder.new.frequencies # default word_length is 4
    assert_equal 17, prefixes_sorted_by_frequency[0][0] # [frequency][suffix]
  end
  def test_should_know_the_most_common_suffix_in_4_letter_words
    # In this example, the most common prefix is "234" with 11 occurrences.
    # Followed by "123" and "345" with 10 occurrences each,
    # followed by a single occurrence of "ooo" (not case sensitive)
    words = %{
      A123\nB123\nC123\nD123\nE123\n
      A234\nB234\nC234\nD234\nE234\nF234\nG234\nH234\nI234\nJ234\nK234\n
      F123\nG123\nH123\nI123\nJ123\n
      Zooo\nZOOO\nZOoO\n
      A345\nB345\nC345\nD345\nE345\nF345\nG345\nH345\nI345\nJ345\n
    }

    expected = [
        [11, ["234"]],
        [10, ["123", "345"]],
        [1,  ["ooo"]]
      ]

    result = SuffixFinder.new.frequencies(
      :word_length => 4,
      :source      => StringIO.new(words, "r+"))

    assert_equal expected, result
  end
  def test_show_frequencies
    3.upto(6) do |length|
      SuffixFinder.new.frequencies(:word_length => length) do |counts|
        puts "Common suffixes for words of length #{length}"
        counts.each { |c| puts "#{c[0]} => #{c[1].join(', ')}" if c[0] > 9 }
        puts ""
      end
    end
  end
end
