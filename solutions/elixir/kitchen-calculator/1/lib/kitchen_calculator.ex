defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  #to_milliliter
  def to_milliliter({:cup, x}) do
    {:milliliter, x*240}
  end
  def to_milliliter({:fluid_ounce, x}) do
    {:milliliter, x*30}
  end
  def to_milliliter({:teaspoon, x}) do
    {:milliliter, x*5}
  end
  
  def to_milliliter({:tablespoon, x}) do
    {:milliliter, x*15}
  end
  def to_milliliter({:milliliter, x}) do
    {:milliliter, x}
  end

  #from_milliliter
  def from_milliliter({:milliliter, x}, :cup) do
    {:cup, x/240}
  end
  def from_milliliter({:milliliter, x}, :fluid_ounce) do
    {:fluid_ounce, x/30}
  end
  def from_milliliter({:milliliter, x}, :teaspoon) do
    {:teaspoon, x/5}
  end
  def from_milliliter({:milliliter, x}, :tablespoon) do
    {:tablespoon, x/15}
  end
  def from_milliliter({:milliliter, x}, :milliliter) do
    {:milliliter, x}
  end
  
  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
