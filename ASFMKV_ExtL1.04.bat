@rem UTF-8 without BOM file
@rem 关闭命令回显
@echo off
chcp 65001
rem 变换标题
title [初始化] 请稍等...
rem ------------------------------------------
rem ExtList自定义变量
rem 该变量控制Batch的文件输入过滤器(媒体)，请不要随意修改
rem 添加时请以分号隔开每个扩展名
rem 注意！在extlist的末尾也必须有一个分号，否则最后一个扩展名将无法读取
rem 关于详细的格式支持，请详见mkvmerge -l
set "extlist=webm;vc1;rm;rmvb;rv;mov;mkv;ts;m2ts;mts;mpg;mpeg;vob;mp4;m4v;ivf;flv;avi;"
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
rem [空] 无赋值时，程序会使用默认值(*)
rem [任意] 任意赋值时，若输入文件夹，程序将只封装符合匹配的文件
rem 	过滤器语法：可使用通配符(*和?)，如"*.mp4"将匹配所有后缀名为MP4的文件
rem 				也可在文件名中使用通配符，如"*DMG*.*"将匹配所有名称中含有DMG的文件
rem     （通配符中的"?"代表任意一个字符，"*"代表任意多个字符）
rem     （如"D?G"可以匹配"DAG"、"DCG"而不能匹配"DAAG"；但"D*G"既可以匹配"DAG"也可以匹配"DAAG"）
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
rem EXEin
rem 该变量决定运行时所用的MKVmerge的路径
rem
set "exein="
rem ------------------------------------------
rem DEBUG模块，在程序意外终止时会挂起程序
cls
:Module_DEBUG
if not defined debug (
	set debug=0
	cmd /c call "%~0" "%~1" "%~2%~3%~4%~5%~6%~7%~8%~9"
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
:get_input
rem EasyUse命令输入分析
if /i "%~1"=="-h" goto Show_Help
if /i "%~1"=="-help" goto Show_Help
if /i "%~1"=="/help" goto Show_Help
if /i "%~1"=="/h" goto Show_Help
if /i "%~1"=="/?" goto Show_Help
if /i "%~1"=="?h" goto Show_Help
if not "%debug_mode%"=="0" cls
if "%debug_mode%"=="0" echo on
if "%~2"=="" goto not_check_input
set "split_count=0"
setlocal enabledelayedexpansion
:split_input
if defined input[%split_count%] (
	for /f "tokens=1* delims==" %%a in ('set input[%split_count%]') do (
		set "last_split=%%~b"
	)
)
set /a split_count=split_count+1
for /f "tokens=%split_count% delims=?" %%a in ("%~2") do (
	set "test_input=%%~a"
)
if not "%test_input%"=="" (
	if "%last_split%"=="%test_input%" (
		set /a split_count=split_count-1
		set "last_split="
		set "test_input="
		set "space_cache="
		goto split_out
	)
)
:del_space
set "space_cache=%test_input:~-1%"
if "%space_cache%"==" " (
	set "test_input=!test_input:~0,-1!"
) else (
	set "input[%split_count%]=%test_input%"
	goto out_space_del
)
goto del_space
:out_space_del
goto split_input
:split_out
setlocal disabledelayedexpansion
for /l %%a in (1,1,%split_count%) do (
	for /f "tokens=1* delims==" %%b in ('set input[%%a]') do (
		for /f "tokens=1* delims= " %%d in ("%%c") do (

			if /i "%%~d"=="h" (
				goto Show_Help
			)

			if /i "%%~d"=="out" (
				if exist "%%~e" (
					set "outpath=%%~e"
				) else if not "%%~e"=="" (
					mkdir "%%~e">nul
					if exist "%%~e" (
						set "outpath=%%~e"
					) else (
						echo [EasyUse Error] 输出路径无效
						pause
						exit
					)
				)
			)

			if /i "%%~d"=="exe" (
				if exist "%%~e" (
					set "exein=%%~e"
				) else set "exein=mkvmerge"
			)

			if /i "%%~d"=="del" (
				if /i "%%~e"=="y" (
					set "notdel=1"
				) else set "notdel=0"
			)

			if /i "%%~d"=="sub" (
				if /i "%%~e"=="y" (
					set "notsub=1"
					set "notfont=1"
				) else (
					set "notsub="
				)
			)

			if /i "%%~d"=="dir" (
				if /i "%%~e"=="y" (
					set "subdir=1"
				) else set "subdir=0"
			)

			if /i "%%~d"=="dbm" (
				for /f "tokens=1,2 delims=:" %%f in ("%%~e") do (
					if /i "%%~f"=="y" (
						set "debug_mode=0"
					) else set "debug_mode=1"

					if /i "%%~g"=="y" (
						set "nul_output=0"
					) else set "nul_output=1"
				)
			)

			if /i "%%~d"=="ffl" (
				if not "%%~e"=="" (
					set "searchfilter=%%~e"
				) else set "searchfilter="
			)

			if /i "%%~d"=="pri" (
				if "%%~e"=="0" (
					set "priority=lowest"
				) else if "%%~e"=="1" (
					set "priority=lower"
				) else if "%%~e"=="2" (
					set "priority=normal"
				) else if "%%~e"=="3" (
					set "priority=higher"
				) else if "%%~e"=="4" (
					set "priority=highest"
				)
			)

			if /i "%%~d"=="uil" (
				if "%%~e"=="1" (
					set "ui_language=en"
				) else if "%%~e"=="2" (
					set "ui_language=zh_CN"
				) else if "%%~e"=="3" (
					set "ui_language=zh_TW"
				) else if "%%~e"=="4" (
					set "ui_language=ja"
				) else if not "%%~e"=="" (
					set "ui_language=%%~e"
				)
			)
		)
	)
)
:check_input
if exist "%~1" (
	set "ifolder=%~1"
) else (
	echo [ERROR] 输入路径有误
	goto Show_Help
)
:not_check_input
if not "%~1"=="" if exist "%~1" (
	set "ifolder=%~1"
)
if exist "%rf%fonts_json.log" del /q "%rf%fonts_json.log"
rem 获取基本信息
set "rf=%~dp0"
rem 定位到程序所在目录，防止以管理员模式启动导致尴尬局面
cd /d "%rf%"
rem 变更标题
if not "%debug_mode%"=="0" cls
title [LOAD] 正在测试mkvmerge可用性...
echo [LOAD] 正在测试mkvmerge是否可用...
:check_mkvmerge
set "default_exe="
rem 测试MKVmerge是否可用
if not defined exein goto default_mkvmerge

for /f "tokens=*" %%a in ("%exein%") do (
	if exist "%%~a" (
		for /f "tokens=1 delims=-" %%b in ("%%~aa") do (
			if "%%~b"=="d" (
				for /r "%exein%" %%c in ("*mkvmerge*.exe") do (
					if exist "%%~c" set "exein=%%~c"
				)
			)
		)
	)
)

call "%exein%" -V>nul 2>nul

if not %errorlevel%==0 (
	echo [ERROR] EXEIN所设置的路径无效
	set "error_exe=%exein%"
) else goto no_check_again

:default_mkvmerge

call "mkvmerge" -V>nul 2>nul

if %errorlevel%==0 (
	if exist "%~dp0mkvmerge.exe" (
       set "exein=%~dp0mkvmerge.exe"
	) else set "exein=mkvmerge"
	set "default_exe=1"
	echo [CORRECT] EXEIN="%exein%"
) else (
	echo [ERROR] 无法使用MKVmerge
	title [ERROR] ASFMKV can't find MKVmerge
	exit
)
:no_check_again
echo [LOAD] 正在测试语言"%ui_language%"是否可用...
for /f "skip=1 tokens=1 delims= " %%a in ('call "%exein%" --ui-language list') do (
	if "%ui_language%"=="%%~a" goto uil_check_ok
)
echo [ERROR] 语言"%ui_language%"不可用
echo [CORRECT] 已更改为默认语言"en"
set "ui_language=en"
:uil_check_ok

set "extlist_count=1"
set "split_pos=0"
set "search_count=-1"
set "char_count=0"
title [LOAD] 正在转换列表ExtList...请耐心等待...
echo [LOAD] 正在列表ExtList...

set "el_cache=%rf%extlist_cache.log"
if not exist "%el_cache%" (
	echo 这是ASFMKV的文件过滤器快速缓存>"%el_cache%"
	setlocal enabledelayedexpansion
	goto count_extlist
)

set "extca="
:check_extloglist
for /f "usebackq tokens=* skip=1" %%a in ("%el_cache%") do (
	call :addend_extloglist "%%~a"
)
:end_check_extloglist
if not "%extca%;"=="%extlist%" (
	del /q "%el_cache%"
	echo [ExtCache] 缓存ExtLIST与记录不符，正在重建...
	goto uil_check_ok
)

:count_extloglist
set "el_count=0"
for /f "usebackq tokens=* skip=1" %%a in ("%el_cache%") do (
	call :add_extloglist "%%~a"
)
goto main_UI

:add_extloglist
if "%el_count:~0,1%"=="0" set "el_count=%el_count:~1%"
set /a "el_count=el_count+1"
if not %el_count% GEQ 10 set "el_count=0%el_count%"
set "extlist[%el_count%]=%~1"
echo [LoadExt] %~1
goto :EOF
:addend_extloglist
if not defined extca (
	set "extca=%~1"
) else set "extca=%extca%;%~1"
goto :EOF

:count_extlist
set /a search_count=search_count+1
set "extcount=!extlist:~%search_count%,1!"
if "%extcount%"=="" goto end_count
set /a char_count=char_count+1
if "%extcount%"==";" (
	call :add_new_ext
)
goto count_extlist
:add_new_ext
if not %extlist_count% GEQ 10 set "extlist_count=0%extlist_count%"
set "extlist[%extlist_count%]=!extlist:~%split_pos%,%char_count%!"
set "extlist[%extlist_count%]=!extlist[%extlist_count%]:~0,-1!"
echo [LoadExt] !extlist[%extlist_count%]!
echo !extlist[%extlist_count%]!>>"%el_cache%"
set /a split_pos=split_pos+char_count
set char_count=0
if "%extlist_count:~0,1%"=="0" set "extlist_count=%extlist_count:~1%"
set /a extlist_count=extlist_count+1
goto :EOF
:end_count
setlocal disabledelayedexpansion

:main_UI
if exist "%appdata%\filejumpExplain.log" del /q "%appdata%\filejumpExplain.log"
cd /d "%~dp0"
set "ver=1.04-ExtList"
if not "%debug_mode%"=="0" cls
rem 获取MKVmerge的版本信息并更改标题
echo [INF] ASFMKV V%ver% ^| Copyright(c) 2018-2021 yyfll
for /f "tokens=1-2* delims= " %%a in ('call "%exein%" -V') do (
	if "%debug_mode%"=="0" (
		title AddSubFont-to-MKV [USE:%%a %%b][UTF-8][VER. %ver%^(DEBUG_MODE^)]
	) else title AddSubFont-to-MKV [USE:%%a %%b][UTF-8][VER. %ver%]
	echo [USE] %%a %%b ^| Copyright^(c^) 2002- Moritz Bunkus
)
if not defined el_count (
	for /f "tokens=*" %%a in ('set /a %extlist_count%-1') do (
		echo [EXT] Including %%~a filetype [ExtList]
	)
) else echo [EXT] Including %el_count% filetype [ExtList]
rem 如果已有输入就直接执行
if defined ifolder goto check_path
:need_folder
rem 向用户获取路径
@if "%debug_mode%"=="0" echo off
echo.
call :show_custom_settings
@if "%debug_mode%"=="0" echo on
echo.
echo 注：直接输入"set"可打开自定义变量管理器，调整后关闭窗口前有效
echo.
set "ifolder="
set /p ifolder=文件(或目录)路径(不带引号)：
rem 如果用户没有输入，则再次向用户获取；如果存在，则尝试去除引号
if not defined ifolder (
	if not "%debug_mode%"=="0" cls
	echo [ERR] 您没有输入任何路径！
	goto need_folder
)

call :check_path_in
if defined path_inv (
	set "path_inv="
	goto need_folder
)
rem pause
goto check_path

:check_path_in
cmd /c if "%ifolder%"=="%ifolder%" echo. 2>NUL
if "%errorlevel%"=="0" (
	set "ifolder=%ifolder%"
	goto :EOF
)

cmd /c if "%ifolder:~1%"=="%ifolder:~1%" echo. 2>NUL
if "%errorlevel%"=="0" (
	set "ifolder=%ifolder:~1%"
	goto :EOF
)

cmd /c if "%ifolder:~0,-1%"=="%ifolder:~0,-1%" echo. 2>NUL
if "%errorlevel%"=="0" (
	set "ifolder=%ifolder:~0,-1%"
	goto :EOF
)

cmd /c if "%ifolder:~1,-1%"=="%ifolder:~1,-1%" echo. 2>NUL
if "%errorlevel%"=="0" (
	set "ifolder=%ifolder:~1,-1%"
	goto :EOF
)

if not "%debug_mode%"=="0" cls
echo [ERR] 不受支持的非法路径
echo [INF] 可能是您的路径中含有非法字符
set "path_inv=1"
goto :EOF

:check_path
rem 如果路径不存在，则再次向用户获取
if not exist "%ifolder%" (
	if not "%debug_mode%"=="0" cls
	call :show_setting
	set "ifolder="
	if not defined isSetting (
		echo [ERR] 输入路径无效
		goto need_folder
	)
	set "isSetting="
	goto main_UI
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

set "test_input=%work_date_1%%work_date_2%%work_date_3%"
:format_del_space
set "space_cache=%test_input:~-1%"
if "%space_cache%"==" " (
	set "test_input=%test_input:~0,-1%"
) else (
	set "work_date=%test_input%"
	goto format_out_space_del
)
goto format_del_space
:format_out_space_del

set "r_out_dir=%rf%[ASFMKV]redirect-output\"
set "date_logdir=%rf%[ASFMKV]redirect-output\%work_date%\"
set "logdir=%rf%[ASFMKV]redirect-output\%work_date%\%work_time%\"
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
if exist "%APPDATA%\filelist.log" del /q "%APPDATA%\filelist.log"
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
title [yyfll的批量混流程序] 正在生成文件列表...请不要关闭本程序...
echo [input.get_file_list] 正在生成运行所需的文件列表...
if not "%ifolder:~-1%"=="\" set "ifolder=%ifolder%\"
rem 将符合搜索条件的文件的完整路径全部写入到filelist文件
rem 如果定义了subdir变量等于0，则判断这些路径是否在目标目录而不是其子目录
rem (1812TEST中为进一步减小磁盘读取压力加快速度，使用DIR+FINDSTR代替原有的FOR/R)
if "%subdir%"=="0" (
	rem 利用FOR循环从DIR的运行结果中获取目标目录顶层的文件
	for /f "tokens=*" %%a in ('dir /B /A:-D "%ifolder%%searchfilter%"') do (
		if exist "%%~a" (
			set /a count=count+1
			echo "%%~a">>"%APPDATA%\filelist.log"
		) else (
			call :check_path_length "%ifolder%%%~a"
		)
	)
	goto INPUT_DIR_COUNT0
) else (
	for /r "%ifolder%" %%a in ("%searchfilter%") do (
		set /a count=count+1
		echo "%%~a">>"%APPDATA%\filelist.log"
	)
)
goto INPUT_DIR_COUNT0
:check_path_length
set "path_length=%~1"
if not "%path_length:~259%"=="" echo [ERROR] 文件路径超长(260字符上限)
goto :EOF
:INPUT_DIR_COUNT0
rem 如果count记录的文件数为0，则报错
if "%count%"=="0" (
	echo [ERROR] 路径为空目录！
	goto need_folder
)
rem 获取目标目录中的所有文件，并逐次递交负责输出路径控制、MKV封装的模块
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
		if exist "%%~a" (
			set "notwork="
			set "vpath=%%~a"
			set "subnum=0"
			call :Module_GetOutputPath
			call :Module_EncapsulationMKV
		)
	)
) else (
	rem 如果是文件则仅处理一遍
	set "notwork="
	set "subnum=0"
	call :Module_GetOutputPath
	call :Module_EncapsulationMKV
)
:check_log_dir
dir /A:-D-I-L /S /B "%logdir%" 1>nul 2>nul
if not %errorlevel%==0 if exist "%logdir%" rmdir /S /Q "%logdir:~0,-1%"
:ld_has_file
dir /A:-D-I-L /S /B "%date_logdir%" 1>nul 2>nul
if not %errorlevel%==0 if exist "%date_logdir%" rmdir /S /Q "%date_logdir:~0,-1%"
:date_ld_has_file
dir /A:-D-I-L /S /B "%r_out_dir%" 1>nul 2>nul
if not %errorlevel%==0 if exist "%r_out_dir%" rmdir /S /Q "%r_out_dir:~0,-1%"
:Process_End
title [yyfll的批量混流程序] 混流完成！
if not "%debug_mode%"=="0" cls

if exist "%appdata%\filejumpExplain.log" (
		echo [ 文件跳过列表 ]
		echo.
		type "%appdata%\filejumpExplain.log"
		echo.
		echo [ 文件跳过列表 END ]
	    del /q "%appdata%\filejumpExplain.log"
		echo.
		if not defined notsub (
			echo 注：如果您想在没有外挂字幕的情况下嵌入字体，请启用notsub
		)
        echo 注："非媒体扩展名"并不意味着字体和字幕不被处理，只是它们不被当做视频处理
		echo 注：由于CMD对UTF8的支持不是很全面，以上列表出现乱码是正常现象
		echo.
)
if not "%nul_output%"=="0" if defined outpath (
	echo [OutPath] 混流完成的文件输出到"%outpath%"
) else echo [OutPath] Default: 输出到"%odir%"
if %error% GTR 0 (
	goto Has_Error
) else (
	echo [共处理%count%项且全部处理成功]
)
echo.
echo 任务完成！
goto Batch_End
:Has_Error
echo [共处理%count%项，其中有%error%项未能成功处理]
if exist "%logdir%" CHOICE /C YN /M "是否要查看LOG文件？"
if "%errorlevel%"=="1" (
	if exist "%logdir%" (
		start %logdir%
	) else echo 找不到log文件夹...
echo.
:Batch_End
rem 删除运行所需的文件列表
if exist "%rf%fonts_json.log" del /q "%rf%fonts_json.log"
if exist "%APPDATA%\filelist.log" del /q "%APPDATA%\filelist.log"
rem 如果是不是第三方调用则挂起
if "%~1"=="" pause
if not "%~1"=="" exit
set "ifolder="
goto main_UI
:Module_EncapsulationMKV
rem 如果被其他模块要求不执行封装，则立刻退出
if defined notwork set "notwork=" && goto :EOF
set /a working=working+1
title [yyfll的批量混流程序] 正在混流"%filename%"...(第%working%项/共%count%项)
if not "%debug_mode%"=="0" cls

set "setfile=%rf%mkvmerge_settings.json"

echo [Replace] 正在转义JSON...请稍等...
call :Module_ReplaceBackSlash "%opath%"
for /f "tokens=* usebackq" %%a in ("%USERPROFILE%\rforbat.log") do set "r_opath=%%~a"
(echo [
echo   "-o",
if not "%nul_output%"=="0" (
	echo   "%r_opath%",
) else echo   "NUL",
echo   "--ui-language",
echo   "%ui_language%",
echo   "-v",
echo   "--priority",
echo   "%priority%",)>"%setfile%"

:GetSubtitle
rem 如果没有任何字幕文件，则直接跳到字体封装预处理模块
if not defined sub[0] goto Start_Encapsulation
set /a subnum=subnum-1
if %subnum%==0 (
	call :GetSub_Num 0
	set "sub[0]="
) else (
	if defined sub[0] for /l %%a in (0,1,%subnum%) do call :GetSub_Num %%a
)
goto Start_Encapsulation
:GetSub_Num
if not defined sub[%1] goto :EOF
if defined sub[%1] for /f "tokens=2 delims==" %%a in ('set sub[%1]') do set "subname=%%a"

call :Module_ReplaceBackSlash "%subname%"
for /f "tokens=* usebackq" %%a in ("%USERPROFILE%\rforbat.log") do (
	(echo   "%%~a",)>>"%setfile%"
)
set "sub[%1]="
goto :EOF
:Start_Encapsulation

if not exist "%logdir%" mkdir "%logdir%" 2>nul

for /f "tokens=* usebackq" %%a in ("%rf%fonts_json.log") do (
	(echo   %%a)>>"%setfile%"
)

call :Module_ReplaceBackSlash "%vpath%"
for /f "tokens=* usebackq" %%b in ("%USERPROFILE%\rforbat.log") do (
	(echo   "%%~b",
	echo   "--title",
	echo   "[ASFMKV-%ver%] %filename%"
	echo ]
	)>>"%setfile%"
)

if not "%debug%"=="0" cls
call :show_custom_settings
echo.
rem 当nul_output为0时，将会把结果输出到NUL以在测试时不占用磁盘空间
call "%exein%" -i "%vpath%" --ui-language "%ui_language%"
:run_mkvmerge
set "debug_file=%logdir%DEBUG-%working%.log"
if "%nul_output%"=="0" (
	set "r_level=2"
) else set "r_level=1"
call "%exein%" @"%setfile%"
if %errorlevel% GEQ %r_level% (
	set /a error=error+1
	echo [DEBUG.mkvmerge] 正在重新运行并重定向mkvmerge输出...
	call "%exein%" -r "%debug_file%" @"%setfile%"
	move /-y "%setfile%" "%logdir%DEBUG-%working%.json"
)
goto Encapsulation_OK
:Encapsulation_OK
if not "%nul_output%"=="0" (
	if exist "%opath%" (
		for %%a in ("%opath%") do set "filelen=%%~za"
	) else (
		set /a error=error+1
		goto :EOF
	)
)
if "%filelen%"=="0" set /a error=error+1 & del /q "%opath%" & goto :EOF
if not defined notdel if exist "%vpath%" for %%a in ("%vpath%") do set /a vfilelen=%%~za/1000
:DelRawFile
if defined notdel goto :EOF
set /a filelen=filelen/1000
if %filelen% GEQ %vfilelen% del /q "%vpath%" && for %%a in ("%vpath%") do rename "%opath%" "%%~na.mkv"
goto :EOF
:Module_ReplaceBatch
if "%~1"=="" (
	goto RB.error_input
) else if "%~2"=="" (
	goto RB.error_input
)
set "input_string=%~1"
if "%input_string:~0,1%"=="" (
	echo [ERROR] 您没有输入任何字符！
	goto RB.error_input
)
set "for_delims=%~2"
if "%for_delims%"=="" (
	echo [ERROR] 您没有输入任何要替换的字符！
	goto RB.error_input
)
setlocal enabledelayedexpansion
for /l %%a in (0,1,1) do set "delims[%%a]=!for_delims:~%%a!"
if defined delims[1] (
	echo [ERROR] Replace对象必须是单个字符
	goto RB.error_input
)
for /f "tokens=1* delims=%for_delims%" %%a in ("%input_string%") do (
	if "%%~a%%~b"=="%input_string%" (
		echo "%input_string:~1,-1%">"%USERPROFILE%\rforbat.log"
		goto RB.end_clear
	)
)
set "replace_to=%~3"
set "output_string="
set "loop=-1"
:RB.re_replace
set /a loop=loop+1
set "RB_cache=!input_string:~%loop%,1!"
if "%RB_cache%"=="" goto RB.replace_finish
if "%RB_cache%"=="%for_delims%" (
	set "output_string=%output_string%%replace_to%"
) else set "output_string=%output_string%%RB_cache%"
goto RB.re_replace
:RB.replace_finish
echo "%output_string%">"%USERPROFILE%\rforbat.log"
:RB.end_clear
setlocal disabledelayedexpansion
set "RB_cache="
set "input_string="
set "output_string="
set "for_delims="
set "loop="
goto :EOF
:RB.error_input
echo [ERROR] 输入无效
pause
goto RB.end_clear
:Module_ReplaceBackSlash
if "%~1"=="" (
	goto RBS.error_input
)
set "input_string=A%~1A"
set "for_delims=\"
setlocal enabledelayedexpansion
for /f "tokens=1* delims=%for_delims%" %%a in ("%input_string%") do (
	if "%%~b"=="" (
		echo "%input_string:~1,-1%">"%USERPROFILE%\rforbat.log"
		set "input_string="
		set "for_delims="
		goto :EOF
	)
)
set "replace_to=\\"
set "output_string="

for /f "tokens=1 delims=%for_delims%" %%a in ("%input_string%") do if not "%%a"=="" (
	set "output_string=%%a"
)
set "loop=1"
:RBS.re_replace
set /a loop=loop+1
for /f "tokens=%loop% delims=%for_delims%" %%a in ("%input_string%") do if not "%%a"=="" (
	set "output_string=%output_string%%replace_to%%%a"
	goto RBS.re_replace
)
echo "%output_string:~1,-1%">"%USERPROFILE%\rforbat.log"
set "input_string="
set "output_string="
set "for_delims="
set "loop="
setlocal disabledelayedexpansion
goto :EOF
:RBS.error_input
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
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
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
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
		for /f "tokens=*" %%b in ("%~1") do (
			rem 在filelist中寻找是否有目标字体文件
			if "%%~nxa"=="%%~nxb" (
				set /a fontnum=fontnum+1
				goto FontNum_loop
			)
		)
	)
) else (
	set /a fontnum=fontnum+1
	goto FontNum_loop
)
goto :EOF
:FontNum_loop
if /i "%~x1"==".ttc" (
	set "ftype=application/x-truetype-font"
) else if /i "%~x1"==".otf" (
	set "ftype=application/vnd.ms-opentype"
) else if /i "%~x1"==".ttf" (
	set "ftype=application/x-truetype-font"
) else goto :EOF

call :Module_ReplaceBackSlash "%~1"
for /f "tokens=* usebackq" %%a in ("%USERPROFILE%\rforbat.log") do (
	(echo   "--attachment-mime-type",
	echo   "%ftype%",
	echo   "--attach-file",
	echo   "%%~a",)>>"%rf%fonts_json.log"
)
goto :EOF
:Get_Output_Path
for %%a in ("%vpath%") do set "ext=%%~xa"

for /f "tokens=1* delims==" %%b in ('set extlist[') do (
	if "%ext%"==".%%~c" (
		goto ext_check_over
	)
)

set /a working=working+1
set notwork=0
echo 非媒体扩展名：[%working%]"%vpath%">>"%appdata%\filejumpExplain.log"
goto :EOF

:ext_check_over
set "test="
for %%a in ("%vpath%") do (
	set "ostring=%%~dpna"
	set "filename=%%~na"
	set "odir=%%~dpa"
)
if not defined outpath set "odir=%odir%REMUX"
if defined outpath (
	if not "%outpath%"=="" (
		if not exist "%outpath%" mkdir "%outpath%">nul
		for %%a in ("%outpath%") do set "test=%%~aa"
	)
)
if defined test (
	if "%test:~0,1%"=="d" (
		if "%test:~-1%"=="\" (
	        set "ostring=%outpath%%filename%"
       ) else set "ostring=%outpath%\%filename%"
	) else (
		for /f "tokens=*" %%a in ("%outpath%") do (
			set "ostring=%%~dpa%filename%"
			set "outpath=%%~dpa"
		)
	)
	set "test="
) else set "ostring=%odir%\%filename%"
rem 1902-2开始不再遍历两次目录树而是直接利用if分开DVD字幕和一般字幕
for /r "%ifolder%" %%a in ("*%filename%*.ass","*%filename%*.ssa","*%filename%*.srt","*%filename%*.sup","*%filename%*.idx") do if not "%%~xa"==".idx" (
	call :SubNum "%%~a"
) else call :SubNum_DVDSUB "%%~a"
if not defined notfont goto notget_font

if not exist "%rf%fonts_json.log" (
	for /r "%ifolder%" %%a in ("*.ttf","*.ttc","*.otf") do call :FontNum "%%~a"
)
:notget_font
set "file="
if not defined fontnum set "fontnum=0"
if defined notsub if not defined sub[0] (
	if "%fontnum%"=="0" (
		set /a working=working+1
		set "notwork=0"
		echo 没有外挂字幕和字体：[%working%]"%vpath%">>"%appdata%\filejumpExplain.log" >>"%appdata%\filejumpExplain.log"
		goto :EOF
	)
	set "notwork="
	goto Start_Get_Output_Path
) else if "%fontnum%"=="0" (
	set /a working=working+1
	set "notwork=0"
	echo 没有字体：[%working%]"%vpath%">>"%appdata%\filejumpExplain.log""
	goto :EOF
)
if not defined sub[0] (
	set /a working=working+1
	set "notwork=0"
	echo 没有外挂字幕：[%working%]"%vpath%">>"%appdata%\filejumpExplain.log"
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
echo Add Subtitle^&Font to MKV [EasyUse1.0]
echo Copyright(c) 2018-2019 By yyfll
echo.
echo 显示帮助页面(本页面)可以使用以下指令:
echo Call "%~dpnx0" -h
echo Call "%~dpnx0" -help
echo Call "%~dpnx0" /h
echo Call "%~dpnx0" /?
echo.
echo 调用开关：
echo   ?h                  	显示帮助^(最高优先^)
echo   ?del [y/n]          	是否删除输入文件
echo   ?sub [y/n]          	没有字幕时是否嵌入字体文件
echo   ^(注意：sub开关在开启时会自动允许字体封装，即notfont为任意值^)
echo   ?out [path]         	输出目录
echo   ?dir [y/n]          	是否搜索子目录
echo   ?dbm [y/n]:[y/n]    	是否使用测试模式和空输出^(测试模式开关:空输出开关^)
echo   ^(注意：dbm开关若只输入一个y则同时开启测试模式和空输出，反之亦然^)
echo   ?ffl [filter]       	文件过滤器
echo   ?pri [0-4]  			选择进程优先级
echo   ?uil [1-4/input]   	选择Mkvmerge的语言
echo   ?exe [path]			自定义MKVmerge的路径
echo.
echo 调用注意：
echo   开关必须用引号整体括起，比如
echo   "?out %APPDATA%\test ?pri 3 ?dbm n:y"
echo   当然你也可以使用旧输入方式(不能超过8个开关!)
echo   "?out %APPDATA%\test" "?pri 3" "?dbm n:y"
echo.
echo 调用方法①^(CMD^)：
echo 	ASFMKV "输入路径" "[调用开关]"
echo.
echo 调用方法②^(CMD^):
echo 	Call "(带有某些符号的路径)\ASFMKV" "输入路径" "[调用开关]"
echo.	^(如果路径或文件名中含有括号、空格、与号或其他影响CMD的符号，可以使用Call指令并用双引号括起路径^)
echo.
echo 调用方法③:
echo   直接往BAT拖入文件或文件夹，自动运行重封装
echo.
echo 进程优先级：
echo   [0] lowest ^(最低^)
echo   [1] lower^(较低^)
echo   [2] normal^(标准^)
echo   [3] higher^(较高^)
echo   [4] highest ^(最高/实时^)
echo.
echo MKVmerge输出语言：
echo   [1] en^(English^)
echo   [2] zh_CN^(简体中文^)
echo   [3] zh_TW^(繁體中文^)
echo   [4] ja^(日本語^)
echo   该语言选项仅应用于mkvmerge输出部分，并仅在支持时使用
echo   您也可以直接输入语言，比如 "?uil zh_CN"
echo   可选的语言详见"mkvmerge --ui-language list"
echo.
echo 文件过滤器(未经测试)：
echo   搜索过滤器使用标准文件搜索语法，例如：
echo   "*.mkv"将只输入所有文件后缀名为MKV的文件
echo   "*SEFO*.*"将会输入所有文件名中含有"SEFO"的文件^(不区分大小写^)且不管后缀名是什么
echo   其实就是如何使用通配符的问题罢了
exit
:show_custom_settings
echo [CUSTOM SETTINGS]
echo [A/Active][N/Undefined]
if not defined notdel (
	echo [DEL][N] 删除输入文件
) else echo [DEL][A] 不删除输入文件
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
	echo [FFL][N] 未使用文件过滤器
) else (
	if not "%searchfilter%"=="*" (
		for /f "tokens=1* delims=\" %%a in ("%searchfilter%") do (
			if "%%~b"=="" (
				echo [FFL][A] 已加载文件过滤器"%searchfilter%"
			) else (
				echo [FFL][F] 未能加载文件过滤器"%searchfilter%"
				echo.
				echo 文件过滤器只能过滤文件，不应该有"\"，已自动重置为"*"
				echo.
				set "searchfilter=*"
			)
		)
	) else echo [FFL][N] 未使用文件过滤器
)
echo [PRI][A] 优先级"%priority%"
echo [UIL][A] MKVmerge输出语言"%ui_language%"
if not defined default_exe (
	echo [EXE][A] 使用"%exein%"
) else (
	echo [EXE][N] 使用默认程序
	if defined error_exe (
		echo.
		echo [EXE][WARNING] 用户设定的"%error_exe%"无效
		echo [EXE][WARNING] 已自动变更为有效的"%exein%"
	)
)
goto :EOF
:show_setting
if not "%ifolder%"=="set" goto :EOF
if not "%debug_mode%"=="0" cls
echo ASFMKV Settings Manager ^(ver%ver%^)
echo.
echo [可控变量]
echo [A/激活][N/未定义]
if not defined notdel (
	echo [1][N] 删除输入文件
) else echo [1][A] 不删除输入文件
if not defined notsub (
	echo [2][N] 若没有匹配的字幕则不嵌入字体
) else echo [2][A] 即使没有匹配到字幕也会嵌入字体
if not defined notfont (
	echo [3][N] 不封装字体（仅嵌入字幕）
) else echo [3][A] 封装字体（同时嵌入匹配字幕与字体）
if defined outpath (echo [4][A] 输出到目录"%outpath%") else (echo [4][N] 输出到源目录)
if "%subdir%"=="0" (echo [5][A] 不搜索子目录) else (echo [5][N] 搜索子目录)
if not "%searchfilter%"=="*" (echo [6][A] 文件过滤器为"%searchfilter%") else (echo [6][N] 没有对文件进行过滤)
echo.
echo [特殊选项]
echo [7][L] 显示允许输入的媒体文件类型
if "%debug_mode%"=="0" (echo [8][A] DEBUG模式已启动) else (echo [8][N] DEBUG模式未启动) 
echo [9][B] 回到主界面
echo.
CHOICE /C 123456789 /M "请选择您要调整的设定"
echo.
if "%errorlevel%"=="0" (
	cls
	goto show_setting
) else goto setting_%errorlevel%
:setting_1
if not defined notdel (
	set "notdel=1"
) else set "notdel="
goto show_setting
:setting_2
if not defined notsub (
	set "notsub=1"
) else set "notsub="
goto show_setting
:setting_3
if not defined notfont (
	set "notfont=1"
) else set "notfont="
goto show_setting
:setting_4
if defined outpath (
	set "outpath="
	goto show_setting
) else (
	set /p outpath=输出路径：
)
echo.
if not defined outpath (
	echo [ERR] 您没有输入任何路径！
	pause
	goto show_setting
)

if exist "%outpath:~1,-1%" (
	set "outpath=%outpath:~1,-1%"
) else set "outpath=%outpath%"
if not exist "%outpath%" (
	if not "%debug_mode%"=="0" cls
	echo [ERR] 输入路径无效！
	pause
)
goto show_setting
:setting_5
if "%subdir%"=="0" (
	set "subdir=1"
) else (
	set "subdir=0"
)
goto show_setting
:setting_6
set /p searchfilterCache=文件过滤器：
echo.
if not defined searchfilterCache (
	echo 您没有输入任何内容！
	pause
	goto show_setting
)
for /f "tokens=1* delims=\" %%a in ("%searchfilter%") do if not "%%~b"=="" (
	echo 输入的"%searchfilterCache%"无效！文件过滤器只能过滤文件！
	set "searchfilterCache="
	pause
	goto show_setting
) else (
	set "searchfilter=%searchfilterCache%"
	set "searchfilterCache="
	echo 修改成功！
	goto show_setting
)
:setting_7
if not "%debug_mode%"=="0" cls
echo ExtList Reader Ver1.0-Final
echo.
for /f "tokens=1* delims==" %%a in ('set extlist[') do (
	echo %%~a: .%%~b
)
pause
goto show_setting
:setting_8
if "%debug_mode%"=="0" (
	set "debug_mode=1"
	echo off
) else (
	set "debug_mode=0"
	echo on
)
@cls
goto show_setting
:setting_9
cls
set "ifolder="
set "isSetting=1"
goto :EOF
