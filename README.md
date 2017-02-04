# ExText

A collection of text algorithms for Elixir.

## Installation

Add `ex_text` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ex_text, "~> 0.1.0"}]
end
```

Run

```
mix deps.get
```

## Usage

### Simon White algorithm

Simon White algorithm computes the similarity between two strings s1 and s2 as
twice the number of character pairs that are common to both strings divided by
the sum of the number of character pairs in the two strings.

More information can be found [here](http://www.catalysoft.com/articles/StrikeAMatch.html).

```elixir
iex> ExText.WhiteSimilarity.similarity("Healed", "Sealed")
0.8
```
