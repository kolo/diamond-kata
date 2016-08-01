require_relative 'kata'
require 'minitest/autorun'

class KataSpec < Minitest::Test
  def test_run_with_start_char
    assert_equal('a', Kata.new('a', 'a', 'z').run)
  end

  def test_run_with_valid_input
    assert_equal %w[__a__ _b_b_ c___c _b_b_ __a__].join("\n"),
      Kata.new('c', 'a', 'z').run
  end

  def test_run_with_escape_symbols
    assert_equal %w[__\[__ _\_\_ \]___\] _\_\_ __\[__].join("\n"),
      Kata.new(']', '[', '^').run
  end

  def test_run_with_invalid_input
    assert_equal '', Kata.new('0', 'a', 'z').run
  end
end
