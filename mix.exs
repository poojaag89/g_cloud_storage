defmodule GCloudStorage.Mixfile do
  use Mix.Project

  def project do
    [app: :g_cloud_storage,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     elixirc_paths: elixirc_paths(Mix.env)
    ]
  end

  # Configuration for the OTP application
  #
  def application do
    [
      applications: [:logger, :httpoison],
      mod: {GCloudStorage, []}
    ]
  end

  defp deps do
    [
      {:poison,         "~> 1.5"},
      {:httpoison,      "~> 0.7.2"},
      {:json_web_token, github: "lessless/json_web_token_ex"}
    ]
  end

  defp elixirc_paths(:test), do: elixirc_paths([]) ++ ["test/support"]
  defp elixirc_paths(_), do:  ["lib"]
end
