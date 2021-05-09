English：

the present for my friends :)

Script production time: 8 minutes

For my friend

QQ exchange group: 775619272/976273254

by "Takoyaki White"

Author's words: This is a script written entirely using Shell commands (for macOS). In fact, it can be completely implemented with Shell. Due to time issues (touch fish qwq), some ready-made auxiliary tools are used to perform some operations. Theory The above is applicable to all models, only published on Github/Coolapk/PCBeta, please indicate when reprinting

Use teaching:

The first step: run the command script (please manually enter the password to get root, the password is not displayed)

Step 2: Check the current ports (if the total number of USB ports is more than 15, please see the third step, please skip the third step if it does not exceed or happens to be)

Step 3: Customize the USB, the script will automatically open Hackintool, please enter the USB bar of Hackintool, then please plug in all your USB ports (USB2.0、USB3.0 needs to be plugged into USB2.0 and USB3.0 devices separately、TypeC), Hackintool will mark the connected port green after the insertion is complete. Please write down the useless ports that have not changed (white) and enter them into the script respectively. For example, enter HS01 and press Enter, and the script will automatically record what you have entered After confirming that it is correct, press Enter, the script will automatically modify USBInjectAll (Modified by @Takoyaki White), please replace it under EFI/OC/Kext (can be used with XHCI-Injector under sources)

"If you want to upgrade to 11.3 and there are still more than 15 USB ports after customization, please discard some unnecessary ports."

Step 4: Upgrading 11.3 may encounter USB abnormal problems. This is because the 15-port restriction patch under 11.3 has become invalid. Don’t worry, we have customized the USB in the third step. This is no problem. The script will help you. To automatically close this patch, please perform one-click repair in 11.3. If you have not mounted EFI at this time, please check the disk with OpenCore in the pop-up MountEFI, and enter the number where it is located, enter the password to increase the privilege, and you can successfully mount After the installation is complete, please continue, the script will automatically close the patch that has taken effect

Step 5: Feel free to upgrade or use it~~~

Credit:

https://github.com/headkaze/Hackintool (Hackintool auxiliary tool)

https://github.com/Andrej-Antipov/MountEFI (EFI mount tool)

https://github.com/takoyakiwhite/USBInjectAll-Mod (USBInjectAll modified version)

https://github.com/xzhih/one-key-hidpi (Some inspiration)

Thanks for my friends:)

Chinese（中文）：

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

https://github.com/Andrej-Antipov/MountEFI （EFI挂载工具）

https://github.com/takoyakiwhite/USBInjectAll-Mod （USBInjectAll修改版）

https://github.com/xzhih/one-key-hidpi （一些灵感）

Thanks for my friends:)
