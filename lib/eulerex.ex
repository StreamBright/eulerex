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
    Stream.filter(xs, fn(x) -> divisible(x,m) end)
  end

  def fib do
    Stream.iterate([1,1], fn([a, b]) -> [b, (a + b)] end)
    |> Stream.map(&(List.first(&1)))
  end

  def even? do
    &(rem(&1, 2) == 0)
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

  def euler_003 do
    
  end

end
