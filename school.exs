defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    cond do
      Map.has_key?(db, grade) -> Map.merge(db, %{ grade => [name] ++ db[grade] })
      true -> Map.merge(db, %{ grade => [name] })
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    if Map.has_key?(db, grade), do: Enum.sort(db[grade]), else: []
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Enum.sort(Map.keys(db))
      |> Enum.map(fn(key) -> {key, grade(db, key)} end)
  end
end
