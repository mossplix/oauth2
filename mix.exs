defmodule ExOauth2.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exoauth2,
      version: "0.0.3",
      elixir: "~> 1.0",
      deps: deps,
      package: package,
      description: "An Elixir OAuth 2.0 Client Library"
    ]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:hackney, github: "benoitc/hackney", tag: "1.0.4",override: true},
      {:httpoison, "~> 0.5.0"},
      {:poison, "~> 1.2"},
      {:cowboy, "~> 1.0", only: :test},
       {:plug, "~> 0.11.0"},
    ]
  end

  defp package do
    [
      contributors: ["Sonny Scroggin","Moses Mugisha"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/mossplix/oauth2"}
    ]
  end
end
