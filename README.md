Copyright(c) 2018-2019 yyfll([Others]yanyifei66@gmail.com)

本批处理是遵守GNU通用公共许可协议第二版及其后版本(GPLv2 or later)的自由软件


[停止更新]

2019年2月21日，我很遗憾的在此宣布停止本批处理的更新

当初的开发初衷是便利我自己播nPlayer的时候插字体进视频，钻研了一下发现不需要这么麻烦，直接丢Font进去就好了

所以本批处理将会就此停止更新，反正除了我大概也没有人、不会有人使用它

如果您偶然看到本Readme.txt并使用了ASFMKV，我十分高兴它能便利各位的生活，而不仅仅是我的生活

1902-5-1这个最终版本其实还是有很多问题，很多功能都是实装后因为我用不上所以未经测试的功能

如果您偶然使用后还能发现什么BUG或者问题，我还是很欢迎各位发邮件给我，我会尽力抽空修正，即使停止更新之后依然如此，感谢各位的使用

至于Replace for Batch，目前是定版V3了，似乎已经稳定没有什么大的问题，更新大概也就此停止了


[系统要求]

系统：Windows 7/8/8.1/10(32位/64位均兼容)

(如果您使用Windows 7，请使用ANSI编码版本，在Windows 7进行代码页切换可能会导致CMD崩溃)

处理器：能够正常运行Windows

内存：能够正常运行Windows

显卡：能够正常运行Windows

网络：不需要

磁盘性能：只要不卡死都无所谓。但建议持续读写速度80MB/s以上，传输速度越快处理越快(重封装说到底就是拷贝)

磁盘空闲：10MB(视频存放盘至少需要拥有[视频大小×2+字幕+字体包大小]的空间)

依赖组件：mkvmerge.exe必须在同一文件夹下或在%path%中的任意文件夹下

		
[开始混流]

1、双击打开"ASFMKV.bat"

2、输入要混流视频所在的路径或该文件的完整路径(或从资源管理器把文件/文件夹拖入CMD窗口)

*其实你也可以直接把文件/文件夹直接拖进ASFMKV，就像拖进回收站那样

3、等待ASFMKV生成文件列表

4、等待MKVmerge完成混流任务

(可选)5、如果混流成功则删除源文件


[详细信息]

可接受的媒体容器格式：MKV(Matroska Video) MP4/MPEG/M4V/MPG(MPEG) RMVB(RealMedia Variable Bitrate) RM(RealMedia) AVI(Audio Video Interleaved) FLV(Flash Video) WMV(Windows Media Video) OGG(OGG) MOV/QT(QuickTime) M2TS(MPEG-2 Transport Stream) WEBM(Google WebM)[WEBM 需1811GAMMA+]

可接受的字幕格式：ASS/SSA(SubStation Alpha) SRT(SubRip Text) SUP/PGS(HDMV Presentation Graphic Stream Subtitles) IDX+SUB(MPEG-4 Timed Text)

可接受的字体格式：TTC/TTF(TrueType Font) OTF(OpenType Font)

输出的媒体容器格式：MKV(Matroska)

分离器：MKVmerge

混流器：MKVmerge

(您可以自行更新MKVmerge或替换MKVmerge为64-Bit版本)


[支持问题]

*为什么不支持MXF（Material eXchange Format）？

	MKVmerge默认的3%头读取难以分离MXF的音频流，加之MXF用量极少，因此不在支持列表中
*理论上MKVmerge不应该支持分离大部分格式吗？为什么可接受格式那么少？

	为了让CMD区分文件夹中的媒体格式与非媒体格式，我直接在Batch中内建了文件后缀名匹配表，因为全格式兼容量太大了所以目前只有这些主流格式
*对于不兼容的格式怎么办？

	自己用MKVToolNix GUI之类的玩意封吧，未来有打算加入自定义匹配表，但是大概会咕咕咕吧(咕咕咕咕咕！咕咕咕！)

[外部调用]

调用选项：

	[2018.5] "输入路径" "输出路径" "NotDel变量" "NotSub变量" "SearchFilter变量"
	[1811BETA] "输入路径" "输出路径" "优先级" "UI语言" "NotDel变量" "NotSub变量" "SearchFilter变量"
	[1902-3] "输入路径" "输出路径" "NotDel变量" "NotSub变量" "SubDir变量" "SearchFilter变量" "优先级" "UI语言" "测试模式"
调用方法①(CMD)：

	[1902-3调用选项示例]
	ASFMKV "输入路径" "输出路径" "NotDel变量" "NotSub变量" "SubDir变量" "SearchFilter变量" "优先级" "UI语言" "测试模式"
		(如果与AddSubFontToMKV在同一文件夹下则可以使用该指令)

调用方法②(CMD):

	[1902-3调用选项示例]
	Call "(带有某些符号的路径)\ASFMKV" "输入路径" "输出路径" "NotDel变量" "NotSub变量" "SubDir变量" "SearchFilter变量" "优先级" "UI语言" "测试模式"
		(如果路径或文件名中含有括号、空格、与号或其他影响CMD的符号，可以使用Call指令并用双引号括起路径)
		
调用方法③:

	直接往BAT拖入文件或文件夹，自动运行重封装

选项缺省:

	[-] 使用"-"号表示该选项空缺，空缺选项将使用程序默认值
		(如果空缺输入路径将会在程序中询问)
	例如: AddSubFontToMKV - "D:\Video" - - - "*.mp4" - - -
		(该语法将会指定输出文件夹为D:\Video，指定只能输入后缀名为mp4的文件，其他选项空缺)

MKVmerge进程优先级(优先级)：

	[0] 较低进程优先级，有可能减慢封装速度，但可能会加快其他程序的磁盘读写
	[1] 标准进程优先级
	[2] 较高进程优先级，可能略微加快封装速度，但可能会减慢甚至阻止其他低优先级程序的磁盘读写
	[其他] 无效参数，使用默认值

MKVmerge界面语言(UI语言)：

	[0] English(en)
	[1]	简体中文(zh_CN)
	[2] 正體中文(zh_TW)
	[3] 日本語(ja)
	[其他] 无效参数，使用默认值
	
NotDel变量：

	[0] 0：不删除源文件
	[1] 任意赋值：删除源文件

NotSub变量:

	[0] 0：没有外挂字幕不嵌入字体
	[1] 任意赋值：没有外挂字幕时依然嵌入字体

SubDir变量:

	[0] 0：不搜索子目录
	[1] 任意赋值：搜索所有子目录

测试模式:

	[0] 0：启用测试模式，关闭所有CLS、开启Echo
	[1] 任意赋值：不启用测试模式

SearchFilter语法：

	搜索过滤器使用标准文件搜索语法，例如：
	"*.mkv"将只输入所有文件后缀名为MKV的文件
	"*SEFO*.*"将会输入所有文件名中含有"SEFO"的文件(不区分大小写)且不管后缀名是什么
	

[更新记录]

[版本名(注释 或 发布代号/开发季度)]

NON-DL：即在作者硬盘上没有备份的绝版版本

	[Early TEST(FFmpeg)]
		？
	[Early TEST(MKVmerge)]
	
		换用MKVmerge替代麻烦得要死的FFmpeg作为混流器
		支持字体封装
	[2018.4] *NON-DL*
		现在会对带有与号(&)的文件名调用"Module_DeleteAND"来转换与号为下划线(_)
		现在如果输入空路径会要求用户再次输入路径
		所有组件全部收纳进"AddSubFontToMKV.bat"
	[2018.5]
		修复没有外挂字幕时不能添加内嵌字体的BUG
		加入NotSub变量控制是否在没有外挂字幕时添加内嵌字体
		加入NotFont变量控制是否添加内嵌字体
			(流传输时会先下载头数据，而字体等附件内嵌在头数据中，加载较为耗时，该开关允许用户只嵌入外挂字幕)
		修复删除源文件时输出文件的后缀名与源文件相同而不是".mkv"的BUG
		加入SearchFilter变量，支持文件过滤
		现在可以指定输出路径
	[2018.6] *NON-DL*
		修复了程序无法正常运行的错误
	[2018.7] *NON-DL*
		修复了NotSub变量失效
		添加内置帮助页面
	[2018.10]
		加入SubDir变量，可以手动选择是否排除子目录
	[1811BETA(?/2018.11)]
		？
	[1811GAMMA(?/2018.11)]
		现在会将被删去与号的文件名复原
		现已允许输入Google WebM媒体格式
	[1812TEST(181130/2018.11)]
		优化启用subdir时文件列表生成缓慢的问题
		(启用subdir时不再使用FOR遍历整个目录树，而是使用DIR直接读取顶级目录的内容)
	[1902-1(190203/2019.02)]
		增强了对带引号路径的兼容性
		(会先尝试去除前后的字符再判断文件是否存在)
	[1902-2(190206/2019.02)]
		优化启用subdir时文件列表生成缓慢的问题
		(对Module_GetOutputPath中的旧算法进行了更新)
		界面重制
	[1902-3(190212/2019.02)] *NON-DL*
		修复输入单文件时不生成Filelist导致无法正常运行的问题
		现已支持外部调用时定义subdir
		重新排序外部调用定义顺序
		DEBUG_MODE实装
		字体现已支持不搜索子目录(subdir)
	[1902-3(190215/2019.02)]
		NUL_OUTPUT实装
	[1902-4(190217/2019.02)]
		新增log系统，当mkvmerge发生警告时会再次封装并重定向输出至log文档
		-(NUL_OUTPUT开启时则需要发生足够停止封装的错误才会记录)
	[1902-5(190218/2019.02)]
		"Replace for Batch V2+"模块实装
		对启用subdir时FindStr对文件过滤器输入报错的问题进行了修复(未经测试)
		启用测试模式时会强制开启空输出
		现在在文件路径超长(达到或超过260字符)时会发出警告
		增强对带引号路径的兼容性
	[1902-5-1(190221/2019.02)]
		"Replace for Batch V3"模块更新

[内部变量一览]

	-ifolder 存放输入路径的环境变量
	-rf 存放程序所在目录的环境变量
	-vpath 存放要输入到其他模块中的视频文件路径
	-error 存放错误总数
	-count 存放目录下的文件总数
	-working 存放已编码完成的文件总数
	-opath 存放输出路径
	-rvpath 存放输出文件名(有扩展名)
	-sub[%num%] (数组)存放字幕文件路径
	-font[%num%] (数组)存放字体文件路径
	-filename 存放输出文件名(无扩展名)

[挂接组件]

本BAT使用了以下挂接组件

MKVmerge(LICENSE: GPLv2)

	Copyright© 2002–2018 Moritz Bunkus
	https://mkvtoolnix.download/downloads.html

Replace for Batch(LICENSE: GPLv2 or later)

Copyright© 2018-2019 yyfll(dyystudio@qq.com)

	[Delete AND(&) (CALL Ver.)]
		该版本使用CALL接口，作为依赖组件使用，变量%return%为其返回值
	[Delete AND(&) (DIR Ver.)]
		该版本是独立程序，用于替换文件夹下所有符合匹配并带有"&"号的文件名
	[Replace for Batch V3]
		使用CALL接口的泛用性Replace模块，可供挂接使用

[内部组件]

本BAT使用了以下原创组件

Copyright© 2018-2019 yyfll(dyystudio@qq.com)

	Module_FormatDate		日期格式化模块
	Module_EncapsulationMKV	[专用]封装控制模块
	Module_GetOutputPath	[专用]输出控制模块
	Module_DEBUG			除错辅助模块
