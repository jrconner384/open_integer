require File.expand_path '../../helpers/helper', __FILE__

describe '#nth_triangular_number' do
  it 'says the nth triangular number where n > 1 is greater than n.' do
    (2..10_000).each do |n|
      OpenInteger.nth_triangular_number(n).must_be :>, n
    end
  end
end
