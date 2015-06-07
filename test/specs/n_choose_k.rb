require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'always returns 1 if k equals 0' do
    (1..10_000).each do |n|
      n.choose(0).must_equal 1
    end
  end

  it 'fails if k < 0' do
    (-1..-10_000).each do |k|
      err = -> { 1.choose k }.must_raise RuntimeError
      err.message.must_match(
        'This implementation of n choose k only works for n >= k >= 0.')
    end
  end

  it 'fails if n < 0' do
    (-1..-10_000).each do |n|
      err = -> { n.choose 1 }.must_raise RuntimeError
      err.message.must_match(
        'This implementation of n choose k only works for n >= k >= 0.')
    end
  end

  it 'returns 1 for 0.choose 0' do
    0.choose(0).must_equal 1
  end

  it 'return 1 for n choose n' do
    (1..10_000).each do |n|
      n.choose(n).must_equal 1
    end
  end
end
