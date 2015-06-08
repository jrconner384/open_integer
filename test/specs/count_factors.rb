require File.expand_path '../../helpers/helper', __FILE__

describe '#count_factors' do
  it 'returns a number equal to n.factors.count' do
    (2..10_000).each do |n|
      n.count_factors.must_equal n.factors.count
    end
  end

  it 'raises a RuntimeError when called on 1' do
    err = -> { 1.count_factors }.must_raise RuntimeError
    err.message.must_match 'Integers less than 2 do not have proper factors.'
  end
end
