#!/bin/bash
path=`pwd`
export OPBNB_WORKSPACE=${path}/data
export OPBNB_MAINNET_VERSION=v0.1.2
mkdir -p $OPBNB_WORKSPACE

cd $OPBNB_WORKSPACE
git clone git@github.com:bnb-chain/opbnb.git
cd opbnb/op-node
git checkout $OPBNB_MAINNET_VERSION
make op-node
mkdir -p $OPBNB_WORKSPACE/op-node-data
cp ./bin/op-node $OPBNB_WORKSPACE/op-node-data

cd $OPBNB_WORKSPACE
git clone git@github.com:bnb-chain/op-geth.git
cd op-geth
git checkout $OPBNB_MAINNET_VERSION
make geth
mkdir -p $OPBNB_WORKSPACE/op-geth-data
cp ./build/bin/geth $OPBNB_WORKSPACE/op-geth-data/op-geth