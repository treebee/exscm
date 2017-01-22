defmodule Exscm.Mixfile do
  use Mix.Project

  def project do
    [app: :exscm,
     version: "0.0.2",
     elixir: "~> 1.3",
     description: description(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps(),
     docs: [main: "readme", extras: ["README.md"]],
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]]
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
    [{:excoveralls, "~> 0.5", only: :test},
     {:ex_doc, ">= 0.0.0", only: :dev},
     {:mock, "~> 0.2.0", only: :test}]
  end

  defp description do
    """
    Manage release versions by scm tags
    """
  end

  defp package do
    [name: "exscm",
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     licenses: ["MIT"],
     maintainers: ["Patrick Muehlbauer <patrick@opentrash.org>"],
     links: %{"GitHub" => "https://github.com/treebee/exscm"}]
  end
end
