defmodule DiskUsageLogger.MonitorTest do
  use ExUnit.Case

  describe "DiskUsageLogger.Monitor" do

    test "start_link/0"  do
      {status, pid} = DiskUsageLogger.Monitor.start_link()
      assert status == :ok
      assert Process.alive?(pid)
    end

    test "init/1" do
      {status, state} = DiskUsageLogger.Monitor.init([])
      assert status == :ok
      assert state == []
    end

    test "handle_info/2" do
      expected = {:noreply, nil}
      actual = DiskUsageLogger.Monitor.handle_info(:work, nil)
      assert expected == actual
    end

    test "get_disk_data/0" do
      # this test will really vary from environment to environment, so we just want to be sure
      # that we got a list of at least one element back and that it's first element contained
      # an integer value in the slot where we would expect it to be
      [report |_] = DiskUsageLogger.Monitor.get_disk_data()
      assert is_integer elem(report, 2)
    end
  end
end
