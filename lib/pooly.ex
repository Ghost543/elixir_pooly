defmodule Pooly do
  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    pool_config = [mfa: {SampleWorker, :start_link, []}, size: 5]
    start_pool(pool_config)
  end

  @spec start_pool(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_pool(pool_config) do
    Pooly.Supervisor.start_link(pool_config)
  end

  @spec checkout :: any
  def checkout do
    Pooly.Server.checkout
  end

  @spec checkin(any) :: :ok
  def checkin(worker_pid) do
    Pooly.Server.checkin(worker_pid)
  end

  @spec status :: any
  def status do
    Pooly.Server.status
  end
end
