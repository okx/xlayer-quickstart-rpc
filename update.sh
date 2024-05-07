#!/bin/bash

set -e

#判断输入参数的个数
if [ $# != 3 ];then
    echo "usage: ./update.sh {net} {version} {osstool_path}"
    exit 2
fi

NET=$1
VERSION=$2
OSSTOOL=$3

echo "start to update quick start script"

tar -zcvf "$NET-$VERSION".tar.gz "$NET"

echo -n "$NET-$VERSION".tar.gz > "$NET"-latest-release


"$OSSTOOL"/ossutil64 --config="$OSSTOOL"/.ossutilconfig cp -r run_xlayer_"$NET".sh oss://okg-pub-hk/cdn/chain/xlayer/snapshot/run_xlayer_"$NET".sh -f
"$OSSTOOL"/ossutil64 --config="$OSSTOOL"/.ossutilconfig cp -r "$NET"-latest-release oss://okg-pub-hk/cdn/chain/xlayer/snapshot/"$NET"-latest-release -f
"$OSSTOOL"/ossutil64 --config="$OSSTOOL"/.ossutilconfig cp -r "$NET-$VERSION".tar.gz oss://okg-pub-hk/cdn/chain/xlayer/snapshot/"$NET-$VERSION".tar.gz -f
