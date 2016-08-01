require_relative "line"

class Kata
  START_CHAR = 'A'
  END_CHAR = 'Z'

  def initialize(input)
    @input = input
  end

  def run
    return '' if input < START_CHAR  || input > END_CHAR
    lines.join("\n")
  end

  private

  attr_reader :input

  def lines
    lines = [beautified_line(input)]

    cur = prec(input)
    while cur >= START_CHAR
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
    @line ||= Line.new(input)
  end

  def prec(letter)
    (letter.ord - 1).chr
  end
end

puts Kata.new('C').run
