defmodule Pow do
  # Author: Paweł Obrok
  # http://stackoverflow.com/a/32030190
  require Integer

  def pow(_, 0), do: 1
  def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)
  def pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end
