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

  def total([]) do
    0
  end

  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days([head | tail]) do
    if head >= 5 do
      1 + busy_days(tail)
    else 
      busy_days(tail)
    end
  end
end
