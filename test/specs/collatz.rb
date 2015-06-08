require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'always returns n/2 for all even n' do
    (2..10_000).each do |n|
      n.next_in_collatz_sequence.must_be(:==, n / 2) if n.even?
    end
  end

  it 'always returns 3n + 1 for all odd n' do
    (1..10_000).each do |n|
      n.next_in_collatz_sequence.must_be(:==, (n * 3) + 1) if n.odd?
    end
  end

  it 'always ends with 1' do
    (1..10_000).each do |n|
      current_seq = n.collatz_sequence.to_a
      current_seq[current_seq.count - 1].must_equal 1
    end
  end

  it 'only has one 1' do
    (1..10_000).each do |n|
      n.collatz_sequence.one? { |m| m == 1 }
    end
  end
end
