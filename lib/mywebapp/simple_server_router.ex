defmodule SimpleServer.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug Plug.Static,
    at: "/css", from: "lib/mywebapp/frontend/css/"
  plug Plug.Static,
    at: "/imgassets", from: "lib/mywebapp/frontend/imgassets/"
  plug Plug.Static,
    at: "/js", from: "lib/mywebapp/frontend/js/"


  plug(:match)
  plug(:dispatch)

  #================add routes=====================
  get "/" do
    carinfo = Map.get(Parser.parse(), :carinfo)
    content = EEx.eval_file("lib/mywebapp/frontend/index.html", [carinfo: carinfo])

    conn
    |> Plug.Conn.put_resp_header("content-type", "text/html; charset=utf-8")
    |>Plug.Conn.send_resp(200, content)
  end

  def route("GET", ["Hello"],conn) do
    conn |> Plug.Conn.send_resp(200, "Hello, world!")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
