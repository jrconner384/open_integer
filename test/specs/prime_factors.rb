require File.expand_path '../../helpers/helper', __FILE__

describe '#prime_factors' do
  it 'returns an Enumerator if not given a block' do
    (1..10_000).each do |n|
      n.prime_factors.must_be_kind_of Enumerator
    end
  end

  it 'yields only factors of n' do
    (1..10_000).each do |n|
      n.prime_factors do |factor|
        factor.factor_of? n
      end
    end
  end

  it 'yields only primes' do
    (1..10_000).each do |n|
      n.prime_factors.each :prime?
    end
  end
end
