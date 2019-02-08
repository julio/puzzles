class SuffixFinder
  DICTIONARY = "/usr/share/dict/words"

  # ---------------------------------------------------------------------------
  def initialize(word_length)
    @word_length = word_length
    @suffixes    = Hash.new(0)
    @words       = {}
  end

  # ---------------------------------------------------------------------------
  def already_found?(word)
    @words[word]
  end

  # ---------------------------------------------------------------------------
  def find_common_words
    File.open(DICTIONARY, "r") do |f|
      while word = f.gets
        if word.length == @word_length+1 # +1 for CR
          # sometimes the same word shows up twice, as a 
          # proper noun for example
          word.downcase!
          unless already_found?(word)
            @suffixes[word[1..@word_length-1]] += 1
            @words[word] = :found
          end
        end
      end
    end
    self
  end

  # ---------------------------------------------------------------------------
  def frequencies
    @suffixes = @suffixes.sort {|e1,e2| e2[1] <=> e1[1]}
    counts = Hash.new([])
    @suffixes.each do |suffix|
      counts[suffix[1]] += [suffix[0]]
    end
    counts
  end
  
  # ---------------------------------------------------------------------------
  def output
    counts = frequencies.sort {|e1,e2| e2[0] <=> e1[0]}
    puts "Common suffixes for words of length #{@word_length}"
    counts.each do |c|
      puts "#{c[0]} => #{c[1].join(', ')}" if c[0] > 9
    end
    puts ""
  end
end

# == TEST =====================================================================
3.upto(6) { |length| SuffixFinder.new(length).find_common_words.output }
