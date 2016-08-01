class Kata
  class Line
    def initialize(letter, start_char = START_CHAR)
      @letter = letter
      @start_char = start_char
    end

    def beautify(letter)
      line.gsub(/[^#{Regexp.escape(letter)}]/, "_")
    end

    private

    attr_reader :letter, :start_char

    def line
      @_line = begin
       line = start_char

       cur = succ(start_char)
       while cur <= letter
         line = cur + line + cur
         cur = succ(cur)
       end

       line
      end
    end

    def succ(letter)
      (letter.ord + 1).chr
    end
  end
end
