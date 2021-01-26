AddSubFont-to-MKV（ASFMKV）
-
**Copyright(c) 2018-2019 yyfll(yanyifei66@gmail.com)**

**本批处理是遵守GNU通用公共许可协议第二版(GPLv2)的自由软件**

**本批处理是用于将字幕和字体通过MKVmerge快速封装到MKV中的无用批处理**

**本批处理需要MKVmerge作为依赖**

目录
-
<!-- vscode-markdown-toc -->
* 1. [为什么我不推荐直接使用ASFMKV嵌入完整字体包](#ASFMKV)
* 2. [系统要求](#-1)
* 3. [开始混流](#-1)
* 4. [格式兼容性](#-1)
	* 4.1. [可接受的媒体容器格式](#-1)
	* 4.2. [可接受的字幕格式](#-1)
	* 4.3. [可接受的字体格式](#-1)
	* 4.4. [输出的媒体容器格式](#-1)
* 5. [常见问题](#-1)
* 6. [自定义变量](#-1)
	* 6.1. [修改方式](#-1)
	* 6.2. [变量表](#-1)
* 7. [外部调用](#-1)
	* 7.1. [调用开关](#-1)
	* 7.2. [开关解释](#-1)
* 8. [挂接组件](#-1)
* 9. [内部组件](#-1)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->


##  1. <a name='ASFMKV'></a>为什么我不推荐直接使用ASFMKV嵌入完整字体包
ASFMKV并没有抽取字体子集这种高级功能，这导致ASFMKV只是很单纯的把整个字体包作为附件塞在MKV文件的头部

这样做的结果就是MKV文件头部臃肿，在流视频下载头部的时候会非常吃力

整个字体包往往会比字幕所需的子集大很多，所以体积大得很没有必要

我建议各位如果有一点技术力，也请不要直接使用ASFMKV嵌入整个字体包而是抽取了字体子集再用ASFMKV嵌入

*（我并没有研究过如何抽子集，应该有一键式抽取嵌入的软件，所以ASFMKV确实没什么价值）*

##  2. <a name=''></a>系统要求
* 系统：Windows 7/8/8.1/10(32位/64位均兼容)
* 处理器：能够正常运行Windows
* 内存：能够正常运行Windows
* 显卡：能够正常运行Windows
* 网络：不需要
* 磁盘性能：只要不卡死都无所谓。但建议持续读写速度80MB/s以上，传输速度越快处理越快(重封装说到底就是拷贝)
* 磁盘空闲：10MB(视频存放盘至少需要拥有[视频大小×2+字幕+字体包大小]的空间)
* 依赖组件：mkvmerge.exe必须在同一文件夹下或在%path%中的任意文件夹下

*从EU1.03起，mkvmerge的路径可以在ASFMKV中设定，详见下方"自定义变量"*

*注意：从EU2.01起（包括全部ExtL），由于JSON转义模块并不支持两条连续的反斜杠，故网络路径不受支持*
		
##  3. <a name='-1'></a>开始混流
1. 双击打开"ASFMKV.bat"
2. 输入要混流视频所在的路径或该文件的完整路径(或从资源管理器把文件/文件夹拖入CMD窗口)

> 其实你也可以直接把文件/文件夹直接拖进ASFMKV，就像拖进回收站那样

3. 等待ASFMKV生成文件列表
4. 等待MKVmerge完成混流任务
5. (可选)如果混流成功则删除源文件


##  4. <a name='-1'></a>格式兼容性
**以下格式兼容性是对非ExtL版本而言的，ExtL版本有内建扩展名表，用户可以自行更改，完整的支持列表见mkvmerge Doc**
###  4.1. <a name='-1'></a>可接受的媒体容器格式
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

###  4.2. <a name='-1'></a>可接受的字幕格式
* ASS/SSA (SubStation Alpha)
* SRT (SubRip Text) 
* SUP/PGS (HDMV Presentation Graphic Stream Subtitles) 
* IDX+SUB (MPEG-4 Timed Text)

***

**以下格式表是内建的，不可更改**
###  4.3. <a name='-1'></a>可接受的字体格式
* TTC/TTF (TrueType Font) 
* OTF (OpenType Font)

###  4.4. <a name='-1'></a>输出的媒体容器格式
* MKV (Matroska)

##  5. <a name='-1'></a>常见问题
**为什么ASFMKV显示输出成功但没有任何文件输出？**
这是一个设计上的失误，由于当前学业繁忙，暂无修正的计划。

请检查您的输入文件夹和ASFMKV的自定义变量设定，有以下可能性：
* 您的文件夹里只有字体文件而没有外挂字幕，同时您没有给NotSub变量赋值
* 您的文件夹里只有字体文件，而外挂字幕在子文件夹，同时您没有给SubDir赋一个非0的值

请使用文本编辑器打开ASFMKV，修改NotSub和SubDir

*（推荐兼容Batch语法高亮的编辑器，这样比较好找变量位置，如VS Code）*

或在使用EU2.10/ExtL1.00及更新版本时时在路径处输入`set`打开内置的设定管理器

*（这样修改的设定并不会保存，下一次还需要再修改）*

**为什么ASFMKV总是显示错误**
`"mkvmerge" is not recognized as an internal or external command`

在EU2.12f和ExtL1.02f（GitHub为ExtL1.02）前的几个版本，由于对mkvmerge检测系统的设计失误

导致如果mkvmerge没有在Path（Windows环境变量）下的路径中的时候，会出现该错误

我的mkvmerge是在%path%下的，因而一直没有发现检测系统的BUG，这点就请各位赶紧更新。

**完成一次输出之后回到主界面时，CMD的标题没有重置**
我的锅，忘了写了。

##  6. <a name='-1'></a>自定义变量
为了符合不同用户的使用习惯，ASFMKV有着大量的自定义变量来符合不同用户的使用习惯

ASFMKV的主界面的"[CUSTOM SETTINGS]"详细显示了各自定义变量的情况和影响

###  6.1. <a name='-1'></a>修改方式
自定义变量位于ASFMKV的头部，用文本编辑器打开就能看到，每个变量都有详细的解释

*推荐使用有Batch语法高亮功能的文本编辑器，如VS Code、UltraEdit，不然改起来很痛苦*

在修改的时候只需要把行首为`set`的那一行，等号后面的值修改为目标值就行了，如`set "notsub=A"`，空缺就直接`set "notsub="`

**EU2.10/ExtL1.00-MG 及更新版本**
在主界面（即要求您输入文件路径、有一坨信息提示的时候）的"文件路径"处输入`set`就可以打开内置的变量管理器

使用内置变量管理器只能更改本次使用时的设定，关闭窗口即重置

###  6.2. <a name='-1'></a>变量表
**ExtList（仅ExtL版本）**
控制ASFMKV的多媒体文件输入过滤器，决定哪些扩展名可以输入

**NotDel**
控制是否要删除输入文件

**NotSub**
控制在没有外挂字幕的时候（或者找不到外挂字幕的时候）是否要封装字体

**NotFont**
控制是否封装字体

**OutPath**
设置文件输出路径（ExtL1.02默认为"[源目录]\REMUX"，其他版本都是直接输出回源目录）

**SearchFilter**
使用通配符`*`、`?`来过滤输入文件

**ui_language**
控制mkvmerge封装时显示的语言，并不更改ASFMKV的主要语言（因为只有一种语言嘛）

**priority**
控制mkvmerge的进程优先级，优先级越高，被其他使用磁盘的应用阻断和干扰的程度就越小

**SubDir**
控制是否搜索子目录

**DEBUG_MODE**
启用命令回显并阻止所有CLS清屏

**NUL_OUTPUT**
测试用，输出到NUL（即不输出文件）

**EXEin**
mkvmerge的路径，用于mkvmerge不和ASFMKV在同一目录或不在`%path%`下的情况


##  7. <a name='-1'></a>外部调用
*(全部更新至EasyUse1.0)*
###  7.1. <a name='-1'></a>调用开关

	?h 			显示帮助(最高优先)
	?del [y/n] 		是否删除输入文件
	?sub [y/n] 		没有字幕时是否嵌入字体文件
				(注意：sub开关在开启时会自动允许字体封装，即notfont为任意值)
	?out [path] 		输出目录
	?dir [y/n] 		是否搜索子目录
	?dbm [y/n]:[y/n] 	是否使用测试模式和空输出(测试模式开关:空输出开关)
				(注意：dbm开关若只输入一个y则同时开启测试模式和空输出，反之亦然)
	?ffl [filter] 		文件过滤器
	?pri [0-4] 		选择进程优先级
	?uil [1-4/input]	选择mkvmerge的语言
	?exe [path]		选择mkvmerge的路径
**调用注意**
	
	开关必须整体，整体，整体用引号括起，比如
	"?out %APPDATA%\test ?pri 3 ?dbm n:y"
	也可以只括起单个开关，但是这样最多只能8个开关，比如
	"?out %APPDATA%\test" "?pri 3" "?dbm n:y"
	
**调用方法①(CMD)**
	
	ASFMKV "输入路径" "[调用开关]"

**调用方法②(CMD)**
	
	Call "(带有某些符号的路径)\ASFMKV" "输入路径" "[调用开关]"
	(如果路径或文件名中含有括号、空格、与号或其他影响CMD的符号，可以使用Call指令并用双引号括起路径)
	
**调用方法③:**
	
	直接往BAT拖入文件或文件夹，自动运行重封装并输出到源文件夹
	该情况下所有开关均为默认值
	
###  7.2. <a name='-1'></a>开关解释

**进程优先级**
	
	[0] lowest(最低)
	[1] lower(较低)
	[2] normal(标准)
	[3] higher(较高)
	[4] highest(最高/实时)


**MKVmerge输出语言**
	
	快速语言选项:
	[1] en(English)
	[2] zh_CN(简体中文)
	[3] zh_TW(繁體中文)
	[4] ja(日本語)
	该语言选项仅应用于mkvmerge输出部分，并仅在支持时使用
	您也可以直接输入语言，比如 "?uil zh_CN"
	可选的语言详见"mkvmerge --ui-language list"

**文件过滤器**
	
	过滤器使用标准文件搜索语法，例如：
	"*.mkv"将只输入所有文件后缀名为MKV的文件
	"*SEFO*.*"将会输入所有文件名中含有"SEFO"的文件(不区分大小写)且不管后缀名是什么
	其实主要就是通配符的问题罢了


##  8. <a name='-1'></a>挂接组件
本BAT使用了以下挂接组件

> MKVmerge(LICENSE: GPLv2)
	
	Copyright© 2002– Moritz Bunkus
	https://mkvtoolnix.download/downloads.html

> Replace for Batch(LICENSE: MIT)
	
	Copyright© 2018-2019 yyfll(yanyifei66@gmail.com)
	* [Delete AND(&) (DIR Ver.)]
		该版本是独立程序，用于替换文件夹下所有符合匹配并带有"&"号的文件名
	* [Replace for Batch V3]
		使用CALL接口的泛用性Replace模块，可供挂接使用

##  9. <a name='-1'></a>内部组件
本BAT使用了以下原创组件

	Copyright© 2018-2019 yyfll(yanyifei66@gmail.com)
	Module_FormatDate	日期格式化模块
	Module_ReplaceBackSlash	[专用]JSON转义模块(EU-JSON)
	Module_EncapsulationMKV	[专用]封装控制模块
	Module_GetOutputPath	[专用]输出控制模块
	Module_DEBUG		除错辅助模块
