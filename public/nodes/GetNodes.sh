#! /bin/bash
###
 # @Author: Francis Fu
 # @Date: 2023-02-05 15:17:06
 # @LastEditTime: 2023-02-05 19:04:28
 # @LastEditors: Francis Fu
### 
echo ""
# 输出当前时间
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
echo "-------清理目录-------"
sudo rm -rf /www/wwwroot/francisfu.com/nodes/nodes
sudo mkdir /www/wwwroot/francisfu.com/nodes/nodes
cd /www/wwwroot/francisfu.com/nodes/nodes
echo "-----开始下载-----"
sudo wget -O G1B.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity
sudo wget -O G1M.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.txt
sudo wget -O G1C.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.yml
sudo wget -O G2B.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir
sudo wget -O G2M.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir.txt
sudo wget -O G2C.txt https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/EternityAir.yml
echo "-----下载成功-----"
exit
