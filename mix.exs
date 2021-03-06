defmodule ExText.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_text,
     version: "0.1.0",
     package: package(),
     description: description(),
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     source_url: "https://github.com/gottfrois/ex_text",
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Pierre-Louis Gottfrois"],
      licenses: ["MIT"],
      links: %{
        github: "https://github.com/gottfrois/ex_text",
      },
    ]
  end

  defp description do
    """
    A collection of text algorithms.
    """
  end
end
