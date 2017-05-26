defmodule PlugMediaTypeRouter.Mixfile do
  use Mix.Project

  @description """
  An Elixir Plug for routing requests to other Plugs based on the
  request's Media Type
  """

  def project do
    [app: :plug_media_type_router,
     name: "PlugMediaTypeRouter",
     description: @description,
     source_url: "https://github.com/danielgrieve/plug_media_type_router",
     homepage_url: "https://github.com/danielgrieve/plug_media_type_router",
     version: "0.0.3",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     docs: docs,
     package: package]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:plug, ">= 1.0.0"},

     {:earmark, "~> 0.1.19", only: :docs},
     {:ex_doc, "~> 0.11", only: :docs}]
  end

  defp docs do
    [extras: ["README.md"], main: "readme"]
  end

  defp package do
    [maintainers: ["Daniel Grieve"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/danielgrieve/plug_media_type_router"}]
  end
end
