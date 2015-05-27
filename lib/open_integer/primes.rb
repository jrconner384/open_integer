require 'erats_sieve'

# Public: Extends Integer with methods using or generating prime numbers.
module Primes
  # Public: Finds the lowest prime factor of self.
  #
  # Returns the lowest prime factor of self.
  def lowest_prime_factor
    lowest_factor = self
    top = (Math.sqrt self).to_i

    EratsSieve.primes_to top do |prime|
      lowest_factor = prime if prime.factor_of?(self) && prime < lowest_factor
    end

    lowest_factor
  end
end

# Public: Mixing Primes extensions into Integer.
class Integer
  include Primes
end
