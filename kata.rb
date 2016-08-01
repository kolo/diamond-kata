require_relative "line"

class Kata
  START_CHAR = 'a'
  END_CHAR = 'z'

  def initialize(input, start_char = START_CHAR, end_char = END_CHAR)
    @input = input
    @start_char = start_char
    @end_char = end_char
  end

  def run
    return '' if input < start_char  || input > end_char
    lines.join("\n")
  end

  private

  attr_reader :input, :start_char, :end_char

  def lines
    lines = [beautified_line(input)]

    cur = prec(input)
    while cur >= start_char
      cur_line = beautified_line(cur)
      lines = lines.push(cur_line).unshift(cur_line)

      cur = prec(cur)
    end

    lines
  end

  def beautified_line(letter)
    line.beautify(letter)
  end

  def line
    @line ||= Line.new(input, start_char)
  end

  def prec(letter)
    (letter.ord - 1).chr
  end
end
