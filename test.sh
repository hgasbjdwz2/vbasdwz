wget https://github.com/Titannet-dao/titan-node/releases/download/v0.1.20/titan-edge_v0.1.20_246b9dd_linux-amd64.tar.gz
tar xf titan-edge_v0.1.20_246b9dd_linux-amd64.tar.gz
cp /app/titan-edge_v0.1.20_246b9dd_linux-amd64/libgoworkerd.so /app
cp /app/titan-edge_v0.1.20_246b9dd_linux-amd64/titan-edge /app
export LD_LIBRARY_PATH=$LD_LIZBRARY_PATH:./libgoworkerd.so
nohup ./titan-edge daemon start --init --url https://cassini-locator.titannet.io:5000/rpc/v0  > edge.log 2>&1 &
sleep 30
./titan-edge config set --storage-size 250GB
./titan-edge daemon stop
nohup ./titan-edge daemon start --init --url https://cassini-locator.titannet.io:5000/rpc/v0  > edge.log 2>&1 &
sleep 30
./titan-edge bind --hash=EED1785F-1B95-46B4-9274-1957B983A64B https://api-test1.container1.titannet.io/api/v2/device/binding
