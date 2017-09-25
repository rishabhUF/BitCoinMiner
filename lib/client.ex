defmodule Client do
    use GenServer
    def printcoin(pid,result,hash_key) do
        GenServer.cast(pid,{:printcoin,result,hash_key})
        
    end
    def mine_client_bit(pid,k) do
        ## generate random string
        length = 5
        random_string = :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
        result = "rishabhsharma;" <> random_string
    
        ## generate hash key
        hash_key = Base.encode16(:crypto.hash(:sha256,result))
        ##start of main program
        input_String = String.slice(hash_key,0,k)
        no_of_zereos_String = "000000000000000000000000000000000000000000000000000000000000"
        compare_String = String.slice(no_of_zereos_String,0,k)
        if(compare_String == input_String) do
            printcoin(pid,result,hash_key)  
        end
        mine_client_bit(pid,k)
      end

      def get_leading_k(pid) do
         [h|t] =  GenServer.call(pid,:get_leading_k)
         mine_client_bit(pid,h)
      end

end