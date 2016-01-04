defmodule PlugMediaTypeRouterTest do
  use ExUnit.Case
  use Plug.Test

  alias PlugMediaTypeRouter, as: TestSubject

  defmodule MyApp.V1.Router do
    use Plug.Router

    plug :match
    plug :dispatch

    get "/", do: conn |> resp(200, "v1")
  end

  defmodule MyApp.V2.Router do
    use Plug.Router

    plug :match
    plug :dispatch

    get "/", do: conn |> resp(200, "v2")
  end

  @options default_version: "v2",
           name: "my_app",
           routers: %{
             "v1" => MyApp.V1.Router,
             "v2" => MyApp.V2.Router
           }

  test "routing to the default version" do
    conn =
      conn(:get, "/")
      |> TestSubject.call(@options)

    assert conn.resp_body == "v2"
  end

  test "routing with other accept headers" do
    conn =
      conn(:get, "/")
      |> put_req_header("accept", "text/html")
      |> TestSubject.call(@options)

    assert conn.resp_body == "v2"
  end

  test "routing to other versions" do
    conn =
      conn(:get, "/")
      |> put_req_header("accept", "application/vnd.my_app.v1")
      |> TestSubject.call(@options)

    assert conn.resp_body == "v1"
  end

  test "requesting a non-existent version" do
    conn =
      conn(:get, "/")
      |> put_req_header("accept", "application/vnd.my_app.v3")
      |> TestSubject.call(@options)

    assert conn.halted
    assert conn.resp_body == """
    Version not supported: v3

    Currently supported versions: v1, v2
    """
    assert conn.status == 400
  end
end
