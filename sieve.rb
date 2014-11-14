#!/usr/bin/env ruby


class Fixnum
  # Returns true if the number is prime.
  def prime?
    (2..Math.sqrt(self)).none? { |k| self % k == 0 }
  end
end

# Returns an enumerator of prime numbers.
def primes
  (2..Float::INFINITY).lazy.select(&:prime?)
end

p primes.first(10)