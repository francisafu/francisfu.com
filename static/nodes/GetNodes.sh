#! /bin/bash
###
 # @Author: Francis Fu
 # @Date: 2023-02-05 15:17:06
 # @LastEditTime: 2023-02-05 16:51:41
 # @LastEditors: Francis Fu
### 
echo ""
# 输出当前时间
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
echo "-------清理目录-------"
WORK_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
sudo rm -rf WORK_DIR/nodes
mkdir WORK_DIR/nodes
cd WORK_DIR/nodes
echo "-----开始下载-----"
sudo wget -O temp https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/README.md
touch G1B
awk '/<details>/{flag=1;next}/<\/details>/{flag=0}flag' temp > G1B
sudo wget -O G2B https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity
sudo wget -O G2M https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.txt
sudo wget -O G2C https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.yml
sudo wget -O G3B https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir
sudo wget -O G3M https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir.txt
sudo wget -O G3C https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir.yml
echo "-----下载成功-----"
exit
