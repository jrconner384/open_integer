require 'minitest/autorun'
require 'open_integer'

describe Integer do
  it 'says abundant numbers are neither deficient nor perfect' do
    (2..10_000).map do |num|
      if num.abundant?
        num.deficient?.must_equal false
        num.perfect?.must_equal false
      end
    end
  end

  it 'says deficient numbers are neither abundant nor perfect' do
    (2..10_000).map do |num|
      if num.deficient?
        num.abundant?.must_equal false
        num.perfect?.must_equal false
      end
    end
  end

  it 'says perfect numbers are neither abundant nor deficient' do
    (2..10_000).map do |num|
      if num.perfect?
        num.abundant?.must_equal false
        num.deficient?.must_equal false
      end
    end
  end

  it 'says non-abundant numbers are either deficient XOR perfect' do
    (2..10_000).map do |num|
      (num.deficient? ^ num.perfect?).must_equal(true) unless num.abundant?
    end
  end

  it 'says non-deficient numbers are either abundant XOR perfect' do
    (2..10_000).map do |num|
      (num.abundant? ^ num.perfect?).must_equal(true) unless num.deficient?
    end
  end

  it 'says non-perfect numbers are either abundant XOR deficient' do
    (2..10_000).map do |num|
      (num.abundant? ^ num.deficient?).must_equal(true) unless num.perfect?
    end
  end

  it 'throws a RuntimeError when calling 0.factor_of? n' do
    err = -> { 0.factor_of? 1 }.must_raise RuntimeError
    err.message.must_match 'Zero is not a factor of anything.'
  end

  it 'throws a RuntimeError when calling #factors on numbers less than 2' do
    err = -> { 1.factors }.must_raise RuntimeError
    err.message.must_match 'Integers less than 2 do not have proper factors.'
  end

  it 'throws a RuntimeError when calling #divisors on numbers less than 1' do
    err = -> { 0.divisors }.must_raise RuntimeError
    err.message.must_match 'Integers less than 1 do not have proper divisors.'
  end
end
