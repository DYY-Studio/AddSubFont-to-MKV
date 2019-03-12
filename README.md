AddSubFont-to-MKV
-
#### Copyright(c) 2018-2019 yyfll(yanyifei66@gmail.com)
#### 本批处理是遵守GNU通用公共许可协议第二版(GPLv2)的自由软件
#### 本批处理是用于将字幕和字体通过MKVmerge快速封装到MKV中的无用批处理
#### 本批处理需要MKVmerge作为依赖

EasyUse 1.0
-
	没想到刚发布停止更新公告没几天就出来了更新......
	EasyUse版本是为了方便广大用户的高端使用而开发出来的
	这个版本对命令行开关的输入方式进行了优化，不再需要缺省缺省缺省缺省了
	但是EasyUse中很多功能还未经测试，所以如果您碰巧碰到了BUG，非常欢迎您联系我

系统要求
-
* 系统：Windows 7/8/8.1/10(32位/64位均兼容)
* 处理器：能够正常运行Windows
* 内存：能够正常运行Windows
* 显卡：能够正常运行Windows
* 网络：不需要
* 磁盘性能：只要不卡死都无所谓。但建议持续读写速度80MB/s以上，传输速度越快处理越快(重封装说到底就是拷贝)
* 磁盘空闲：10MB(视频存放盘至少需要拥有[视频大小×2+字幕+字体包大小]的空间)
* 依赖组件：mkvmerge.exe必须在同一文件夹下或在%path%中的任意文件夹下

		
开始混流
-
* 双击打开"ASFMKV.bat"
* 输入要混流视频所在的路径或该文件的完整路径(或从资源管理器把文件/文件夹拖入CMD窗口)
* (同上)其实你也可以直接把文件/文件夹直接拖进ASFMKV，就像拖进回收站那样
* 等待ASFMKV生成文件列表
* 等待MKVmerge完成混流任务
* (可选)如果混流成功则删除源文件


详细信息
-
### 可接受的媒体容器格式：
* MKV (Matroska Video) 
* MP4/MPEG/M4V/MPG (MPEG) 
* RM/RMVB (RealMedia)
* AVI (Audio Video Interleaved) 
* FLV (Flash Video) 
* WMV (Windows Media Video) 
* OGG (OGG) 
* MOV/QT (QuickTime) 
* M2TS (MPEG-2 Transport Stream) 
* WEBM (Google WebM) (1811GAMMA+支持）

### 可接受的字幕格式：
* ASS/SSA (SubStation Alpha)
* SRT (SubRip Text) 
* SUP/PGS (HDMV Presentation Graphic Stream Subtitles) 
* IDX+SUB (MPEG-4 Timed Text)

### 可接受的字体格式：
* TTC/TTF (TrueType Font) 
* OTF (OpenType Font)

### 输出的媒体容器格式：
* MKV (Matroska)

支持问题
-
为什么不支持MXF（Material eXchange Format）

	MKVmerge默认的3%头读取难以分离MXF的音频流，加之MXF用量极少，因此不在支持列表中
为什么可接受格式少

	为了让CMD区分文件夹中的媒体格式与非媒体格式，我直接在Batch中内建了文件后缀名匹配表，因为全格式兼容量太大了所以目前只有这些主流格式
对于不兼容的格式怎么办

	自己用MKVToolNix GUI之类的玩意封吧，未来有打算加入自定义匹配表，但是大概会咕咕咕吧(咕咕咕咕咕！咕咕咕！)

外部调用
-
(全部更新至EasyUse1.0)
### 调用开关：
	?h 			显示帮助(最高优先)
	?del [y/n] 		是否删除输入文件
	?sub [y/n] 		没有字幕时是否嵌入字体文件
				(注意：sub开关在开启时会自动允许字体封装，即notfont为任意值)
	?out [path] 		输出目录
	?dir [y/n] 		是否搜索子目录
	?dbm [y/n]:[y/n] 	是否使用测试模式和空输出(测试模式开关:空输出开关)
				(注意：dbm开关若只输入一个y则同时开启测试模式和空输出，反之亦然)
	?ffl [filter] 		文件过滤器
	?pri [1-3/input] 	选择进程优先级
	?uil [1-4/input]	选择Mkvmerge的语言

### 调用注意
	开关必须用引号括起，比如
	"?output %APPDATA%\test" "?pri 3" "?dbm n:y"
	
### 调用方法①(CMD)
	ASFMKV "输入路径" "[调用开关]"

### 调用方法②(CMD)
	Call "(带有某些符号的路径)\ASFMKV" "输入路径" "[调用开关]"
	(如果路径或文件名中含有括号、空格、与号或其他影响CMD的符号，可以使用Call指令并用双引号括起路径)
	
### 调用方法③:
	直接往BAT拖入文件或文件夹，自动运行重封装并输出到源文件夹
	该情况下所有开关均为默认值
	
### 开关解释
#### 进程优先级
	快速优先级选项：
	[1] lower(较低)
	[2] normal(标准)
	[3] higher(较高)
	您也可以直接输入优先级，比如 "?pri highest"
	可选的优先级有 lowest(最低),lower(较低),normal(标准),higher(较高),highest(最高/实时)

#### MKVmerge输出语言
	快速语言选项:
	[1] en(English)
	[2] zh_CN(简体中文)
	[3] zh_TW(繁體中文)
	[4] ja(日本語)
	该语言选项仅应用于mkvmerge输出部分，并仅在支持时使用
	您也可以直接输入语言，比如 "?uil zh_CN"
	可选的语言详见"mkvmerge --ui-language list"

#### 文件过滤器
	过滤器使用标准文件搜索语法，例如：
	"*.mkv"将只输入所有文件后缀名为MKV的文件
	"*SEFO*.*"将会输入所有文件名中含有"SEFO"的文件(不区分大小写)且不管后缀名是什么
	其实主要就是通配符的问题罢了
	

更新记录
-
版本名(注释 或 发布代号/开发季度)

NON-DL：即在作者硬盘上没有备份的绝版版本

### 最新版本
#### EasyUse1.0
	命令行开关全部重写
	开关分析模块重写
	启用测试模式时不再强制开启空输出
	封装时会显示变量状态

### 其他版本
#### Early TEST(FFmpeg)
	？
#### Early TEST(MKVmerge)
	换用MKVmerge替代麻烦得要死的FFmpeg作为混流器
	支持字体封装
#### 2018.4 
*NON-DL*
	
	现在会对带有与号(&)的文件名调用"Module_DeleteAND"来转换与号为下划线(_)
	现在如果输入空路径会要求用户再次输入路径
	所有组件全部收纳进"AddSubFontToMKV.bat"
#### 2018.5
	修复没有外挂字幕时不能添加内嵌字体的BUG
	加入NotSub变量控制是否在没有外挂字幕时添加内嵌字体
	加入NotFont变量控制是否添加内嵌字体
		(流传输时会先下载头数据，而字体等附件内嵌在头数据中，加载较为耗时，该开关允许用户只嵌入外挂字幕)
	修复删除源文件时输出文件的后缀名与源文件相同而不是".mkv"的BUG
	加入SearchFilter变量，支持文件过滤
	现在可以指定输出路径
#### 2018.6
*NON-DL*

	修复了程序无法正常运行的错误
#### 2018.7
*NON-DL*

	修复了NotSub变量失效
	添加内置帮助页面
#### 2018.10
	加入SubDir变量，可以手动选择是否排除子目录
#### 1811BETA(?/2018.11)
	？
#### 1811GAMMA(?/2018.11)
	现在会将被删去与号的文件名复原
	现已允许输入Google WebM媒体格式
#### 1812TEST(181130/2018.11)
	优化启用subdir时文件列表生成缓慢的问题
	(启用subdir时不再使用FOR遍历整个目录树，而是使用DIR直接读取顶级目录的内容)
#### 1902-1(190203/2019.02)
	增强了对带引号路径的兼容性
	(会先尝试去除前后的字符再判断文件是否存在)
#### 1902-2(190206/2019.02)
	优化启用subdir时文件列表生成缓慢的问题
	(对Module_GetOutputPath中的旧算法进行了更新)
	界面重制
#### 1902-3(190212/2019.02)
*NON-DL*

	修复输入单文件时不生成Filelist导致无法正常运行的问题
	现已支持外部调用时定义subdir
	重新排序外部调用定义顺序
	DEBUG_MODE实装
	字体现已支持不搜索子目录(subdir)
#### 1902-3(190215/2019.02)
	NUL_OUTPUT实装
#### 1902-4(190217/2019.02)
	新增log系统，当mkvmerge发生警告时会再次封装并重定向输出至log文档
	-(NUL_OUTPUT开启时则需要发生足够停止封装的错误才会记录)
#### 1902-5(190218/2019.02)
	"Replace for Batch V2+"模块实装
	对启用subdir时FindStr对文件过滤器输入报错的问题进行了修复(未经测试)
	启用测试模式时会强制开启空输出
	现在在文件路径超长(达到或超过260字符)时会发出警告
	增强对带引号路径的兼容性
#### 1902-5-1(190221/2019.02)
	"Replace for Batch V3"模块更新

内部变量一览
-
	-ifolder 	存放输入路径的环境变量
	-rf	 	存放程序所在目录的环境变量
	-vpath 		存放要输入到其他模块中的视频文件路径
	-error 		存放错误总数
	-count 		存放目录下的文件总数
	-working 	存放已编码完成的文件总数
	-opath 		存放输出路径
	-rvpath 	存放输出文件名(有扩展名)
	-sub[%num%] 	(数组)存放字幕文件路径
	-font[%num%] 	(数组)存放字体文件路径
	-filename 	存放输出文件名(无扩展名)

挂接组件
-
本BAT使用了以下挂接组件

### MKVmerge(LICENSE: GPLv2)
	Copyright© 2002–2018 Moritz Bunkus
	https://mkvtoolnix.download/downloads.html

### Replace for Batch(LICENSE: GPLv2)
	Copyright© 2018-2019 yyfll(yanyifei66@gmail.com)
	* [Delete AND(&) (CALL Ver.)]
		该版本使用CALL接口，作为依赖组件使用，变量%return%为其返回值
	* [Delete AND(&) (DIR Ver.)]
		该版本是独立程序，用于替换文件夹下所有符合匹配并带有"&"号的文件名
	* [Replace for Batch V3]
		使用CALL接口的泛用性Replace模块，可供挂接使用

内部组件
-
本BAT使用了以下原创组件

	Copyright© 2018-2019 yyfll(yanyifei66@gmail.com)
	Module_FormatDate	日期格式化模块
	Module_EncapsulationMKV	[专用]封装控制模块
	Module_GetOutputPath	[专用]输出控制模块
	Module_DEBUG		除错辅助模块
