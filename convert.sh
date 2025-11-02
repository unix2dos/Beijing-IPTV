#!/bin/bash
input="IPTV-Mobile.m3u"
output="IPTV-Mobile-parsed.txt"

# 清空输出文件
> "$output"

# 用 while 循环逐行读取
while IFS= read -r line; do
    # 如果是 #EXTINF 开头
    if [[ "$line" == \#EXTINF* ]]; then
        # 提取逗号之后的节目名
        name="${line#*,}"
        # 读取下一行（URL）
        read -r url
        # 输出结果
        echo "${name},${url}" >> "$output"
    fi
done < "$input"

