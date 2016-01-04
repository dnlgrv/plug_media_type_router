defmodule PlugMediaTypeRouter.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_media_type_router,
     name: "PlugMediaTypeRouter",
     source_url: "https://github.com/cazrin/plug_media_type_router",
     homepage_url: "https://github.com/cazrin/plug_media_type_router",
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     docs: docs]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:plug, "~> 1.0.0"},

     {:earmark, "~> 0.1.19", only: :docs},
     {:ex_doc, "~> 0.11", only: :docs}]
  end

  defp docs do
    [extras: ["README.md"], main: "README"]
  end
end
