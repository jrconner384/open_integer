require File.expand_path '../../helpers/helper', __FILE__

describe '#amicable_with?' do
  it 'never says a number is amicable with itself.' do
    (2..10_000).each do |n|
      n.amicable_with?(n).must_equal false
    end
  end
end
