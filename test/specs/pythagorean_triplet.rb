require File.expand_path '../../helpers/helper', __FILE__

describe '#pythagorean_triplet?' do
  it 'is never true if all three arguments are identical' do
    (1..10_000).each do |n|
      OpenInteger.pythagorean_triplet?(n, n, n).must_equal false
    end
  end
end
