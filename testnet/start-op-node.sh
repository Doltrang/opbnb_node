#!/bin/bash
path=`pwd`
set -ex
export OPBNB_WORKSPACE=${path}/data
cd $OPBNB_WORKSPACE/op-node-data

execFile=$OPBNB_WORKSPACE/op-node-data/op-node
if [ -f "$execFile" ]; then
    echo "no need build"
else
   echo "need build"
   echo "bash build-op-bnb.sh"
   echo "bash data_preparation.sh"
   exit
fi

export L2_RPC=http://localhost:8551
# it's better to replace the L1_RPC with your own BSC Testnet RPC Endpoint for stability
export L1_RPC=https://data-seed-prebsc-1-s1.binance.org:8545
# replace the p2p private key with yours
# you can generate a new one with `openssl rand -hex 32`
if test -f "p2p_priv_key.txt"; then
    p2p_priv_key=`cat p2p_priv_key.txt`
fi
if [[ -z $p2p_priv_key ]]; then
    p2p_priv_key=`openssl rand -hex 32`
    echo " p2p_priv_key is not exit. create it $p2p_priv_key"
    echo $p2p_priv_key >> p2p_priv_key.txt
fi
export P2P_PRIV_KEY=$p2p_priv_key
export P2P_BOOTNODES=enr:-J24QJKXHEkIhy0tmIk2EscMZ2aRrivNsZf_YhgIU51g4ZKHWY0BxW6VedRJ1jxmneW9v7JjldPOPpLkaNSo6cXGFxqGAYpK96oCgmlkgnY0gmlwhANzx96Hb3BzdGFja4PrKwCJc2VjcDI1NmsxoQMOCzUFffz04eyDrmkbaSCrMEvLvn5O4RZaZ5k1GV4wa4N0Y3CCIyuDdWRwgiMr
./op-node \
  --l1.trustrpc \
  --sequencer.l1-confs=15 \
  --verifier.l1-confs=15 \
  --l1.http-poll-interval 3s \
  --l1.epoch-poll-interval 45s \
  --l1.rpc-max-batch-size 20 \
  --rollup.config=./rollup.json \
  --rpc.addr=0.0.0.0 \
  --rpc.port=8546 \
  --p2p.sync.req-resp \
  --p2p.listen.ip=0.0.0.0 \
  --p2p.listen.tcp=9003 \
  --p2p.listen.udp=9003 \
  --snapshotlog.file=./snapshot.log \
  --p2p.priv.raw=$P2P_PRIV_KEY \
  --p2p.bootnodes=$P2P_BOOTNODES \
  --metrics.enabled \
  --metrics.addr=0.0.0.0 \
  --metrics.port=7300 \
  --pprof.enabled \
  --rpc.enable-admin \
  --l1=${L1_RPC} \
  --l2=${L2_RPC} \
  --l2.jwt-secret=./jwt.txt \
  --log.level=debug