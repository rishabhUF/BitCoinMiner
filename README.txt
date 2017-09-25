READ ME file for Distrubuted Operating Systems - Project 1
Date: September 18, 2017


Group Members:

1. Chaitra Yangandul. UFID: 43357171
2. Rishabh Sharma, UFID: 15581395

To run the file:
run the executable file initially with the number of leading zeros. If we then give the ip 
of the server , it connects to the server and mines coins
Remote Actor Set up:
The remote client tires to connect with the server. If client is able to connect with server. Server assigns the work with the client and in the 100 different workers inside the client.

Architecture:
1. There is the main module which checks weather the input through build file is value of leading zeros or ip address.
2. If the input is k we call the server for mining the bit.
3. Otherwise the client is called and connected.
4. A Client is a node that tries to connect with this alive server from a separate physical machine.
5. We have spawned 100 internal worker which mines the different random string.
6. Random string is of length of 5 which whom I am fetching the hash key.
7. Hash key is found out by using Base.encode16(:crypto.hash(:sha256,result))
8. After sufficient time of execution stop is mining by aborting the processes because the program runs infinitely. 
9. I have used Genserver for the implementation of the actor model send and receive functionality.
10. All the processes are running aynscronoucly.

Implementation:

1. Local Implementation
./project1 2
where k = 2 which is the number of leading 0's required in the bitcoin generated while mining
This will run on one single machine and continuously print the input string and bitcoin mined

2. Distributed Implementation
In our implementation, a client on a separate node will try to establish a connection with the master node by running
project 192.186.0.9

3. I have decided to take 100 different workers to mine the bits because that provided me the best time utilization.

Other Requirements:

1. Work Unit Size = No. of sub problem that the process gets. We give 100 worker. 
Determination of best Work Unit Size :
The master node assigns the work to all the workers. Each work unit will consist of 100 workers to mine
within a limit time period of 10. minutes


2. Result of running program for k = 4 :

rishabhsharma;2ZNLh   00009C974993617A8D987D662A5F52DA1E7E4B10F3323A18279B6FB188905B2A
rishabhsharma;AVN0o   0000B7556070CFA05012F7EAD0C209620C0385ED38C1EFE676674DBC7DF5C938
rishabhsharma;9bQXF   0000E3BB882B033F13CDE6D6980CE5E14B0561572EC80E4ECAA2EECC2CBB84B7
rishabhsharma;SXAjn   0000FE4ABB96D9199B780FB3C417DF712DF74466009D89F9B618BE0913628A1D
rishabhsharma;SagV5   00007D3D6A80DCC64A208AAC34C4E41178CF0C538B875D364A849B77A53DC19D
rishabhsharma;a1CCX   0000A0F2092E47408E8E23C5AB6357C988C75EED52FACB6E382C00D387D19A8A
rishabhsharma;SWiR0   00006DE813EBEF986612CC83D6072947779BAC1E88987852E915A8C39BFADD42
rishabhsharma;Siq1H   00008FEA272D597D2EC04BEB4175BB28B4E28F7A05D7EE0266395591F22CB8E5
rishabhsharma;JOuxZ   00009B717784110F5F0A26AC7B8DA5EB9F5DD74AF0962EB44B0B08A5100D8886
rishabhsharma;vZsfG   0000B3A9FAEB843213291E8199C04499AC6376A65F55EBBB6D632BC0E0ADE11F
rishabhsharma;MArBQ   00009910EB30EF83A4B3A96172BFBB77F19585160598100B5B3B7845887DEB17
rishabhsharma;/J52+   0000911D63BC4D8E03C9F9CB4BC788AD916E05BD61845A03340F25DF4FC92D89
rishabhsharma;UElmc   0000A2C060FA78C85EC77FDC493DCC0D52ABC90CC014EB6CEE128937F4357158
rishabhsharma;YoUSw   000073517342F8168BC57824BA762278E17ADE9F41D7F8071DE2B5CFC6EC3C15
rishabhsharma;lMY7k   00009DBD9F960E8600BF755337CC532E14253EFB70105047D450362C3BA0F3C2
rishabhsharma;tkLfn   000013171E704230D398379D292D1540B76CF5F665EBA32004F6968EB502BCC1
rishabhsharma;RdNtS   000088AD10DFE020D62D602B6297C746A8E64EA0076D1A3D718696980AF8593E
rishabhsharma;t+y7Q   0000A96971FA0503C91ACDDA6ABB876E5FF9499EF56798E2AC804B6A5A911CCF
rishabhsharma;ypMTl   000050782AFD1933AD3DC9CAEE6BE2769908E54B0BD3FC054B54C676A086B09E
rishabhsharma;IKZ8d   000051FB47E5991E7CDF30F4D527C8FEF3042068BC9AE52CF7B6D44D26A2B28D
rishabhsharma;Cn4Ri   00009AB01E05E38FD4908AAB8DE21312B95FEF2AFED0F0E35EC3E1A974175098
rishabhsharma;YoFwz   000089B85C2B1A4376CAAC8F9957F3C2D30800E4BB43B5B2EDAE93BFF7414DCC
rishabhsharma;6I3pq   000032F8ADA8A94F11822BB67AD725FB0B291FC9D20D7176ECBD30ECB18D1E7A

3. Run time:
The ratio of CPU time to REAL TIME = 3.58

4. Coin with the most 0s found: 8


5. Largest Number of working Machine: 2

