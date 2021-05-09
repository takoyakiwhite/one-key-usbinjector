#!/bin/bash
# by Takoyaki White @Simpleの白
# Thanks for one-key-hidpi @Github
# English description comes from Google Translate:)

systemLanguage=($(locale | grep LANG | sed s/'LANG='// | tr -d '"' | cut -d "." -f 1))
rm -rf tmp
rm -rf output
echo "\033]0;one-key-usbinjector\007"
currentdir="$(cd $(dirname -- $0) && pwd)"
currentefi="/Volumes/EFI/EFI/OC/config.plist"
origmodel=$(sysctl hw.model)
origiousb=$(ioreg -c IOUSBDevice -w0)
model=`echo $origmodel | sed -r 's/hw.model: //g'`
iousb2=`echo $origiousb | grep -ho 'HS[0-9]\{2\}'`
iousb3=`echo $origiousb | grep -ho 'SS[0-9]\{2\}'`
whatsyourchoice="What's your choice?"
whatstrushport="Enter a useless port (format such as HS01 or SS01, press Enter after inputting, if all input is completed, press Enter directly) ："
hackintool="$currentdir/tools/Hackintool.app"
mountefi="$currentdir/tools/MountEFI.app"
select1="Generate USB configuration"
select2="View current port"
select3="11.3 Patch"
select4="Exit"

if [[ "${systemLanguage}" == "zh_CN" ]]; then
select1="定制USB"
select2="查看当前端口"
select3="11.3一键修复"
select4="退出"
whatsyourchoice="你的选择是："
whatstrushport="输入无用端口（格式如HS01或SS01，输完回车，如全部输入完毕，直接回车即可）："
fi

if [ ! -d "$hackintool" ]; then
    printf "\033c"
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "未发现Hackintool辅助工具!"
else
    echo "Hackintool not found!"
fi
    echo
    exit 1
fi

if [ ! -d "$mountefi" ]; then
    printf "\033c"
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "未发现MountEFI辅助工具!"
else
    echo "MountEFI not found!"
fi
    echo
    exit 1
fi

printf "\033c"
echo
cat <<EEF
============================================

             one-key-usbinjector

           with USBInjectAll Modified

          the present for my friends :)
                
               @Takoyaki White
                                           
============================================
EEF

function start() {
    printf "\033c"
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "当前机型：$model"
else
    echo "Current Model：$model"
fi
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "HS端口：
$iousb2"
else
    echo "HS Ports：
$iousb2"
fi
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "SS端口：
$iousb3"
else
    echo "SS Ports：
$iousb3"
fi
sleep 5
open $currentdir/tools/Hackintool.app
mkdir -p $currentdir/tmp
cp -rf $currentdir/sources/USBInjectAll $currentdir/tmp/USBInjectAll
echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "如Hackintool辅助工具未主动打开，请手动运行！"
else
    echo "If the Hackintool auxiliary tool is not opened actively, please run it manually! "
fi
echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "进入Hackintool/USB栏下，插满计算机的所有USB/Type-C接口"
    echo "（提醒：绿色为已插入，白色无用）"
else
    echo "Enter the Hackintool/USB column, plug in all the USB/Type-C ports of the computer. "
    echo "(Reminder: Green is inserted, White is useless)"
fi
echo
    printf "\033c"
    echo.>>$currentdir/tmp/usbport.txt
    while :
do
    printf "\033c"
    echo
    cat $currentdir/tmp/usbport.txt
    echo
    read -p $whatstrushport port
    [ -z $port ] && break
    echo $port >> $currentdir/tmp/usbport.txt
    sed -i '' "/<key>$port<\/key>/, /<\/dict>/d" tmp/USBInjectAll/Contents/Info.plist
done
mv $currentdir/tmp/USBInjectAll $currentdir/tmp/USBInjectAll.kext
mkdir $currentdir/output
mv $currentdir/tmp/USBInjectAll.kext $currentdir/output/
open $currentdir/output/
printf "\033c"
rm -rf $currentdir/tmp
echo
echo "All Done. :)"
echo
exit 1
}

function usblist() {
    printf "\033c"
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "当前机型：$model"
else
    echo "Current Model：$model"
fi
echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "HS端口：
$iousb2"
else
    echo "HS Ports：
$iousb2"
fi
echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "SS端口：
$iousb3"
else
    echo "SS Ports：
$iousb3"
fi
echo
main
}

function xhciportlimit() {
if [ ! -f "$currentefi" ]; then
    printf "\033c"
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "未发现OpenCore引导分区!"
else
    echo "No OpenCore boot partition found!"
fi
    echo
    printf "\033c"
    echo   
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "如MountEFI辅助工具未主动打开，请手动运行！"
else
    echo "If the MountEFI auxiliary tool is not actively opened, please run it manually!"
fi
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    echo "请挂载OpenCore的EFI引导分区（选择磁盘里有OpenCore字样的数字即可）"
else
    echo "Please mount OpenCore's EFI boot partition (select the number with OpenCore in the disk) "
fi
    open $currentdir/tools/MountEFI.app
    echo
if [[ "${systemLanguage}" == "zh_CN" ]]; then
    read -p "如果挂载完毕，请按任意键继续 ..."
else
    read -p "If the mounting is complete, press any key to continue..."
fi
    fi
    if [ ! -f "$currentefi" ]; then
    xhciportlimit
    fi
    # White flag for my customer
    if [ ! -f "/Volumes/EFI/EFI/OC/whiteflag" ]; then
    touch /Volumes/EFI/EFI/OC/whiteflag
    echo 11.3 Fixed by @Takoyaki White >> /Volumes/EFI/EFI/OC/whiteflag
    echo ":)" >> /Volumes/EFI/EFI/OC/whiteflag
    fi
    sed -i "" '/XhciPortLimit/{n;s/true/false/;}' $currentefi
    printf "\033c"
    rm -rf $currentdir/tmp
    echo
    echo "All Done. :)"
    echo
    exit 1
}

function bye() {
    printf "\033c"
    echo
    echo "Good Bye :)"
    echo
    rm -rf $currentdir/tmp
    exit 1
}

function main() {
    echo ""
    echo 1. ${select1}
    echo 2. ${select2}
    echo 3. ${select3}
    echo 4. ${select4}
    echo ""
    read -p ${whatsyourchoice} input
    case ${input} in
    1)
    start
        ;;
    2)
    usblist
        ;;
    3)
    xhciportlimit
        ;;
    4)
    bye
        ;;
    *)
    printf "\033c"
    echo
    echo "Nothing happened :("
    echo
    rm -rf $currentdir/tmp
    exit 1
        ;;
    esac
}

main
