# PlugMediaTypeRouter

[![Build Status](https://travis-ci.org/danielgrieve/plug_media_type_router.svg?branch=master)](https://travis-ci.org/danielgrieve/plug_media_type_router)

An Elixir Plug for routing requests to other Plugs based on the request's
[Media Type][1]. See [this GitHub document][2] for more information on Media
Types.

The typical use case is as part of an API which has multiple versions.
Consumers of the API can specify which version of the API they wish to use via
the `Accept` header.

## Installation

Update your `mix.exs` file and run `mix deps.get`:

```elixir
def deps do
  [{:plug_media_type_router, "~> 0.0.1"}]
end
```

## Usage

Add the Plug to wherever you would normally place a `Plug.Router`. For
[Phoenix][3] applications, this is the last line in `endpoint.ex`. Options you
need to provide to the Plug are:

* Default version to route to
* Map of versions and their routes
* Your vendor producer's name (e.g. "application/vnd.**my_app**.v1+json")

```elixir
plug PlugMediaTypeRouter,
  default_version: "v2",
  name: "my_app",
  routers: %{
    "v1" => MyApp.V1.Router,
    "v2" => MyApp.V2.Router,
    "v3" => MyApp.V3.Router
  }
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

See [LICENSE](LICENSE).

[1]: https://en.wikipedia.org/wiki/Media_type
[2]: https://developer.github.com/v3/media/
[3]: http://www.phoenixframework.org
