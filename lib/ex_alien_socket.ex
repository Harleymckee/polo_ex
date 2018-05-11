defmodule PoloWebsocket do
  use WebSockex

  def start() do
    {:ok, pid} = WebSockex.start("wss://api2.poloniex.com/", __MODULE__, %{})
    # WebSockex.send_frame(pid, {:text, Poison.encode!(%{"command" => "subscribe", "channel" => "1001"})})
    # WebSockex.send_frame(pid, {:text, Poison.encode!(%{"command" => "subscribe", "channel" => "1002"})})
    # WebSockex.send_frame(pid, {:text, Poison.encode!(%{"command" => "subscribe", "channel" => "1003"})})
    WebSockex.send_frame(pid, {:text, Poison.encode!(%{"command" => "subscribe", "channel" => "BTC_ETH"})})
    {:ok, pid}
  end

  def terminate(reason, state) do
    IO.puts("WebSockex for remote debbugging on port #{state.port} terminating with reason: #{inspect reason}")
    exit(:normal)
  end

  def handle_frame({_type, msg}, state) do
    case Poison.decode(msg) do
      {:error, error} ->
        IO.puts("NO")
      {:ok, message} ->
        case message do
          [_, _, [content]] ->
            IO.inspect(content)
          [_, _, [head | tail]] ->
            if is_list(head) do
              IO.inspect(tail ++ [head])
            else
              IO.puts("baap")
            end
          _ ->
            IO.puts("boop")
        end
    end
    {:ok, state}
  end
end
