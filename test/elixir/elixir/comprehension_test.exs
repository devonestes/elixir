defmodule Elixir::ComprehensionTest do
  use ExUnit::Case

  def test_list_comprehensions do
    [4] = for x in [1,2,3], rem(x, 2) == 0, do: x * 2
  end

  def test_list_comprehensions_with_nil do
    [] = for x in [1,2,3], nilly, do: x * 2
  end

  def test_list_comprehensions_with_truthy_object do
    [2,4,6] = for x in [1,2,3], 1, do: x * 2
  end

  def test_list_comprehensions_with_inlist do
    [2,4,6] = for inlist(x, [1,2,3]), do: x * 2
  end

  def test_list_comprehensions_with_inlist_of_bins do
    [2,4,6] = for inlist(<<x>>, [<<1>>,<<2>>,<<3>>]), do: x * 2
  end

  def test_list_comprehensions_with_implicit_inbin do
    [2,4,6] = for <<x>> in <<1,2,3>>, do: x * 2
  end

  def test_list_comprehensions_with_explicit_inbin do
    [2,4,6] = for inbin(<<x>>, <<1,2,3>>), do: x * 2
  end

  def test_list_comprehensions_with_two_generators do
    [4, 5, 6, 8, 10, 12, 12, 15, 18] = for x in [1,2,3], y in [4,5,6], do: x * y
  end

  def test_list_comprehension_multiline do
    [2,4,6] = for x in [1,2,3] do
      x * 2
    end
  end

  def test_bin_comprehensions do
    <<4>> = bitfor x in [1,2,3], rem(x, 2) == 0, do: <<x * 2>>
  end

  def test_bin_comprehensions_with_nil do
    <<>> = bitfor x in [1,2,3], nilly, do: <<x * 2>>
  end

  def test_bin_comprehensions_with_truthy_object do
    <<2,4,6>> = bitfor x in [1,2,3], 1, do: <<x * 2>>
  end

  def test_bin_comprehensions_with_inlist do
    <<2,4,6>> = bitfor inlist(x, [1,2,3]), do: <<x * 2>>
  end

  def test_bin_comprehensions_with_inlist_of_bins do
    <<2,4,6>> = bitfor inlist(<<x>>, [<<1>>,<<2>>,<<3>>]), do: <<x * 2>>
  end

  def test_bin_comprehensions_with_implicit_inbin do
    <<2,4,6>> = bitfor <<x>> in <<1,2,3>>, do: <<x * 2>>
  end

  def test_bin_comprehensions_with_explicit_inbin do
    <<2,4,6>> = bitfor inbin(<<x>>, <<1,2,3>>), do: <<x * 2>>
  end

  def test_bin_comprehensions_with_two_generators do
    <<4, 5, 6, 8, 10, 12, 12, 15, 18>> = bitfor x in [1,2,3], y in [4,5,6], do: <<x*y>>
  end

  def test_bin_comprehension_multiline do
    <<2,4,6>> = bitfor x in [1,2,3] do
      <<x * 2>>
    end
  end

  defp nilly, do: nil
end