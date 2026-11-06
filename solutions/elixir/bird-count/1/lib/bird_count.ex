defmodule BirdCount do
    
  def today([]) do 
    nil
  end
  
  def today(list) do
    hd(list)
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count(list) do
    increment(list)
  end

  defp increment([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([0 | _list]), do: true

  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  def total(list) do
    list |> Enum.sum()
  end

  def busy_days(list) do
    list |> 
    Enum.count(&(&1 >= 5))
  end
end
