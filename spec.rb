require_relative 'kata'
require 'minitest/autorun'

class KataSpec < Minitest::Test
  KATA_TESTS = [
    ['a', 'a'],
    ['c', %w[__a__ _b_b_ c___c _b_b_ __a__].join("\n")]
  ]

  def test_run
    KATA_TESTS.each do |(input, expected)|
      assert_equal(expected, result(input))
    end
  end

  def test_run_with_invalid_input
    assert_equal '', result('0')
  end

  private

  def result(input)
    Kata.new(input).run
  end
end
