defmodule Eulerex do

  ## common

  # defp is private definition
  # accessible within the module,
  # def is callable from outside

  def divisible(n,m) do
    remainder = rem(n,m)
    case remainder do
      0 -> true
      _ -> false
    end
  end

  def filter_divisible(xs, m) do
    Enum.filter(xs, fn(x) -> divisible(x,m) end)
  end

  def fib do
    Stream.iterate([1,1], fn([a, b]) -> [b, (a + b)] end)
    |> Stream.map(&(List.first(&1)))
  end

  def even? do
    &(rem(&1, 2) == 0)
  end

  def palindromic?(x) do
    String.to_integer(String.reverse(Integer.to_string(x))) == x
  end

  ## 001 

  def euler_001 do
    nums = 1..999
    div3 = filter_divisible(nums, 3)
    div5 = filter_divisible(nums, 5)
    Enum.into(div3++div5, HashSet.new)
    |> Enum.sum
  end

  ## 002

  def euler_002 do
    Eulerex.fib 
    |> Stream.filter(Eulerex.even?) 
    |> Stream.take_while(&(&1 < 4_000_000))
    |> Enum.sum
  end

  ## 003

  def euler_003 do
    List.first(PrimeFactors.of(600851475143))
  end
  
  ## 004

  def euler_004 do
    # max number of multiplying two 3 digit numbers 999 * 999 = 998001
    # min number of multiplying two 3 digit numbers 100 * 100 = 10000
    # I am not sure how to use Stream for generating the product
    (for i <- 999..100, j <- i..100, into: [], do:  i * j)
    |> Stream.filter(&(palindromic?(&1)))
    |> Enum.sort
    |> List.last
  end

  ## 005

  def euler_005 do
    #Brute force
    Stream.iterate(20, &(&1+20))
    |> Stream.filter(&(rem(&1, 2) == 0))
    |> Stream.filter(&(rem(&1, 3) == 0))
    |> Stream.filter(&(rem(&1, 4) == 0))
    |> Stream.filter(&(rem(&1, 5) == 0))
    |> Stream.filter(&(rem(&1, 6) == 0))
    |> Stream.filter(&(rem(&1, 7) == 0))
    |> Stream.filter(&(rem(&1, 8) == 0))
    |> Stream.filter(&(rem(&1, 9) == 0))
    |> Stream.filter(&(rem(&1, 10) == 0))
    |> Stream.filter(&(rem(&1, 11) == 0))
    |> Stream.filter(&(rem(&1, 12) == 0))
    |> Stream.filter(&(rem(&1, 13) == 0))
    |> Stream.filter(&(rem(&1, 14) == 0))
    |> Stream.filter(&(rem(&1, 15) == 0))
    |> Stream.filter(&(rem(&1, 16) == 0))
    |> Stream.filter(&(rem(&1, 17) == 0))
    |> Stream.filter(&(rem(&1, 18) == 0))
    |> Stream.filter(&(rem(&1, 19) == 0))
    |> Stream.filter(&(rem(&1, 20) == 0))
    |> Enum.take(1)
    |> List.first
  end

  def euler_006 do
    sum_of_squares    = 1..100 |> Stream.map(&(&1*&1)) |> Enum.sum
    sum               = 1..100 |> Enum.sum
    square_of_sum     = Pow.pow(sum, 2)
    square_of_sum - sum_of_squares
  end

  def euler_007 do
    Stream.iterate(11,&(&1+1))
    |> Stream.filter(&(PrimeFactors.is_prime?(&1))) 
    |> Enum.take(10001)
    |> List.last
  end

end
