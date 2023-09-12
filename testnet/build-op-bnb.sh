#!/bin/bash
path=`pwd`
export OPBNB_WORKSPACE=${path}/data
mkdir -p $OPBNB_WORKSPACE
cd $OPBNB_WORKSPACE
git clone git@github.com:bnb-chain/opbnb.git
cd opbnb/op-node
git checkout release/testnet
make op-node
mkdir -p $OPBNB_WORKSPACE/op-node-data
cp ./bin/op-node $OPBNB_WORKSPACE/op-node-data

cd $OPBNB_WORKSPACE
git clone git@github.com:bnb-chain/op-geth.git
cd op-geth
git checkout develop
make geth
mkdir -p $OPBNB_WORKSPACE/op-geth-data
cp ./build/bin/geth $OPBNB_WORKSPACE/op-geth-data/op-geth