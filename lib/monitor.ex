defmodule DiskUsageLogger.Monitor do
  @moduledoc """

  Server for outputing disk usage each minute

  """
  require Logger

  def start_link, do: GenServer.start_link(__MODULE__, %{})

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    for entry <- get_disk_data() do
      Logger.info fn ->
        label = elem(entry, 0)
        percent_used = elem(entry, 2)

        "diskusage_report label=\"#{label}\" percent_used=#{percent_used}"
      end
    end

    # reschedule
    schedule_work()
    {:noreply, state}
  end

  @spec get_disk_data() :: [{String.t, integer, integer}]
  def get_disk_data, do: :disksup.get_disk_data()

  defp schedule_work, do: Process.send_after(self(), :work, 60 * 1000) # in 1 minute
end
