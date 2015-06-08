require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'always returns a factor of n if n has any prime factors' do
    (1..10_000).each do |n|
      (n % n.lowest_prime_factor).must_equal 0 if n.prime_factors?
    end
  end

  it 'always returns a prime number if n has any prime factors' do
    (1..10_000).each do |n|
      n.lowest_prime_factor.must_be :prime? if n.prime_factors?
    end
  end

  it 'returns nil if n has no prime factors' do
    (1..10_000).each do |n|
      n.lowest_prime_factor.must_be :nil? unless n.prime_factors?
    end
  end
end
