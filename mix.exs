defmodule ExAlienSocket.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_alien_socket,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:websocket_client, git: "https://github.com/jeremyong/websocket_client.git"},
      {:poison, "~> 3.1"},
      {:phoenix, "~> 1.3.0-rc"},
      {:phoenix_ecto, "~> 3.2"},
      {:socket, "~> 0.3"},
      {:websockex, "~> 0.4.0"},


      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end


