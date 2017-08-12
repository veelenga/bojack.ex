require Socket

defmodule BoJack do
  def server(host, port \\ 5000) do
    Socket.TCP.connect! host, port, packet: :raw
  end

  def send_recv(server, raw) do
    server |> Socket.Stream.send("#{raw}\n")
    server |> Socket.Stream.recv |> elem(1) |> String.trim_trailing
  end

  def set(server, key, value) do
    server |> send_recv("set #{key} #{value}")
  end

  def increment(server, key) do
    server |> send_recv("increment #{key}")
  end

  def get(server, key) do
    server |> send_recv("get #{key}")
  end

  def append(server, key, value) do
    server |> send_recv("append #{key} #{value}")
  end

  def pop(server, key) do
    server |> send_recv("pop #{key}")
  end

  def delete(server, key) do
    server |> send_recv("delete #{key}")
  end

  def ping(server) do
    server |> send_recv("ping")
  end

  def size(server) do
    server |> send_recv("size")
  end

  def close(server) do
    server |> send_recv("close")
  end
end
