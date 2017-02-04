defmodule ExText.WhiteSimilarity do
  @doc """
  Returns Simon White similarity between two strings.

  The similarity between two strings s1 and s2 is twice the number of character
  pairs that are common to both strings divided by the sum of the number of
  character pairs in the two strings.

  http://www.catalysoft.com/articles/StrikeAMatch.html

  ## Examples

      iex> ExText.WhiteSimilarity.similarity("Healed", "Sealed")
      0.8

  """
  def similarity(str1, str2) do
    pairs1       = word_letter_pairs(str1)
    pairs2       = word_letter_pairs(str2)
    union        = Enum.count(pairs1) + Enum.count(pairs2)
    intersection = intersection(pairs1, pairs2, 0)

    (2.0 * intersection) / union
  end

  defp intersection([], _, acc), do: acc
  defp intersection(_, [], acc), do: acc
  defp intersection([head | tail], pairs2, acc) do
    index = Enum.find_index(pairs2, fn(x) -> x == head end)
    if index do
      intersection(tail, List.delete_at(pairs2, index), acc + 1)
    else
      intersection(tail, pairs2, acc)
    end
  end

  defp word_letter_pairs(str) do
    str
    |> String.upcase
    |> String.split(~r/\s+/)
    |> Enum.flat_map(fn(word) ->
      range = 0..(String.length(word) - 2)
      Enum.map(range, fn(i) -> String.slice(word, i, 2) end)
    end)
  end
end
