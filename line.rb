class Kata
  class Line
    def initialize(letter)
      @letter = letter
    end

    def beautify(letter)
      line.gsub(/[^#{letter}]/, "_")
    end

    private

    attr_reader :letter

    def line
      @_line = begin
       line = START_CHAR

       cur = START_CHAR.succ
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
