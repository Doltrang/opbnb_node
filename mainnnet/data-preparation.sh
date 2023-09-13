#!/bin/bash
path=`pwd`
export OPBNB_WORKSPACE=${path}/data
cd $OPBNB_WORKSPACE
wget -P op-geth-data https://raw.githubusercontent.com/bnb-chain/opbnb/develop/assets/mainnet/genesis.json
wget -P op-node-data https://raw.githubusercontent.com/bnb-chain/opbnb/develop/assets/mainnet/rollup.json

openssl rand -hex 32 > jwt.txt
cp jwt.txt $OPBNB_WORKSPACE/op-geth-data
cp jwt.txt $OPBNB_WORKSPACE/op-node-data

# init op-geth genesis
cd $OPBNB_WORKSPACE/op-geth-data
mkdir datadir
./op-geth --datadir ./datadir init genesis.json