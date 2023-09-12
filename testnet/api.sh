
curl -X POST -H "Content-Type: application/json"  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' http://localhost:8545

curl -X POST -H "Content-Type: application/json"  --data '{"jsonrpc":"2.0","method":"optimism_syncStatus","params":[],"id":74}' http://localhost:8546

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","id": 1, "params": ["0x1a", false]}' http://localhost:8545

echo "opbnb testnet rpc response:"
curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","id": 1, "params": ["0x1a", false]}' https://opbnb-testnet-rpc.bnbchain.org