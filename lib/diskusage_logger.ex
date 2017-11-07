defmodule DiskUsageLogger do
  @moduledoc """

  Application that supervises a long running process to log disk usage.

  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # define workers and child supervisors to be supervised
    children = [
      worker(DiskUsageLogger.Monitor, [])
    ]
    opts = [strategy: :one_for_one, name: DiskUsageLogger.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
