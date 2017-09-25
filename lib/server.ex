defmodule Server do
    use GenServer
  
  
   # Client API
     
   
    # Server Callbacks
  
     def init(list) do
        {:ok,list}
      end
  
    def handle_cast({:printcoin, coin, hash},[h|t]) do
        IO.puts coin <> "   " <> hash
      {:noreply,[h|t]}
    end

    def handle_call(:get_leading_k,from, h) do
        {:reply,h,h}
      end 
  end