defmodule Mywebapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Mywebapp.Worker.start_link(arg)
      # {Mywebapp.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: SimpleServer.Router, options: [port: Settings.port])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mywebapp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
