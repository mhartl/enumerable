# Enumerable talk notes

synonyms

  take
  first

  any?
  none?

  collect = map
  select  = find_all
  reject  = <none>
  detect  = find
  inject  = reduce

  grep
  partition
  zip
  cycle
  lazy
    use Fibonacci
    first do map, then do lazy
    or maybe sieve of Eratosthenes
    http://www.globalnerdy.com/2008/07/06/enumerating-enumerable-enumerablecycle/

def natural_numbers
  (1..Float::INFINITY).lazy
end

def primes
  natural_numbers.select {|n|
    (2..(n**0.5)).all? {|f|
      n % f > 0
    }
  }
end

#all?
#any?
#chunk
#collect
#collect_concat
#count
#cycle
#detect
#drop
#drop_while
#each_cons
#each_entry
#each_slice
#each_with_index
#each_with_object
#entries
#find
#find_all
#find_index
#first
#flat_map
#grep
#group_by
#include?
#inject
#lazy
#map
#max
#max_by
#member?
#min
#min_by
#minmax
#minmax_by
#none?
#one?
#partition
#reduce
#reject
#reverse_each
#select
#slice_before
#sort
#sort_by
#take
#take_while
#to_a
#to_h
#zip