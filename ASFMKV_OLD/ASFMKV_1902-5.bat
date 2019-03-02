@rem !This file wrote in GB2312-80(zh-Hans) code page, do not open with other code pages. But you can even open this file with UTF-8 or UTF-16, these code pages can also show the texts!
@rem 关闭命令回显
@echo off
rem ------------------------------------------
rem 欢迎使用yyfll的批量封装程序
rem 本人致力于打造傻瓜式超易用的方便的批处理程序
rem 您可以致信 dyystudio@qq.com 来联系开发者
rem ------------------------------------------
rem 变换标题
title [初始化] 请稍等...
rem ------------------------------------------
rem NotDel自定义变量
rem [空] 无赋值时程序会删除混流前的源文件
rem [任意] 有任意赋值时程序会保留源文件
rem 语法：set "notdel=值"
rem 
rem 注意：如果是第三方BAT指定了该值，将会覆盖此处的设置
rem 
rem 第三方用法：[0] 值为0不删除源文件
rem             [-0] 值不为0删除源文件
set "notdel=0"
rem ------------------------------------------
rem NotSub自定义变量
rem [空] 无赋值时，程序仅会在文件夹下有外挂字幕的时候才会对文件进行封装
rem 		（若没有外挂字幕即使文件夹下有字体也会跳过该文件）
rem [任意] 有任意赋值时，如果文件夹下有字体，程序会在没有外挂字幕的情况下依然封装字体到文件
rem 语法：set "notsub=值"
rem 
rem 注意：如果是第三方BAT指定了该值，将会覆盖此处的设置
rem 
rem 第三方用法：[0] 值为0以无赋值处理
rem             [-0] 值不为0以任意赋值处理
set "notsub="
rem ------------------------------------------
rem NotFont自定义变量
rem [空] 无赋值时，程序仅会封装外挂字幕而不会封装字体文件
rem [任意] 有任意赋值时，程序不仅会封装外挂字幕而且还会封装字体文件
rem 语法：set "notfont=值"
rem 
rem 该选项不允许第三方指定
set "notfont=0"
rem ------------------------------------------
rem OutPath自定义变量
rem [空] 无赋值时，程序会将封装完成的文件输出到源文件夹
rem [有效路径] 有正确赋值时，程序会将封装完成的文件输出到目标文件夹
rem 		(路径可以为不存在的路径，程序会自动创建)
rem 语法：set "outpath=值(路径不需要前后引号)"
rem 
rem 第三方用法：[有效路径] 同上
rem 			[无效路径] 输出到源文件夹，作无赋值处理
set "outpath="
rem ------------------------------------------
rem SearchFilter自定义变量
rem [空] 无赋值时，程序会使用默认值(*.*)
rem [任意] 任意赋值时，若输入文件夹，程序将只封装符合匹配的文件
rem 	过滤器语法：可使用通配符(*)，如"*.mp4"将匹配所有后缀名为MP4的文件
rem 				也可在文件名中使用通配符，如"*DMG*.*"将匹配所有名称中含有DMG的文件
rem 语法：set "searchfilter=值"
rem 
rem 第三方用法：[缺省] 同"空"
rem 			[任意] 同"任意"
set "searchfilter="
rem ------------------------------------------
rem MKVmerge进程优先级/界面语言
rem 如果您不懂这方面的知识，请不要随意修改
rem 界面语言(默认"zh_CN"(简体中文))
set "ui_language=zh_CN"
rem 优先级(默认"normal"(标准))
set "priority=normal"
rem ------------------------------------------
rem SubDir自定义变量
rem 定义是否搜索指定目录下的子目录
rem [非0] 搜索子目录
rem [0] 不搜索子目录
rem 
rem 语法：set "subdir=0"
rem
rem 第三方用法：[0] 同"0"
rem 			[非0] 同"非0"
set "subdir=0"
rem ------------------------------------------
rem DEBUG_MODE
rem 测试模式下将会关闭所有CLS并开启ECHO
rem 注意!开启此项将强制开启NUL_OUTPUT!
rem [0] 启用
rem [非0] 停用
set "debug_mode=1"
rem ------------------------------------------
rem NUL_OUTPUT
rem 该变量仅用于测试！请不要随意开启！
rem NUL_OUTPUT开启时将会让MKVmerge把结果输出到NUL(不输出)
rem 以加快测试速度并减少磁盘使用
rem [0] 启用
rem [非0] 停用
set "nul_output=1"
rem ------------------------------------------
rem DEBUG模块，在程序意外终止时会挂起程序
:Module_DEBUG
if not defined debug (
	set debug=0
	rem 变量传输表
	rem [范围][(定义)P/定量 V/变量] 传输变量->对应变量 说明
	rem [path][P] %0->%0 本batch的路径
	rem [path][V] %1->%1 输入路径
	rem [path][V] %2->%2 输出路径
	rem [0/-0][V] %3->%3 NOTDEL
	rem [0/-0][V] %4->%4 NOTSUB
	rem [path][V] %5->%6 SearchFilter
	rem [0-2] [V] %6->%7 Priority
	rem [0-3] [V] %7->%8 ui_language
	rem [0/-0][V] %8->%5 subdir
	rem [0/-0][V] %9->%9 DEBUG_MODE
	cmd /c call "%~0" "%~1" "%~2" "%~8" "%~3" "%~4" "%~5" "%~6" "%~7" "%~9"
	if "%~1"=="" (
		echo [Module_DEBUG] 请按任意键退出... 
		pause>nul
		exit
	) else (
		if defined title (
			title %title%
		) else title Command Shell
		set "debug="
		goto :EOF
	)
) else set "debug="
rem 清屏
if not "%debug_mode%"=="0" cls
if "%debug_mode%"=="0" echo on
:get_input
if /i "%~1"=="-h" goto Show_Help
if /i "%~1"=="-help" goto Show_Help
if /i "%~1"=="/h" goto Show_Help
if /i "%~1"=="/?" goto Show_Help
if "%~1"=="" goto not_check_input
rem 获取通过变量传输输入的信息
if not "%~5"=="-" if not "%~5"=="" if not "%~5"=="0" (
	set "subdir=1"
) else set "subdir=0"
if not "%~9"=="-" if not "%~9"=="" if not "%~9"=="0" (
	set "debug_mode=1"
) else set "debug_mode=0"
if not "%~8"=="-" if not "%~8"=="" (
	if "%~8"=="0" (
		set "ui_language=en"
	) else if "%~8"=="1" (
		set "ui_language=zh_CN"
	) else if "%~8"=="2" (
		set "ui_language=zh_TW"
	) else if "%~8"=="3" (
		set "ui_language=ja"
	)
)
if not defined ui_language set "ui_language=en"
if not "%~7"=="-" if not "%~7"=="" (
	if "%~7"=="0" (
		set "priority=lower"
	) else if "%~7"=="1" (
		set "priority=normal"
	) else if "%~7"=="2" (
		set "priority=higher"
	)
)
if not defined priority set "priority=normal"
if not "%~6"=="-" if not "%~6"=="" (
	set "searchfilter=%~6"
) else set "searchfilter="
echo "%~4"
if not "%~4"=="-" if not "%~4"=="" if not "%~4"=="0" (
	set "notsub=0"
) else set "notsub="
if not "%~3"=="-" if not "%~3"=="" if not "%~3"=="0" (
	set "notdel=0"
) else set "notdel="
:check_input
if exist "%~1" (
	set "ifolder=%~1"
) else (
	echo [ERROR] 输入路径有误
	goto Show_Help	
)
if not "%~2"=="-" if not "%~2"=="" if not exist "%~2" (
	mkdir "%~2">nul && set "outpath=%~2"
) else set "outpath=%~2"
:not_check_input
if not defined searchfilter goto not_replace_filter
rem 正则表达式转义
echo [SearchFilter] 检测到文件过滤器输入...请稍等...
echo.
echo [Module_ReplaceBatch] 正在转义为正则表达式...
echo [Module_ReplaceBatch] 进度0/7
call :Module_ReplaceBatch "%searchfilter%" "." "\."
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度1/7
call :Module_ReplaceBatch "%replace_output%" "(" "\("
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度2/7
call :Module_ReplaceBatch "%replace_output%" ")" "\)"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度3/7
call :Module_ReplaceBatch "%replace_output%" "+" "\+"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度4/7
call :Module_ReplaceBatch "%replace_output%" "?" "\?"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度5/7
call :Module_ReplaceBatch "%replace_output%" "{" "\{"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度6/7
call :Module_ReplaceBatch "%replace_output%" "*" ".*"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] 进度7/7
set "filter=%replace_output%"
set "replace_output="
:not_replace_filter
if "%debug_mode%"=="0" set "NUL_OUTPUT=0"
rem 获取基本信息
set "rf=%~dp0"
rem 定位到程序所在目录，防止以管理员模式启动导致尴尬局面
cd /d "%rf%"
rem 变更标题
title [初始化] 正在测试mkvmerge可用性...
echo [初始化] 等待mkvmerge响应...
if not "%debug_mode%"=="0" cls
rem 测试MKVmerge是否可用
mkvmerge -V>nul||if not "%debug_mode%"=="0" cls && echo 错误:mkvmerge封装组件不可用 && title [ERROR]mkvmerge Load Failed && exit
goto x264_check_out
ffmpeg -version>nul && for /f "tokens=1-3" %%a in ('ffmpeg -version') do echo [Test] Find %%a %%b %%c && goto ffmpeg_check_out
:ffmpeg_check_out
x264 -V>nul && for /f "tokens=*" %%a in ('x264 --help') do echo [Test] Find %%a && goto x264_check_out
:x264_check_out
set "ver=1902-5"
rem 获取MKVmerge的版本信息并更改标题
echo [INF] AddSubFont(to)MKV V%ver% ^| Copyright(c) 2018-2019 yyfll
for /f "tokens=1-2* delims= " %%a in ('mkvmerge -V') do (
	if "%debug_mode%"=="0" (
		title [yyfll的批量混流程序]视频+字幕^&字体--^>MKV[%%a %%b] [GB2312] [VER. %ver%^(DEBUG_MODE^)]
	) else title [yyfll的批量混流程序]视频+字幕^&字体--^>MKV[%%a %%b] [GB2312] [VER. %ver%]
	echo [USE] %%a %%b %%c ^| Copyright^(c^) 2002-2019 Moritz Bunkus
)
rem 如果已有输入就直接执行
echo.
@if "%debug_mode%"=="0" echo off
echo [CUSTOM SETTINGS]
echo [A/Active][N/Undefined]
if not defined notdel (
	echo [DEL][N] 删除输入文件
) else @echo [DEL][A] 不删除输入文件
if not defined notsub (
	echo [SUB][N] 若没有匹配的字幕则不嵌入字体
) else echo [SUB][A] 即使没有匹配到字幕也会嵌入字体
if not defined notfont (
	echo [FNT][N] 不封装字体（仅嵌入字幕）
) else echo [FNT][A] 封装字体（同时嵌入匹配字幕与字体）
if defined outpath (echo [OUT][A] 输出到目录"%outpath%") else (echo [OUT][N] 输出到源目录)
if "%subdir%"=="0" (echo [DIR][A] 不搜索子目录) else (echo [DIR][N] 搜索子目录)
if "%debug_mode%"=="0" (echo [DBM][A] 已启用测试模式) else (echo [DBM][N] 未使用测试模式)
if "%nul_output%"=="0" (echo [NUL][A] 已启用空输出) else (echo [NUL][N] 正常输出)
if not defined searchfilter (
	set "searchfilter=*"
	set "filter=.*"
	echo [FFL][N] 未使用文件过滤器
) else echo [FFL][A] 已加载文件过滤器"%searchfilter%"
@if "%debug_mode%"=="0" echo on
if defined ifolder goto check_path
:need_folder
rem 向用户获取路径
echo.
set "ifolder="
set /p ifolder=文件(或目录)路径(不带引号)：
rem 如果用户没有输入，则再次向用户获取；如果存在，则尝试去除引号
if not defined ifolder (
	if not "%debug_mode%"=="0" cls
	echo [ERROR] 您没有输入任何路径！
	goto need_folder
)
if exist "%ifolder:~1,-1%" (
	set "ifolder=%ifolder:~1,-1%"
) else set "ifolder=%ifolder%"
rem pause
:check_path
rem 如果路径不存在，则再次向用户获取
if not exist "%ifolder%" (
	if not "%debug_mode%"=="0" cls
	echo [ERROR] 路径无效！
	goto need_folder
)
echo.
:start_encode
if not "%debug_mode%"=="0" cls
rem 初始化变量
set working=0
set error=0
set count=0
rem 确认是目录还是文件
set "dirin="
for %%a in ("%ifolder%") do (
	set "attribute=%%~aa"
)
if /i %attribute:~0,1%==d set "dirin=1"
if not defined attribute set "dirin=1"
:time_format
for /f "tokens=*" %%a in ('time /T') do (
	for /f "delims=: tokens=1,2*" %%b in ("%%a:%time:~6,2%%time:~9,2%") do (
		set "work_time=%%b%%c%%d"
	)
)
:date_format
for /f "delims=/ tokens=1,2,3" %%a in ('date /T') do (
	set "work_date_1=%%~a"
	set "work_date_2=%%~b"
	set "work_date_3=%%~c"
	for /f "tokens=1,2 delims= " %%d in ("%%~a") do if not "%%~d"=="%%~e" (
		if "%%~d" GTR "%%~e" (
			if not "%%~e"=="" set "work_date_1=%%e"
		) else if not "%%~d"=="" set "work_date_1=%%d"
	)
	for /f "tokens=1,2 delims= " %%d in ("%%~b") do if not "%%~d"=="%%~e" (
		if "%%~d" GTR "%%~e" (
			if not "%%~e"=="" set "work_date_2=%%e"
		) else if not "%%~d"=="" set "work_date_2=%%d"
	)
	for /f "tokens=1,2 delims= " %%d in ("%%~c") do if not "%%~d"=="%%~e" (
		if "%%~d" GTR "%%~e" (
			if not "%%~e"=="" set "work_date_3=%%e"
		) else if not "%%~d"=="" set "work_date_3=%%d"
	)
)
set "work_date=%work_date_1%%work_date_2%%work_date_3%"
set "r_out_dir=%rf%[ASFMKV]redirect-output"
set "date_logdir=%rf%[ASFMKV]redirect-output\%work_date%"
set "logdir=%rf%[ASFMKV]redirect-output\%work_date%\%work_time%"
:get_file_list
rem 如果是目录则执行以下流程
rem 删除先前用于记录文件列表的LOG，防止重复写入
if not defined dirin (
	for /f "tokens=*" %%a in ("%ifolder%") do (
		cd /d "%%~dpa"
		set "vpath=%ifolder%"
		set "ifolder=%%~dpa"
	)
) else cd /d "%ifolder%"
if exist "%~dp0filelist.log" del /q "%~dp0filelist.log"
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
title [yyfll的批量混流程序] 正在生成文件列表...请不要关闭本程序...
echo [input.get_file_list] 正在生成运行所需的文件列表...
rem 将符合搜索条件的文件的完整路径全部写入到filelist文件
rem 如果定义了subdir变量等于0，则判断这些路径是否在目标目录而不是其子目录
rem (1812TEST中为进一步减小磁盘读取压力加快速度，使用DIR+FINDSTR代替原有的FOR/R)
if "%subdir%"=="0" (
	rem 利用FOR循环从DIR的运行结果中获取目标目录顶层的文件
	for /f "tokens=*" %%a in ('dir /B /A:-D "%ifolder%"') do (
		if exist "%%~a" (
			set /a count=count+1
			echo "%%~a">>"%~dp0filereader.log"
		) else (
			if "%ifolder:~-1%"=="\" (
				call :check_path_length "%ifolder%%%~a"
			) else call :check_path_length "%ifolder%\%%~a"
		)
	)
	goto INPUT_DIR_SUBDIR
) else (
	for /r "%ifolder%" %%a in ("%searchfilter%") do (
		set /a count=count+1
		echo "%%~a">>"%~dp0filelist.log"
	)
)
goto INPUT_DIR_COUNT0
:check_path_length
set "path_length=%~1"
if not "%path_length:~259%"=="" echo [ERROR] 文件路径超长(260字符上限)
goto :EOF
:INPUT_DIR_SUBDIR
rem 如果目标目录顶层没有文件则直接跳到下一步
if %count%==0 goto INPUT_DIR_COUNT0
rem 如果filter没有定义则直接跳到下一步(filter未定义表明不需要进行文件过滤)
if not defined filter goto INPUT_DIR_COUNT0
set "count=0"
rem 利用findstr从已知文件中取出符合搜索过滤的文件
findstr /I "%filter%" "%~dp0filereader.log">>"%~dp0filelist.log"
rem 重新计数符合条件的文件
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do set /a count=count+1
) else set count=1
rem 删除临时数据记录LOG
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
:INPUT_DIR_COUNT0
rem 如果count记录的文件数为0，则报错
if %count%==0 if %searchfilter%==* (
	echo [ERROR] 路径为空目录！
	goto need_folder
) else (
	echo 在路径下无法匹配到文件
	echo 匹配规则无效！
	choice /M 是否使用默认匹配规则
	if %errorlevel%==1 set "searchfilter=*"
	goto need_folder
)
rem 删除记录记录了目标目录及其子目录中的文件路径的log文件
if exist "%~dp0filereader.log" (
	rename "%~dp0filereader.log" "filelist.log"
)
rem 获取目标目录中的所有文件，并逐次递交负责输出路径控制、MKV封装的模块
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		if exist "%%~a" (
			set "vpath=%%~a"
			call :Module_GetOutputPath
			call :Module_EncapsulationMKV
		)
	)
) else (
	rem 如果是文件则仅处理一遍
	call :Module_GetOutputPath
	call :Module_EncapsulationMKV
)
:check_log_dir
if exist "%r_out_dir%" (
	if exist "%date_logdir%" (
		if exist "%logdir%" (
			for /r "%logdir%" %%a in (*.log) do if exist "%%~a" set /a logsize=logsize+(%%~za/1024)
			if not "%logsize%" GTR "0" rmdir "%logdir%" 2>nul	
		) else (
			for /r "%date_logdir%" %%a in (*.log) do if exist "%%~a" set /a logsize=logsize+(%%~za/1024)
			if not "%logsize%" GTR "0" rmdir /S /Q "%date_logdir%" 2>nul
		)	
	) else (
		for /r "%r_out_dir%" %%a in (*.log) do if exist "%%~a" set /a logsize=logsize+(%%~za/1024)
		if not "%logsize%" GTR "0" rmdir /S /Q "%r_out_dir%" 2>nul
	)
)
:Process_End
title [yyfll的批量混流程序] 混流完成！
if not "%debug_mode%"=="0" cls
if %error% GTR 0 (
	goto Has_Error
) else echo [共处理%count%项且全部处理成功]
echo 任务完成！
goto Batch_End
:Has_Error
echo [共处理%count%项，其中有%error%项未能成功处理]
if exist "%logdir%" CHOICE /C YN /M "是否要查看LOG文件？"
if "%error%"=="1" (
	if exist "%logdir%" (
		start "%logdir%"
	) else echo 找不到log文件夹...
echo.
:Batch_End
rem 删除运行所需的文件列表
if exist "%~dp0filelist.log" del /q "%~dp0filelist.log"
rem 如果是不是第三方调用则挂起
if "%~1"=="" pause
exit
:Module_EncapsulationMKV
rem 如果被其他模块要求不执行封装，则立刻退出
if defined notwork set "notwork=" && goto :EOF
set /a working=working+1
title [yyfll的批量混流程序] 正在混流"%filename%"...(第%working%项/共%count%项)
if not "%debug_mode%"=="0" cls
set "mkvinput="
:GetSubtitle
rem 如果没有任何字幕文件，则直接跳到字体封装预处理模块
if not defined sub[0] goto GetFont
set /a subnum=subnum-1
if %subnum%==0 (
	call :GetSub_Num 0
	set "sub[0]="
) else (
	if defined sub[0] for /l %%a in (0,1,%subnum%) do call :GetSub_Num %%a
)
goto GetFont
:Rename_Sub
rename "%subname%" "%return%%~1"
for %%a in ("%subname%") do set "subname=%%~dpa%return%%%~xa"
goto :EOF
:GetSub_Num
if not defined sub[%1] goto :EOF
if defined sub[%1] for /f "tokens=2 delims==" %%a in ('set sub[%1]') do set "subname=%%a"
for /f "tokens=2 delims=^&" %%a in ("%subname%A") do (
	if not "%%a"=="" (
		for %%b in ("%subname%") do (
			call :Module_DeleteAND "%%~dpnxb" && call :Rename_Sub "%%~xb"
		)
	)
)
rem 这是旧的mkv封装命令生成块，采用新算法后废弃
rem for /f "tokens=*" %%a in ("%subname%") do (
rem 	for /f "tokens=2 delims=." %%b in ("%subname%") do if not ".%%~b"=="%%~a" (
rem 		set "mkvinput=%mkvinput% --track-name %%~b "%subname%""
rem 	) else set "mkvinput=%mkvinput% "%subname%""
rem )
rem for /f "tokens=2 delims= " %%a in ("%stitle%") do if "%%~a"=="" (
rem 	set "mkvinput=%mkvinput% "%subname%""
rem ) else if not ".%stitle%"=="%sext%" (
rem 	set "mkvinput=%mkvinput% --track-name "%%~b" "%subname%""
rem ) 
set "mkvinput=%mkvinput% "%subname%""
set "sub[%1]="
goto :EOF
:GetFont
if not defined font[0] goto Start_Encapsulation
set /a fontnum=fontnum-1
if "%fontnum%"=="0" (
	call :GetFont_Num 0
	set "sub[0]="
) else (
	if defined font[0] for /l %%a in (0,1,%fontnum%) do call :GetFont_Num %%a
)
goto Start_Encapsulation
:Rename_Font
rename "%fontname%" "%return%%~1"
for %%a in ("%fontname%") do set "fontname=%%~dpa%return%%%~xa"
goto :EOF
:GetFont_Num
rem 如果没有任何字体文件，则直接退出
if not defined font[%1] goto :EOF
rem 使用FOR读取font数组的%1项
if defined font[%1] for /f "tokens=2 delims==" %%a in ('set font[%1]') do set "fontname=%%a"
rem 防止字体文件名出现与号
for /f "tokens=2 delims=^&" %%a in ("%fontname%A") do if not "%%b"=="" for %%a in ("%fontname%") do call :Module_DeleteAND "%%~dpnxa" && call :Rename_Font "%%~xa"
rem 按照字体文件的扩展名来定义附件类型
for %%a in ("%fontname%") do set "fext=%%~xa"
set "fext=%fext:~1%"
if /i "%fext%"=="ttc" (
	set "ftype=application/x-truetype-font"
) else if /i "%fext%"=="otf" (
	set "ftype=application/vnd.ms-opentype"
) else if /i "%fext%"=="ttf" (
	set "ftype=application/x-truetype-font"
) else set "font[%1]=" && goto GetFont_Error
set "mkvinput=%mkvinput% --attachment-mime-type "%ftype%" --attach-file "%fontname%""
set "font[%1]="
:GetFont_Error
goto :EOF
:Start_Encapsulation
if not defined mkvinput (
	set /a error=error+1 
	goto :EOF
)
if not exist "%logdir%" mkdir "%logdir%" 2>nul
rem 当nul_output为0时，将会把结果输出到NUL以在测试时不占用磁盘空间
mkvmerge -i "%vpath%" --ui-language "%ui_language%"
:run_mkvmerge
if "%nul_output%"=="0" (
	for /f "tokens=* delims=^|" %%a in ("%mkvinput%") do (
		mkvmerge -o NUL --ui-language "%ui_language%" -v "%vpath%"%%~a
		if "%errorlevel%"=="2" (
			set /a error=error+1
			echo INPUT_FILE："%vpath%">"%rf%DEBUG-%working%.log"
			echo [DEBUG.mkvmerge] 正在重新运行并重定向mkvmerge输出...
			mkvmerge -o NUL -v -r "%logdir%\DEBUG-%working%.log" --ui-language "%ui_language%" "%vpath%"%%~a
		)
	)
) else (
	mkvmerge -o "%opath%" --ui-language "%ui_language%" --priority "%priority%" -v --title "%filename%[ASFMKV%ver%_REMUX]" "%vpath%"%mkvinput% 
	if not "%errorlevel%"=="0" (
		set /a error=error+1
		echo INPUT_FILE："%vpath%">"%rf%DEBUG-%working%.log"
		echo [DEBUG.mkvmerge] 正在重新运行并重定向mkvmerge输出...
		mkvmerge -o NUL -r "%logdir%\DEBUG-%working%.log" --ui-language "%ui_language%" --priority "%priority%" -v --title "%filename%[ASFMKV%ver%_REMUX]" "%vpath%"%mkvinput%
	)
)
:Encapsulation_OK
if not "%nul_output%"=="0" (
	if exist "%opath%" (
		for %%a in ("%opath%") do set "filelen=%%~za"
	) else (
		set /a error=error+1
		goto :EOF
	)
)
if exist "%~dp0replace.log" (
	for /f "usebackq tokens=1,2 delims=^|" %%a in ("%~dp0replace.log") do (
		if not "%%~a"=="" if exist "%%~a" rename "%%~a" "%%~b"
	)
)
del /q "%~dp0replace.log"
if "%filelen%"=="0" set /a error=error+1 & del /q "%opath%" & goto :EOF
if not defined notdel if exist "%vpath%" for %%a in ("%vpath%") do set /a vfilelen=%%~za/1000
:DelRawFile
if defined notdel goto :EOF
set /a filelen=filelen/1000
if %filelen% GEQ %vfilelen% del /q "%vpath%" && for %%a in ("%vpath%") do rename "%opath%" "%%~na.mkv"
goto :EOF
:Module_DeleteAND
set "return="
if "%~1"=="" (
	echo [ERROR] 输入无效
	pause
	goto :EOF
)
set "inputname=%~n1A"
:re_replace
for /f "tokens=1* delims=^&" %%a in ("%inputname%") do if not "%%b"=="" (
	set "inputname=%%a_%%b"
	goto re_replace
) else set "return=%inputname:~0,-1%"
echo "%~dp1%return%%~x1|%~nx1">>"%~dp0replace.log"
set "inputname="
goto :EOF
:Module_ReplaceBatch
if "%~1"=="" (
	goto RB.error_input
) else if "%~2"=="" (
	goto RB.error_input
)
set "input_string=A%~1A"
set "for_delims=%~2"
setlocal enabledelayedexpansion
for /l %%a in (0,1,1) do set "delims[%%a]=!for_delims:~%%a!"
if defined delims[1] (
	echo [ERROR] Replace对象必须是单个字符
	goto RB.error_input
)
for /f "tokens=1* delims=%for_delims%" %%a in ("%input_string%") do (
	if "%%~b"=="" (
		echo "%input_string:~1,-1%">"%USERPROFILE%\rforbat.log"
		set "input_string="
		set "for_delims="
		goto :EOF
	)
)
set "replace_to=%~3"
set "output_string="
set "insert_collect=@#$~`;'[]{}_,?\/"
set "insert_count=-1"
:RB.choose_insert
set /a insert_count=insert_count+1
set "insert=!insert_collect:~%insert_count%,1!"
if "%insert%"=="" (
	echo [ERROR] 您的输入中包含本模块无法处理的字符
	goto RB.error_input
)
for /f "tokens=2 delims=%insert%" %%a in ("%input_string%") do (
	if "%%~a"=="" (
		goto RB.choose_finish
	) else goto RB.choose_insert
)
:RB.choose_finish
set "insert_count=-1"
:RB.insert_char
set /a insert_count=insert_count+1
set "RB_cache=!input_string:~%insert_count%,1!"
if not "%RB_cache%"=="" (
	set "RB_cache[%insert_count%]=%RB_cache%%insert%"
	goto RB.insert_char
)
set insert_count=0
:RB.format_insert
if not defined RB_cache[%insert_count%] (
	set "input_string=%insert_string%"
	goto RB.insert_finish
)
set "insert_string=%insert_string%!RB_cache[%insert_count%]!"
set "RB_cache[%insert_count%]="
set /a insert_count=insert_count+1
goto RB.format_insert
:RB.insert_finish

for /f "tokens=1 delims=%~2" %%a in ("%input_string%") do if not "%%a"=="" (
	set "output_string=%%a"
)
set "loop=1"
:RB.re_replace
set /a loop=loop+1
for /f "tokens=%loop% delims=%~2" %%a in ("%input_string%") do if not "%%a"=="" (
	set "output_string=%output_string%%replace_to%%%a"
	goto RB.re_replace
)
for /f "tokens=1 delims=%insert%" %%a in ("%output_string%") do if not "%%a"=="" (
	set "no_insert_string=%%a"
)
set "loop=1"
:RB.remove_insert
set /a loop=loop+1
for /f "tokens=%loop% delims=%insert%" %%a in ("%output_string%") do if not "%%a"=="" (
	set "no_insert_string=%no_insert_string%%%a"
	goto RB.remove_insert
)
echo "%no_insert_string:~1,-1%">"%USERPROFILE%\rforbat.log"
set "insert_string="
set "RB_cache="
set "no_insert_string="
set "input_string="
set "output_string="
set "loop="
setlocal disabledelayedexpansion
goto :EOF
:RB.error_input
echo [ERROR] 输入无效
setlocal disabledelayedexpansion
pause
goto :EOF
:Module_GetOutputPath
goto Get_Output_Path
:SubNum
rem INPUT_VALUE_1：字幕文件路径(不含扩展名)
if "%subdir%"=="0" (
	rem 从1902-2开始启用subdir时直接遍历filelist而不是整个目录树，以此降低磁盘使用率
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		for /f "tokens=*" %%b in ("%~1") do (
			rem 在filelist中寻找是否有目标字幕文件
			if "%%~nxa"=="%%~nxb" (
				rem echo "%%~a"="%%~b"
				set "sub[%subnum%]=%~1"
				set /a subnum=subnum+1
				goto SubNum_loop
			)
		)
	)
) else (
	set "sub[%subnum%]=%~1"
	set /a subnum=subnum+1
)
:SubNum_loop
rem pause
goto :EOF
:SubNum_DVDSUB
for %%a in ("%~1") do if not exist "%%~dpna.sub" goto :EOF
call :SubNum "%~1"
goto :EOF
:FontNum
if "%subdir%"=="0" (
	rem 从1902-2开始启用subdir时直接遍历filelist而不是整个目录树，以此降低磁盘使用率
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		for /f "tokens=*" %%b in ("%~1") do (
			rem 在filelist中寻找是否有目标字体文件
			if "%%~nxa"=="%%~nxb" (
				rem echo "%%~a"="%%~b"
				set "font[%fontnum%]=%~1"
				set /a fontnum=fontnum+1
				goto FontNum_loop
			)
		)
	)
) else (
	set "font[%fontnum%]=%~1"
	set /a fontnum=fontnum+1
)
:FontNum_loop
goto :EOF
:Get_Output_Path
for %%a in ("%vpath%") do set "ext=%%~xa"
if /i %ext:~1%==mp4 (
	echo.>nul
) else if /i %ext:~1%==mkv (
	echo.>nul
) else if /i %ext:~1%==mpeg (
	echo.>nul
) else if /i %ext:~1%==avi (
	echo.>nul
) else if /i %ext:~1%==rmvb (
	echo.>nul
) else if /i %ext:~1%==m4v (
	echo.>nul
) else if /i %ext:~1%==flv (
	echo.>nul
) else if /i %ext:~1%==wmv (
	echo.>nul
) else if /i %ext:~1%==mpg (
	echo.>nul
) else if /i %ext:~1%==rm (
	echo.>nul
) else if /i %ext:~1%==qt (
	echo.>nul
) else if /i %ext:~1%==ogg (
	echo.>nul
) else if /i %ext:~1%==mov (
	echo.>nul
) else if /i %ext:~1%==m2ts (
	echo.>nul
) else if /i %ext:~1%==webm (
	echo.>nul
) else (
	set notwork=0
	set /a working=working+1
	goto :EOF
)
set "test="
for %%a in ("%vpath%") do set "ostring=%%~dpna"
for %%a in ("%vpath%") do set "filename=%%~na"
if defined outpath if not "%outpath%"=="" (
	if not exist "%outpath%" mkdir "%outpath%">nul
	for %%a in ("%outpath%") do set "test=%%~aa"
)
if defined test if "%test:~0,1%"=="d" if "%test:~-1%"=="\" (
	set "ostring=%outpath%%filename%"
) else set "ostring=%outpath%\%filename%"
set "test="
set "subnum=0"
set "fontnum=0"
rem 1902-2开始不再遍历两次目录树而是直接利用if分开DVD字幕和一般字幕
for /r "%ifolder%" %%a in ("*%filename%*.ass","*%filename%*.ssa","*%filename%*.srt","*%filename%*.sup","*%filename%*.idx") do if not "%%~xa"==".idx" (
	call :SubNum "%%~a"
) else call :SubNum_DVDSUB "%%~a"
if not defined notfont goto notget_font
for /r "%ifolder%" %%a in ("*.ttf","*.ttc","*.otf") do call :FontNum "%%~a"
:notget_font
set "file="
if defined notsub if not defined sub[0] (
	if not defined font[0] (
		set "notwork=0"
		goto :EOF
	)
	set "notwork="
	goto Start_Get_Output_Path
) else if not defined font[0] (
	set "notwork=0" 
	goto :EOF
)
if not defined sub[0] (
	set "notwork=0" 
	goto :EOF
)
:Start_Get_Output_Path
set "ostring=%ostring%[SUB]"
set filenum=1
if not exist "%ostring%.mkv" (
	set "opath=%ostring%.mkv"
	goto :EOF
)
:ReGet_Output_Path
set "opath=%ostring%_%filenum%.mkv"
if exist "%opath%" set /a filenum=filenum+1 & goto ReGet_Output_Path
goto :EOF
:Show_Help
echo Add Subtitle^&Font to MKV [Ver. %ver%]
echo Copyright(c) 2018-2019 By yyfll
echo.
echo 显示帮助页面(本页面)可以使用以下指令:
echo Call "%~dpna0" -h
echo Call "%~dpna0" -help
echo Call "%~dpna0" /h
echo Call "%~dpna0" /?
echo.
echo 使用方法①(CMD)：
echo   %~n0 "输入路径" "输出路径" "NotDel" "NotSub" "SubDir" "SearchFilter" "优先级" "UI语言" "测试模式"
echo   (如果与AddSubFontToMKV在同一文件夹下则可以使用该指令)
echo.
echo 使用方法②(CMD):
echo   Call "%~dpn0" "输入路径" "输出路径" "NotDel" "NotSub" "SubDir" "SearchFilter" "优先级" "UI语言" "测试模式"
echo   (如果路径或文件名中含有括号、空格、与号或其他影响CMD的符号，可以使用Call指令并用双引号括起路径)
echo.	
echo 使用方法③:
echo   直接往BAT拖入文件或文件夹，自动运行重封装
echo.
echo 选项缺省:
echo   [-] 使用"-"号表示该选项空缺，空缺选项将使用程序默认值
echo     (如果空缺输入路径将会在程序中询问)
echo   例如: %~n0 - "D:\Video" - - - "*.mp4" - - -
echo     (该语法将会指定输出文件夹为D:\Video，指定只能输入后缀名为mp4的文件，其他选项空缺)
echo.
echo MKVmerge进程优先级(优先级)：
echo   [0] 较低进程优先级，有可能减慢封装速度，但可能会加快其他程序的磁盘读写
echo   [1] 标准进程优先级
echo   [2] 较高进程优先级，可能略微加快封装速度，但可能会减慢甚至阻止其他低优先级程序的磁盘读写
echo   [其他] 无效参数，使用默认值
echo.
echo MKVmerge界面语言(UI语言)：
echo   [0] English(en)
echo   [1] 简体中文(zh_CN)
echo   [2] 正體中文(zh_TW)
echo   [3] 日本語(ja)
echo   [其他] 无效参数，使用默认值
echo.
echo NotDel变量：
echo   [0] 0：不删除源文件
echo   [1] 任意赋值：删除源文件
echo.
echo NotSub变量:
echo   [0] 0：没有外挂字幕不嵌入字体
echo   [1] 任意赋值：没有外挂字幕时依然嵌入字体
echo.
echo SubDir变量:
echo	[0] 0：不搜索子目录
echo	[1] 任意赋值：搜索所有子目录
echo.
echo 测试模式:
echo	[0] 0：启用测试模式，关闭所有CLS并开启Echo
echo	[1] 任意赋值：不启用测试模式
echo.
echo SearchFilter语法：
echo   搜索过滤器使用标准文件搜索语法，您可以使用通配符(*)，例如：
echo   "*.mkv"将只输入所有文件后缀名为MKV的文件
echo   "*SEFO*.*"将会输入所有文件名中含有"SEFO"的文件(不区分大小写)且不管后缀名是什么
echo   "*VCB-S*Hi10*.mkv"将输入文件名中含有"VCB-S"和"Hi10"("VCB-S"必须在"Hi10"之前)的后缀名为MKV的文件
exit