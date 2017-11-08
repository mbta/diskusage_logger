defmodule SystemMetrics.Mixfile do
  use Mix.Project

  def project do
    [app: :diskusage_logger,
     version: "0.2.0",
     licenses: "",
     elixir: "~> 1.3",
     description: "A service that logs disk usage each minute",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     package: package(),
     deps: deps()]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Ryan Mahoney"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mbta/diskusage_logger"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {DiskUsageLogger, []},
     applications: [:os_mon, :logger]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:excoveralls, "~> 0.5", only: :test},
     {:ex_doc, "~> 0.13", only: :dev, runtime: false}]
  end
end
