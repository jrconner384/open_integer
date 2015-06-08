require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'always returns an Enumerator' do
    (1..10_000).each do |n|
      n.prime_factors.must_be_kind_of Enumerator
    end
  end
end
