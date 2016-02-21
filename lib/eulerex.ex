defmodule Eulerex do

  ## common

  # defp is private def

  defp divisible(n,m) do
    remainder = rem(n,m)
    case remainder do
      0 -> true
      _ -> false
    end
  end

  defp filter_divisible(xs, m) do
    Enum.filter(xs, fn(x) -> divisible(x,m) end)
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
    divable = filter_divisible(nums, 3) ++ filter_divisible(nums, 5)
    Enum.into(divable, HashSet.new) |> Enum.sum
  end

  ## 002

  def euler_002 do
    Eulerex.fib 
    |> Stream.filter(Eulerex.even?) 
    |> Stream.take_while(&(&1 < 4_000_000))
    |> Enum.sum
  end

end
