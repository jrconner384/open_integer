require File.expand_path '../../helpers/helper', __FILE__

describe '#factor_pairs?' do
  it 'returns the same number of factor pairs as #factors' do
    (2..10_000).each do |n|
      n.factor_pairs.count.must_equal n.factors.count
    end
  end

  it 'returns a collection of pairs which contains two of each factor' do
    (2..10_000).each do |n|
      flat_pairs = n.factor_pairs.to_a.flatten
      n.factors do |factor|
        flat_pairs.count(factor).must_equal 2
      end
    end
  end

  it 'raises a RuntimeError when called on 1 and enumerated' do
    err = -> { 1.factor_pairs.to_a }.must_raise RuntimeError
    err.message.must_match 'Integers less than 2 do not have proper factors.'
  end
end
