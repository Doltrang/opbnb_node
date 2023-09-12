#!/bin/bash
path=`pwd`
export OPBNB_WORKSPACE=${path}/data
cd $OPBNB_WORKSPACE
cp $OPBNB_WORKSPACE/opbnb/assets/testnet/genesis.json $OPBNB_WORKSPACE/op-geth-data
cp $OPBNB_WORKSPACE/opbnb/assets/testnet/rollup.json $OPBNB_WORKSPACE/op-node-data

openssl rand -hex 32 > jwt.txt
cp jwt.txt $OPBNB_WORKSPACE/op-geth-data
cp jwt.txt $OPBNB_WORKSPACE/op-node-data

# init op-geth genesis
cd $OPBNB_WORKSPACE/op-geth-data
mkdir datadir
./op-geth --datadir ./datadir init genesis.json