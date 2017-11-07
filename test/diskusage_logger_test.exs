defmodule DiskUsageLoggerTest do
  use ExUnit.Case

  describe "DiskUsageLogger" do
    test "start/2" do
      {:error, {status, pid}} = DiskUsageLogger.start(nil, nil)
      assert status == :already_started
      assert Process.alive?(pid)
    end
  end
end
