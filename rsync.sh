#!/bin/bash

# 检查配置文件是否正常
checkConfig()
{
	des=backup 
	user=rsync
	passfile=/etc/www.pwd
	logFile=/tmp/rsync.log
	[ ! -e $passfile ] && echo "please check config !!!" && exit 1
}

checkConfig


# 同步逻辑
syncLogic()
{
	local syncSrc=$1          # 需要同步的源代码目录
	local syncSvrList=$2      # 需要同步的机器列表
	
	/usr/local/bin/inotifywait -mrq --timefmt '%y-%m-%d %H:%M' --format  '%T %w%f %e' \
	--event modify,move,delete,create,attrib $syncSrc | while read  file
	do
	#       echo "-vzrtopg  --delete --progress ${kkkksrc} ${user}@${client}::${des} --password-file=/etc/www.pwd"
		for client in $syncSvrList;
		do
			rsync -vzrtopg --progress $syncSrc $user@$client::$des --password-file=$passfile >> $logFile 2>&1
			#rsync -vzrtopg  --delete --progress ${kkkksrc} ${user}@${client}::${des} --password-file=/etc/www.pwd >> /tmp/rsync.log 2>&1
		done
	#	echo "---------------------------------------------------------------------------"
	done &
}




##############################  nineke同步逻辑 start ########################################

# nineke 机器列表
ninekeBkSvrList=(
"10.25.164.194"
)

ninekeCdnSvrList=(
"10.25.165.101"
)

ninekeWebSvrList=(
"10.25.165.107"
"10.25.165.108"
)

# 同步nineke
ninekeSrc=/data3/publish/petaplay/nineke
ninekeSvrList=(${ninekeBkSvrList[*]} ${ninekeCdnSvrList[*]} ${ninekeWebSvrList[*]})
#syncLogic $ninekeSrc "${ninekeSvrList[*]}"

# 同步nineke_web
ninekeWebPageSrc=/data3/publish/petaplay/ninekeWeb
ninekeWebPageSvrList=(${ninekeBkSvrList[*]} ${ninekeCdnSvrList[*]} ${ninekeWebSvrList[*]})
#syncLogic $ninekeWebPageSrc "${ninekeWebPageSvrList[*]}"

# 同步nineke_stat
ninekeStatSrc=/data3/publish/petaplay/ninekeStat
ninekeStatSvrList=(${ninekeBkSvrList[*]})
#syncLogic $ninekeStatSrc "${ninekeStatSvrList[*]}"

##############################  nineke同步逻辑 end ##########################################





##############################  kkkk同步逻辑 start ########################################

# kkkk 机器列表
kkkkBkSvrList=(
"10.25.165.78"
"10.25.165.155"
)

kkkkCdnSvrList=(
"10.25.165.101"
)

kkkkWebSvrList=(
"10.25.166.89"
"10.25.165.195"
"10.24.143.186"
"10.24.141.176"
"10.24.143.175"
)

# 同步kkkk
kkkkSrc=/data3/publish/petaplay/kkkk
kkkkSvrList=(${kkkkBkSvrList[*]} ${kkkkCdnSvrList[*]} ${kkkkWebSvrList[*]})
#syncLogic $kkkkSrc "${kkkkSvrList[*]}"

# 同步kkkk_openresty
kkkkOpenrestySrc=/data3/publish/petaplay/kkkk_openresty
kkkkOpenrestySvrList=(${kkkkBkSvrList[*]} ${kkkkCdnSvrList[*]} ${kkkkWebSvrList[*]})
#syncLogic $kkkkOpenrestySrc "${kkkkOpenrestySvrList[*]}"

# 同步kkkk_gmWeb
kkkkGmWebSrc=/data3/publish/petaplay/kkkk_gmWeb
kkkkGmWebSvrList=(${kkkkBkSvrList[*]} ${kkkkCdnSvrList[*]})
#syncLogic $kkkkGmWebSrc "${kkkkGmWebSvrList[*]}"

# 同步kkkk_stat
kkkkStatSrc=/data3/publish/petaplay/kkkk_stat
kkkkStatSvrList=(${kkkkBkSvrList[*]})
#syncLogic $kkkkStatSrc "${kkkkStatSvrList[*]}"

##############################  kkkk同步逻辑 end ##########################################




##############################  pokdeng同步逻辑 start ########################################

# pokdeng 机器列表
pokdengBkSvrList=(
"10.25.163.158"
)

pokdengCdnSvrList=(
"10.25.165.101"
)

pokdengWebSvrList=(
"10.24.141.215"
)

# 同步pokdeng
pokdengSrc=/data3/publish/petaplay/pokdeng
pokdengSvrList=(${pokdengBkSvrList[*]} ${pokdengCdnSvrList[*]} ${pokdengWebSvrList[*]})
#syncLogic $pokdengSrc "${pokdengSvrList[*]}"

# 同步pokdeng_openresty
pokdengOpenrestySrc=/data3/publish/petaplay/pokdeng_openresty
pokdengOpenrestySvrList=(${pokdengBkSvrList[*]} ${pokdengCdnSvrList[*]} ${pokdengWebSvrList[*]})
#syncLogic $pokdengOpenrestySrc "${pokdengOpenrestySvrList[*]}"

# 同步pokdeng_gmWeb
pokdengGmWebSrc=/data3/publish/petaplay/pokdeng_gmWeb
pokdengGmWebSvrList=(${pokdengBkSvrList[*]} ${pokdengCdnSvrList[*]})
#syncLogic $pokdengGmWebSrc "${pokdengGmWebSvrList[*]}"

# 同步pokdeng_stat
pokdengStatSrc=/data3/publish/petaplay/pokdeng_stat
pokdengStatSvrList=(${pokdengBkSvrList[*]})
#syncLogic $pokdengStatSrc "${pokdengStatSvrList[*]}"

##############################  pokdeng同步逻辑 end ##########################################




##############################  teetak同步逻辑 start ########################################

# teetak 机器列表
teetakBkSvrList=(
"47.74.241.57"
)

teetakCdnSvrList=(
"47.74.135.130"
)

kkkkWebSvrList=(
"47.74.241.199"
)

# 同步teetak
teetakSrc=/data3/publish/petaplay/teetak
teetakSvrList=(${teetakBkSvrList[*]} ${teetakCdnSvrList[*]} ${kkkkWebSvrList[*]})
#syncLogic $teetakSrc "${teetakSvrList[*]}"

# 同步teetak_gmWeb
teetakGmWebSrc=/data3/publish/petaplay/teetak_gmWeb
teetakGmWebSvrList=(${teetakBkSvrList[*]} ${teetakCdnSvrList[*]})
#syncLogic $teetakGmWebSrc "${teetakGmWebSvrList[*]}"

# 同步teetak_stat
teetakStatSrc=/data3/publish/petaplay/teetak_stat
teetakStatSvrList=(${teetakBkSvrList[*]})
#syncLogic $teetakStatSrc "${teetakStatSvrList[*]}"

##############################  teetak同步逻辑 end ##########################################




##############################  texas同步逻辑 start ########################################

# texas 机器列表
texasBkSvrList=(
"47.74.182.87"
)

texasCdnSvrList=(
"47.88.217.85"
)

texasWebSvrList=(
"47.74.144.255"
)

# 同步texas
texasSrc=/data3/publish/petaplay/texas
texasSvrList=(${texasBkSvrList[*]} ${texasCdnSvrList[*]} ${texasWebSvrList[*]})
syncLogic $texasSrc "${texasSvrList[*]}"

# 同步texasGM
texasGMSrc=/data3/publish/petaplay/texasGM
texasGMSvrList=(${texasBkSvrList[*]} ${texasCdnSvrList[*]})
syncLogic $texasGMSrc "${texasGMSvrList[*]}"

##############################  texas同步逻辑 end ##########################################
