echo ZenithProxyForAndroid（脚本由zt3927编写）
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 清理环境ing。。。
rm *.jar
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 请使用Termux终端软件。。。
echo 开始更换软件源。。。
sed -i 's@^deb.*stable main@deb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
echo 开始更新软件包。。。（如出现询问，请一律输入y）
apt update && apt upgrade
echo 开始请求存储权限，请同意！
termux-setup-storage
echo 开始下载必要软件包。。。（如出现询问，请一律输入y）
pkg install wget
pkg install openjdk-21
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo 开始下载ZenithProxy核心。。。
wget "https://github.com/rfresh2/ZenithProxy/releases/download/3.4.2%2Bjava.1.21.4.pre/ZenithProxy.jar"
echo 下载完成，开始启动核心。。。
java -Xmx300M -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:+PerfDisableSharedMem -jar ZenithProxy.jar