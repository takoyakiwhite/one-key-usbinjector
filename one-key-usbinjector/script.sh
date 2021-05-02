#!/bin/bash
# by Takoyaki White @Simpleの白
# Thanks for one-key-hidpi @Github

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
whatsyourchoice="你的选择是："
whatstrushport="输入无用端口（格式如HS01或SS01，输完回车，如全部输入完毕，直接回车即可）："
hackintool="$currentdir/tools/Hackintool.app"
mountefi="$currentdir/tools/MountEFI.app"
select1="定制USB"
select2="查看当前端口"
select3="11.3一键修复"
select4="退出"

if [ ! -d "$hackintool" ]; then
    printf "\033c"
    echo
    echo "未发现Hackintool辅助工具!"
    echo
    exit 1
fi

if [ ! -d "$mountefi" ]; then
    printf "\033c"
    echo
    echo "未发现MountEFI辅助工具!"
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
    echo "当前机型：$model"
    echo
    echo "HS端口：
$iousb2"
    echo
    echo "SS端口：
$iousb3"
sleep 5
open $currentdir/tools/Hackintool.app
mkdir -p $currentdir/tmp
cp -rf $currentdir/sources/USBInjectAll $currentdir/tmp/USBInjectAll
echo
echo "如Hackintool辅助工具未主动打开，请手动运行！"
echo
echo "进入Hackintool/USB栏下，插满计算机的所有USB/Type-C接口"
echo "（提醒：绿色为已插入，白色无用）"
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
    echo "当前机型：$model"
    echo
    echo "HS端口：
$iousb2"
    echo
    echo "SS端口：
$iousb3"
echo
main
}

function xhciportlimit() {
if [ ! -f "$currentefi" ]; then
    printf "\033c"
    echo
    echo "未发现OpenCore引导分区!"
    echo
    printf "\033c"
    echo   
    echo "如MountEFI辅助工具未主动打开，请手动运行！"
    echo
    echo "请挂载OpenCore的EFI引导分区（选择磁盘里有OpenCore字样的数字即可）"
    open $currentdir/tools/MountEFI.app
    echo
    read -p "如果挂载完毕，请按任意键继续 ..."
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
