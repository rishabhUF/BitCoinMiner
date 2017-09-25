defmodule Project do
 
  ##main function
  def main(args) do
    if String.contains?List.first(args),"." do
      random_string = :crypto.strong_rand_bytes(5) |> Base.encode64 |> binary_part(0, 5)
      name = random_string<>"@"<>List.first(args)
      Node.start(:"#{name}")
      Node.set_cookie(:"#{name}",:"cookie")
      arg = List.first(args)
      Node.connect(:"server@#{arg}")
      :global.sync()
      :global.registered_names
      server_pid = :global.whereis_name(:server)
      for n <- 1..100 do
        spawn_link(Client, :get_leading_k, [server_pid])
      end

    else
      input_k = List.first(args) |> String.slice(0,1) |> String.to_integer 
      ip = get_ip()
      Node.start(:"server@#{ip}")
      Node.set_cookie(:"server@#{ip}",:"cookie")
      {:ok, pid} = GenServer.start_link(Server, [input_k])
      :global.sync()
      c = :global.register_name(:server, pid) 
      for n <- 1..100 do
        spawn_link(Client, :mine_client_bit, [ pid,input_k ]) 
       end 
    end
    Process.sleep(:infinity)
  end

  def get_ip() do
    {:ok, ifs} = :inet.getif()
    {a,b,c,d} =
        Enum.filter(ifs , fn({{ip, _, _, _} , _t, _net_mask}) -> ip != 127 end)
        |> Enum.map(fn {ip, _broadaddr, _mask} -> ip end)
        |>List.last
    "#{a}.#{b}.#{c}.#{d}"        
  end
end
