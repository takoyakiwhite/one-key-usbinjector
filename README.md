# one-key-usbinjector
 the present for my friends :)

脚本制作用时：8分钟

为我的朋友而做

QQ交流群：775619272 / 976273254

by 「Takoyaki White」

作者の话：这是一个完全使用Shell命令编写的脚本（适用于macOS），实际上完全能用Shell实现，因时间问题（摸鱼qwq）就采用了一些现成的辅助工具来执行一些操作，理论上适用于全机型，仅在Github/酷安/远景上发布，转载请注明

使用教学：

第一步：运行command脚本（请手动输入密码提权，密码不显示）

第二步：查看当前端口（如USB端口加起来超过15个，请看第三步，不超过或正好请跳过第三步）

第三步：定制USB，脚本会自动打开Hackintool，请进入Hackintool的USB栏，这时请插上你USB的所有端口（USB2.0、USB3.0需分别插入USB2.0与USB3.0设备、TypeC），插入完成后Hackintool会把已连接的端口标绿，请将无变化（白色）的无用端口记下，并分别输入到脚本中，比如输入HS01，回车，脚本会自动记录你已经输入的端口并呈现，确认无误后，直接回车，脚本会自动修改USBInjectAll（Modified by @Takoyaki White）请替换至EFI/OC/Kext下即可（可配合sources下的XHCI-Injector使用）

「如果想升级11.3，而定制完后USB端口还是超过15个，请舍弃一些不必要的端口」

第四步：升级11.3可能会遇到USB异常的问题，这是因为11.3下的15端口限制补丁已经失效，不用担心，通过我们第三步定制好的USB，这已经没有问题，脚本会帮你自动关闭这个补丁，请执行11.3一键修复，如果这时你没有挂载EFI，请在弹出的MountEFI中查看带有OpenCore的磁盘，并输入它所在的数字，输入密码提权，即可成功挂载，挂载完成后，请继续，脚本会自动关闭已经生效的补丁

第五步：放心升级或使用吧 ～～～

Credit：

https://github.com/headkaze/Hackintool （Hackintool辅助工具）

https://github.com/Andrej-Antipov/MountEFI（EFI挂载工具）

https://github.com/takoyakiwhite/USBInjectAll-Mod（USBInjectAll修改版）

https://github.com/xzhih/one-key-hidpi（一些灵感）


Thanks for my friends:)
