defmodule CovidHotspot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # create cache in ETS
    :ets.new(:cache, [:set, :public, :named_table])

    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      CovidHotspotWeb.Endpoint
      # Starts a worker by calling: CovidHotspot.Worker.start_link(arg)
      # {CovidHotspot.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CovidHotspot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CovidHotspotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
