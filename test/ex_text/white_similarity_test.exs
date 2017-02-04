defmodule ExText.WhiteSimilarityTest do
  use ExUnit.Case
  alias ExText.WhiteSimilarity

  doctest WhiteSimilarity

  test "when str1 is empty" do
    assert 0.0 === WhiteSimilarity.similarity("", "aaa")
  end

  test "when str2 is empty" do
    assert 0.0 === WhiteSimilarity.similarity("aaa", "")
  end

  test "when both strings are equal" do
    assert 1.0 === WhiteSimilarity.similarity("aaaaa", "aaaaa")
    assert 1.0 === WhiteSimilarity.similarity("REPUBLIC OF CUBA", "REPUBLIC OF CUBA")
  end

  test "when words are different" do
    assert_in_delta 0.4, WhiteSimilarity.similarity("Healed", "Herded"), 0.01
    assert_in_delta 0.25, WhiteSimilarity.similarity("Healed", "Help"), 0.01
    assert_in_delta 0.0, WhiteSimilarity.similarity("Healed", "Sold"), 0.01
    assert_in_delta 0.55, WhiteSimilarity.similarity("Healed", "Healthy"), 0.01
    assert_in_delta 0.44, WhiteSimilarity.similarity("Healed", "Heard"), 0.01
    assert_in_delta 0.4, WhiteSimilarity.similarity("GGGGG", "GG"), 0.01
    assert_in_delta 0.56, WhiteSimilarity.similarity("REPUBLIC OF FRANCE", "FRANCE"), 0.01
    assert_in_delta 0.0, WhiteSimilarity.similarity("FRANCE", "QUEBEC"), 0.01
    assert_in_delta 0.72, WhiteSimilarity.similarity("FRENCH REPUBLIC", "REPUBLIC OF FRANCE"), 0.01
    assert_in_delta 0.61, WhiteSimilarity.similarity("FRENCH REPUBLIC", "REPUBLIC OF CUBA"), 0.01
  end
end
