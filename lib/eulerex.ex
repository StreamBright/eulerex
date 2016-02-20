defmodule Eulerex do

  ## common

  def divisible(n,m) do
    remainder = rem(n,m)
    case remainder do
      0 -> true
      _ -> false
    end
  end

  ## 001 

  def euler_001 do
    nums = for n <- 1..999, do: n
    divable = Enum.filter(nums, fn(x) -> divisible(x,3) end) ++ Enum.filter(nums, fn(x) -> divisible(x,5) end)
    set = Enum.into(divable, HashSet.new)
    Enum.reduce(set, 0, &+/2)
  end

  ## 002


end

IO.puts Eulerex.euler_001
