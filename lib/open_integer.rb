require 'prime'

# Public: Provides extensions to the built-in Integer class.
module OpenInteger
  # Public: Determines if the receiver is an abundant number. A number is
  # abundant iff the sum of its proper divisors is greater than the number
  # itself.
  #
  # Returns true iff the sum of the proper divisors of the receiver is greater
  # than the receiver.
  def abundant?
    divisors.reduce(:+) > self
  end

  # Public: Determines if the receiver and other are an amicable pair. Numbers a
  # and b are amicable if the sum of the factors of a equals b, the sum of the
  # factors of b equals a, and a is not equal to b.
  #
  # other - The value which may be amicable with the receiver.
  #
  # Returns true iff the receiver is amicable with other.
  def amicable_with?(other)
    factors.reduce(:+) == other &&
      other.factors.reduce(:+) == self &&
      self != other
  end

  # Public: An implementation of n choose k using factorials. This
  # implementation works for all n >= k >= 0
  #
  # k - The k parameter of the n choose k formula.
  #
  # Returns the result of n choose k where n is the receiver and k is the
  # Integer argument
  def choose(k)
    return choose_factorial k if 0 <= k && k <= self
    fail 'This implementation of n choose k only works for n >= k >= 0.'
  end

  # Protected: An implementation of n choose k using factorials which works for
  # values of n >= k >= 0.
  #
  # k - The k parameter of the n choose k formula.
  #
  # Returns the result of n choose k using the multiplicative impelementation.
  def choose_factorial(k)
    return 1 if 0 == k && k <= self
    n_factorial = factorial
    k_factorial = k.factorial
    n_minus_k_factorial = (self - k).factorial
    n_factorial / (k_factorial * n_minus_k_factorial)
  end

  # Public: Generates the Collatz sequence beginning with the receiver.
  #
  # Returns an enumerator if no block is given.
  #
  # Yields each value in the sequence as it is calculated.
  def collatz_sequence
    return to_enum(:collatz_sequence) unless block_given?
    yield val = self
    yield val = val.next_in_collatz_sequence until val == 1
  end

  # Public: Determines the number of factors for the receiver.
  #
  # Returns the number of factors the receiver has.
  def count_factors
    factors.count
  end

  # Public: Determines if the receiver is a deficient number. A number is
  # deficient iff the sum of its proper divisors is less than the number itself.
  #
  # Returns true iff the sum of the proper divisors of the receiver is less than
  # the receiver.
  def deficient?
    divisors.reduce(:+) < self
  end

  # Public: Finds all proper divisors of the receiver. Proper divisors of a
  # number n are positive divisors of n excluding n itself.
  #
  # See the definition at Wolfram MathWorld for more details.
  # http://mathworld.wolfram.com/ProperDivisor.html
  #
  # Returns the proper divisors of the receiver.
  # Raises RuntimeError if called on an Integer less than 1.
  #
  # Yields each proper divisors as it is identified.
  def divisors
    fail 'Integers less than 1 do not have proper divisors.' if self < 1
    return to_enum(:divisors) unless block_given?
    top = self == 1 ? 1 : (self / 2).to_i

    (1..top).each do |num|
      yield num if num.factor_of? self
    end
  end

  # Public: Determines if the receiver is a factor of other (i.e. if other is
  # evenly divisible by the receiver).
  #
  # other - The Integer which may be a factor of the receiver.
  #
  # Returns true iff the receiver is a factor of other.
  # Raises RuntimeError if called on 0.
  def factor_of?(other)
    fail 'Zero is not a factor of anything.' if self == 0
    !other.nil? && other % self == 0
  end

  # Public: Finds factor pairs of the receiver.
  #
  # Returns the factor pairs of the receiver.
  #
  # Yields each factor pair as it is identified.
  def factor_pairs
    return to_enum(:factor_pairs) unless block_given?

    factors.each do |factor|
      yield [factor, self / factor]
    end
  end

  # Public: Calculates the factorial of the receiver.
  #
  # Returns the factorial of the receiver.
  def factorial
    return 1 if self == 0
    (1..self).inject(:*)
  end

  # Public: Finds all proper factors of the receiver. A proper factor of a
  # positive integer n is a factor of n other than 1 or n.
  #
  # See the definition at Wolfram MathWorld for more details.
  # http://mathworld.wolfram.com/ProperFactor.html
  #
  # Returns the proper factors of the receiver.
  # Raises a RuntimeError if called on an Integer less than 2.
  #
  # Yields each proper factor as it is identified.
  def factors
    fail 'Integers less than 2 do not have proper factors.' if self < 2
    return to_enum(:factors) unless block_given?
    top = (self / 2).to_i

    (2..top).each do |num|
      yield num if num.factor_of? self
    end
  end

  # Public: Finds the lowest prime factor of the receiver.
  #
  # Returns the lowest prime factor of the receiver or nil if the receiver has
  # no prime factors.
  def lowest_prime_factor
    top = (Math.sqrt self).to_i

    Prime.each top do |prime|
      return prime if prime.factor_of? self
    end
  end

  # Public: Finds the next number in the Collatz sequence using the receiver as
  # the initial value. The Collatz sequence can be generated for successive
  # values n by applying n / 2 if n is even or n * 3 + 1 if n is odd.
  #
  # Returns the next value in the Collatz sequence.
  def next_in_collatz_sequence
    coll = self / 2 if even?
    coll = (self * 3) + 1 if odd?
    coll
  end

  # Public: Finds the nth triangular number. The nth triangular number is
  # generated by adding natural numbers up to n. For n = 7, the triangular
  # number is 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
  #
  # Returns the nth triangular number.
  def self.nth_triangular_number(n)
    (1..n).reduce(:+)
  end

  # Public: Determines if the receiver is a perfect number. A number is perfect
  # iff the sum of its proper divisors is exactly equal to the number itself.
  #
  # Returns true iff the receiver is equal to the sum of its proper divisors.
  def perfect?
    divisors.reduce(:+) == self
  end

  # Public: Determines the prime factors of the receiver.
  #
  # Returns an Enumerator over the collection of the receiver's prime factors.
  #
  # Yields each prime factor as it is discovered.
  def prime_factors
    return to_enum(:prime_factors) unless block_given?
    top = (Math.sqrt self).to_i

    Prime.each top do |prime|
      yield prime if prime.factor_of? self
    end
  end

  # Public: Asks the receiver if it has any prime factors.
  #
  # Returns true iff the receiver has any prime factors else returns false.
  def prime_factors?
    !lowest_prime_factor.nil?
  end

  # Public: Determines if the three Integer arguments are a Pythagorean triplet
  # of the form a^2 + b^2 = c^2.
  #
  # Returns true iff the arguments follow the form a^2 + b^2 = c^2.
  def self.pythagorean_triplet?(a, b, c)
    (a * a) + (b * b) == (c * c)
  end

  private :choose_factorial
end

# Public: Mixing OpenInteger extensions into Integer.
class Integer
  include OpenInteger
end
