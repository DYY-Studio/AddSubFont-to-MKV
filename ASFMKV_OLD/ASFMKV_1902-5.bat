@rem !This file wrote in GB2312-80(zh-Hans) code page, do not open with other code pages. But you can even open this file with UTF-8 or UTF-16, these code pages can also show the texts!
@rem �ر��������
@echo off
rem ------------------------------------------
rem ��ӭʹ��yyfll��������װ����
rem ���������ڴ���ɵ��ʽ�����õķ�������������
rem ���������� dyystudio@qq.com ����ϵ������
rem ------------------------------------------
rem �任����
title [��ʼ��] ���Ե�...
rem ------------------------------------------
rem NotDel�Զ������
rem [��] �޸�ֵʱ�����ɾ������ǰ��Դ�ļ�
rem [����] �����⸳ֵʱ����ᱣ��Դ�ļ�
rem �﷨��set "notdel=ֵ"
rem 
rem ע�⣺����ǵ�����BATָ���˸�ֵ�����Ḳ�Ǵ˴�������
rem 
rem �������÷���[0] ֵΪ0��ɾ��Դ�ļ�
rem             [-0] ֵ��Ϊ0ɾ��Դ�ļ�
set "notdel=0"
rem ------------------------------------------
rem NotSub�Զ������
rem [��] �޸�ֵʱ������������ļ������������Ļ��ʱ��Ż���ļ����з�װ
rem 		����û�������Ļ��ʹ�ļ�����������Ҳ���������ļ���
rem [����] �����⸳ֵʱ������ļ����������壬�������û�������Ļ���������Ȼ��װ���嵽�ļ�
rem �﷨��set "notsub=ֵ"
rem 
rem ע�⣺����ǵ�����BATָ���˸�ֵ�����Ḳ�Ǵ˴�������
rem 
rem �������÷���[0] ֵΪ0���޸�ֵ����
rem             [-0] ֵ��Ϊ0�����⸳ֵ����
set "notsub="
rem ------------------------------------------
rem NotFont�Զ������
rem [��] �޸�ֵʱ����������װ�����Ļ�������װ�����ļ�
rem [����] �����⸳ֵʱ�����򲻽����װ�����Ļ���һ����װ�����ļ�
rem �﷨��set "notfont=ֵ"
rem 
rem ��ѡ����������ָ��
set "notfont=0"
rem ------------------------------------------
rem OutPath�Զ������
rem [��] �޸�ֵʱ������Ὣ��װ��ɵ��ļ������Դ�ļ���
rem [��Ч·��] ����ȷ��ֵʱ������Ὣ��װ��ɵ��ļ������Ŀ���ļ���
rem 		(·������Ϊ�����ڵ�·����������Զ�����)
rem �﷨��set "outpath=ֵ(·������Ҫǰ������)"
rem 
rem �������÷���[��Ч·��] ͬ��
rem 			[��Ч·��] �����Դ�ļ��У����޸�ֵ����
set "outpath="
rem ------------------------------------------
rem SearchFilter�Զ������
rem [��] �޸�ֵʱ�������ʹ��Ĭ��ֵ(*.*)
rem [����] ���⸳ֵʱ���������ļ��У�����ֻ��װ����ƥ����ļ�
rem 	�������﷨����ʹ��ͨ���(*)����"*.mp4"��ƥ�����к�׺��ΪMP4���ļ�
rem 				Ҳ�����ļ�����ʹ��ͨ�������"*DMG*.*"��ƥ�����������к���DMG���ļ�
rem �﷨��set "searchfilter=ֵ"
rem 
rem �������÷���[ȱʡ] ͬ"��"
rem 			[����] ͬ"����"
set "searchfilter="
rem ------------------------------------------
rem MKVmerge�������ȼ�/��������
rem ����������ⷽ���֪ʶ���벻Ҫ�����޸�
rem ��������(Ĭ��"zh_CN"(��������))
set "ui_language=zh_CN"
rem ���ȼ�(Ĭ��"normal"(��׼))
set "priority=normal"
rem ------------------------------------------
rem SubDir�Զ������
rem �����Ƿ�����ָ��Ŀ¼�µ���Ŀ¼
rem [��0] ������Ŀ¼
rem [0] ��������Ŀ¼
rem 
rem �﷨��set "subdir=0"
rem
rem �������÷���[0] ͬ"0"
rem 			[��0] ͬ"��0"
set "subdir=0"
rem ------------------------------------------
rem DEBUG_MODE
rem ����ģʽ�½���ر�����CLS������ECHO
rem ע��!�������ǿ�ƿ���NUL_OUTPUT!
rem [0] ����
rem [��0] ͣ��
set "debug_mode=1"
rem ------------------------------------------
rem NUL_OUTPUT
rem �ñ��������ڲ��ԣ��벻Ҫ���⿪����
rem NUL_OUTPUT����ʱ������MKVmerge�ѽ�������NUL(�����)
rem �Լӿ�����ٶȲ����ٴ���ʹ��
rem [0] ����
rem [��0] ͣ��
set "nul_output=1"
rem ------------------------------------------
rem DEBUGģ�飬�ڳ���������ֹʱ��������
:Module_DEBUG
if not defined debug (
	set debug=0
	rem ���������
	rem [��Χ][(����)P/���� V/����] �������->��Ӧ���� ˵��
	rem [path][P] %0->%0 ��batch��·��
	rem [path][V] %1->%1 ����·��
	rem [path][V] %2->%2 ���·��
	rem [0/-0][V] %3->%3 NOTDEL
	rem [0/-0][V] %4->%4 NOTSUB
	rem [path][V] %5->%6 SearchFilter
	rem [0-2] [V] %6->%7 Priority
	rem [0-3] [V] %7->%8 ui_language
	rem [0/-0][V] %8->%5 subdir
	rem [0/-0][V] %9->%9 DEBUG_MODE
	cmd /c call "%~0" "%~1" "%~2" "%~8" "%~3" "%~4" "%~5" "%~6" "%~7" "%~9"
	if "%~1"=="" (
		echo [Module_DEBUG] �밴������˳�... 
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
rem ����
if not "%debug_mode%"=="0" cls
if "%debug_mode%"=="0" echo on
:get_input
if /i "%~1"=="-h" goto Show_Help
if /i "%~1"=="-help" goto Show_Help
if /i "%~1"=="/h" goto Show_Help
if /i "%~1"=="/?" goto Show_Help
if "%~1"=="" goto not_check_input
rem ��ȡͨ�����������������Ϣ
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
	echo [ERROR] ����·������
	goto Show_Help	
)
if not "%~2"=="-" if not "%~2"=="" if not exist "%~2" (
	mkdir "%~2">nul && set "outpath=%~2"
) else set "outpath=%~2"
:not_check_input
if not defined searchfilter goto not_replace_filter
rem ������ʽת��
echo [SearchFilter] ��⵽�ļ�����������...���Ե�...
echo.
echo [Module_ReplaceBatch] ����ת��Ϊ������ʽ...
echo [Module_ReplaceBatch] ����0/7
call :Module_ReplaceBatch "%searchfilter%" "." "\."
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����1/7
call :Module_ReplaceBatch "%replace_output%" "(" "\("
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����2/7
call :Module_ReplaceBatch "%replace_output%" ")" "\)"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����3/7
call :Module_ReplaceBatch "%replace_output%" "+" "\+"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����4/7
call :Module_ReplaceBatch "%replace_output%" "?" "\?"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����5/7
call :Module_ReplaceBatch "%replace_output%" "{" "\{"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����6/7
call :Module_ReplaceBatch "%replace_output%" "*" ".*"
for /f "usebackq tokens=*" %%a in ("%USERPROFILE%\rforbat.log") do set "replace_output=%%~a"
echo [Module_ReplaceBatch] ����7/7
set "filter=%replace_output%"
set "replace_output="
:not_replace_filter
if "%debug_mode%"=="0" set "NUL_OUTPUT=0"
rem ��ȡ������Ϣ
set "rf=%~dp0"
rem ��λ����������Ŀ¼����ֹ�Թ���Աģʽ�����������ξ���
cd /d "%rf%"
rem �������
title [��ʼ��] ���ڲ���mkvmerge������...
echo [��ʼ��] �ȴ�mkvmerge��Ӧ...
if not "%debug_mode%"=="0" cls
rem ����MKVmerge�Ƿ����
mkvmerge -V>nul||if not "%debug_mode%"=="0" cls && echo ����:mkvmerge��װ��������� && title [ERROR]mkvmerge Load Failed && exit
goto x264_check_out
ffmpeg -version>nul && for /f "tokens=1-3" %%a in ('ffmpeg -version') do echo [Test] Find %%a %%b %%c && goto ffmpeg_check_out
:ffmpeg_check_out
x264 -V>nul && for /f "tokens=*" %%a in ('x264 --help') do echo [Test] Find %%a && goto x264_check_out
:x264_check_out
set "ver=1902-5"
rem ��ȡMKVmerge�İ汾��Ϣ�����ı���
echo [INF] AddSubFont(to)MKV V%ver% ^| Copyright(c) 2018-2019 yyfll
for /f "tokens=1-2* delims= " %%a in ('mkvmerge -V') do (
	if "%debug_mode%"=="0" (
		title [yyfll��������������]��Ƶ+��Ļ^&����--^>MKV[%%a %%b] [GB2312] [VER. %ver%^(DEBUG_MODE^)]
	) else title [yyfll��������������]��Ƶ+��Ļ^&����--^>MKV[%%a %%b] [GB2312] [VER. %ver%]
	echo [USE] %%a %%b %%c ^| Copyright^(c^) 2002-2019 Moritz Bunkus
)
rem ������������ֱ��ִ��
echo.
@if "%debug_mode%"=="0" echo off
echo [CUSTOM SETTINGS]
echo [A/Active][N/Undefined]
if not defined notdel (
	echo [DEL][N] ɾ�������ļ�
) else @echo [DEL][A] ��ɾ�������ļ�
if not defined notsub (
	echo [SUB][N] ��û��ƥ�����Ļ��Ƕ������
) else echo [SUB][A] ��ʹû��ƥ�䵽��ĻҲ��Ƕ������
if not defined notfont (
	echo [FNT][N] ����װ���壨��Ƕ����Ļ��
) else echo [FNT][A] ��װ���壨ͬʱǶ��ƥ����Ļ�����壩
if defined outpath (echo [OUT][A] �����Ŀ¼"%outpath%") else (echo [OUT][N] �����ԴĿ¼)
if "%subdir%"=="0" (echo [DIR][A] ��������Ŀ¼) else (echo [DIR][N] ������Ŀ¼)
if "%debug_mode%"=="0" (echo [DBM][A] �����ò���ģʽ) else (echo [DBM][N] δʹ�ò���ģʽ)
if "%nul_output%"=="0" (echo [NUL][A] �����ÿ����) else (echo [NUL][N] �������)
if not defined searchfilter (
	set "searchfilter=*"
	set "filter=.*"
	echo [FFL][N] δʹ���ļ�������
) else echo [FFL][A] �Ѽ����ļ�������"%searchfilter%"
@if "%debug_mode%"=="0" echo on
if defined ifolder goto check_path
:need_folder
rem ���û���ȡ·��
echo.
set "ifolder="
set /p ifolder=�ļ�(��Ŀ¼)·��(��������)��
rem ����û�û�����룬���ٴ����û���ȡ��������ڣ�����ȥ������
if not defined ifolder (
	if not "%debug_mode%"=="0" cls
	echo [ERROR] ��û�������κ�·����
	goto need_folder
)
if exist "%ifolder:~1,-1%" (
	set "ifolder=%ifolder:~1,-1%"
) else set "ifolder=%ifolder%"
rem pause
:check_path
rem ���·�������ڣ����ٴ����û���ȡ
if not exist "%ifolder%" (
	if not "%debug_mode%"=="0" cls
	echo [ERROR] ·����Ч��
	goto need_folder
)
echo.
:start_encode
if not "%debug_mode%"=="0" cls
rem ��ʼ������
set working=0
set error=0
set count=0
rem ȷ����Ŀ¼�����ļ�
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
rem �����Ŀ¼��ִ����������
rem ɾ����ǰ���ڼ�¼�ļ��б��LOG����ֹ�ظ�д��
if not defined dirin (
	for /f "tokens=*" %%a in ("%ifolder%") do (
		cd /d "%%~dpa"
		set "vpath=%ifolder%"
		set "ifolder=%%~dpa"
	)
) else cd /d "%ifolder%"
if exist "%~dp0filelist.log" del /q "%~dp0filelist.log"
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
title [yyfll��������������] ���������ļ��б�...�벻Ҫ�رձ�����...
echo [input.get_file_list] ������������������ļ��б�...
rem �����������������ļ�������·��ȫ��д�뵽filelist�ļ�
rem ���������subdir��������0�����ж���Щ·���Ƿ���Ŀ��Ŀ¼����������Ŀ¼
rem (1812TEST��Ϊ��һ����С���̶�ȡѹ���ӿ��ٶȣ�ʹ��DIR+FINDSTR����ԭ�е�FOR/R)
if "%subdir%"=="0" (
	rem ����FORѭ����DIR�����н���л�ȡĿ��Ŀ¼������ļ�
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
if not "%path_length:~259%"=="" echo [ERROR] �ļ�·������(260�ַ�����)
goto :EOF
:INPUT_DIR_SUBDIR
rem ���Ŀ��Ŀ¼����û���ļ���ֱ��������һ��
if %count%==0 goto INPUT_DIR_COUNT0
rem ���filterû�ж�����ֱ��������һ��(filterδ�����������Ҫ�����ļ�����)
if not defined filter goto INPUT_DIR_COUNT0
set "count=0"
rem ����findstr����֪�ļ���ȡ�������������˵��ļ�
findstr /I "%filter%" "%~dp0filereader.log">>"%~dp0filelist.log"
rem ���¼��������������ļ�
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do set /a count=count+1
) else set count=1
rem ɾ����ʱ���ݼ�¼LOG
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
:INPUT_DIR_COUNT0
rem ���count��¼���ļ���Ϊ0���򱨴�
if %count%==0 if %searchfilter%==* (
	echo [ERROR] ·��Ϊ��Ŀ¼��
	goto need_folder
) else (
	echo ��·�����޷�ƥ�䵽�ļ�
	echo ƥ�������Ч��
	choice /M �Ƿ�ʹ��Ĭ��ƥ�����
	if %errorlevel%==1 set "searchfilter=*"
	goto need_folder
)
rem ɾ����¼��¼��Ŀ��Ŀ¼������Ŀ¼�е��ļ�·����log�ļ�
if exist "%~dp0filereader.log" (
	rename "%~dp0filereader.log" "filelist.log"
)
rem ��ȡĿ��Ŀ¼�е������ļ�������εݽ��������·�����ơ�MKV��װ��ģ��
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		if exist "%%~a" (
			set "vpath=%%~a"
			call :Module_GetOutputPath
			call :Module_EncapsulationMKV
		)
	)
) else (
	rem ������ļ��������һ��
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
title [yyfll��������������] ������ɣ�
if not "%debug_mode%"=="0" cls
if %error% GTR 0 (
	goto Has_Error
) else echo [������%count%����ȫ������ɹ�]
echo ������ɣ�
goto Batch_End
:Has_Error
echo [������%count%�������%error%��δ�ܳɹ�����]
if exist "%logdir%" CHOICE /C YN /M "�Ƿ�Ҫ�鿴LOG�ļ���"
if "%error%"=="1" (
	if exist "%logdir%" (
		start "%logdir%"
	) else echo �Ҳ���log�ļ���...
echo.
:Batch_End
rem ɾ������������ļ��б�
if exist "%~dp0filelist.log" del /q "%~dp0filelist.log"
rem ����ǲ��ǵ��������������
if "%~1"=="" pause
exit
:Module_EncapsulationMKV
rem ���������ģ��Ҫ��ִ�з�װ���������˳�
if defined notwork set "notwork=" && goto :EOF
set /a working=working+1
title [yyfll��������������] ���ڻ���"%filename%"...(��%working%��/��%count%��)
if not "%debug_mode%"=="0" cls
set "mkvinput="
:GetSubtitle
rem ���û���κ���Ļ�ļ�����ֱ�����������װԤ����ģ��
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
rem ���Ǿɵ�mkv��װ�������ɿ飬�������㷨�����
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
rem ���û���κ������ļ�����ֱ���˳�
if not defined font[%1] goto :EOF
rem ʹ��FOR��ȡfont�����%1��
if defined font[%1] for /f "tokens=2 delims==" %%a in ('set font[%1]') do set "fontname=%%a"
rem ��ֹ�����ļ����������
for /f "tokens=2 delims=^&" %%a in ("%fontname%A") do if not "%%b"=="" for %%a in ("%fontname%") do call :Module_DeleteAND "%%~dpnxa" && call :Rename_Font "%%~xa"
rem ���������ļ�����չ�������帽������
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
rem ��nul_outputΪ0ʱ������ѽ�������NUL���ڲ���ʱ��ռ�ô��̿ռ�
mkvmerge -i "%vpath%" --ui-language "%ui_language%"
:run_mkvmerge
if "%nul_output%"=="0" (
	for /f "tokens=* delims=^|" %%a in ("%mkvinput%") do (
		mkvmerge -o NUL --ui-language "%ui_language%" -v "%vpath%"%%~a
		if "%errorlevel%"=="2" (
			set /a error=error+1
			echo INPUT_FILE��"%vpath%">"%rf%DEBUG-%working%.log"
			echo [DEBUG.mkvmerge] �����������в��ض���mkvmerge���...
			mkvmerge -o NUL -v -r "%logdir%\DEBUG-%working%.log" --ui-language "%ui_language%" "%vpath%"%%~a
		)
	)
) else (
	mkvmerge -o "%opath%" --ui-language "%ui_language%" --priority "%priority%" -v --title "%filename%[ASFMKV%ver%_REMUX]" "%vpath%"%mkvinput% 
	if not "%errorlevel%"=="0" (
		set /a error=error+1
		echo INPUT_FILE��"%vpath%">"%rf%DEBUG-%working%.log"
		echo [DEBUG.mkvmerge] �����������в��ض���mkvmerge���...
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
	echo [ERROR] ������Ч
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
	echo [ERROR] Replace��������ǵ����ַ�
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
	echo [ERROR] ���������а�����ģ���޷�������ַ�
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
echo [ERROR] ������Ч
setlocal disabledelayedexpansion
pause
goto :EOF
:Module_GetOutputPath
goto Get_Output_Path
:SubNum
rem INPUT_VALUE_1����Ļ�ļ�·��(������չ��)
if "%subdir%"=="0" (
	rem ��1902-2��ʼ����subdirʱֱ�ӱ���filelist����������Ŀ¼�����Դ˽��ʹ���ʹ����
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		for /f "tokens=*" %%b in ("%~1") do (
			rem ��filelist��Ѱ���Ƿ���Ŀ����Ļ�ļ�
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
	rem ��1902-2��ʼ����subdirʱֱ�ӱ���filelist����������Ŀ¼�����Դ˽��ʹ���ʹ����
	for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do (
		for /f "tokens=*" %%b in ("%~1") do (
			rem ��filelist��Ѱ���Ƿ���Ŀ�������ļ�
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
rem 1902-2��ʼ���ٱ�������Ŀ¼������ֱ������if�ֿ�DVD��Ļ��һ����Ļ
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
echo ��ʾ����ҳ��(��ҳ��)����ʹ������ָ��:
echo Call "%~dpna0" -h
echo Call "%~dpna0" -help
echo Call "%~dpna0" /h
echo Call "%~dpna0" /?
echo.
echo ʹ�÷�����(CMD)��
echo   %~n0 "����·��" "���·��" "NotDel" "NotSub" "SubDir" "SearchFilter" "���ȼ�" "UI����" "����ģʽ"
echo   (�����AddSubFontToMKV��ͬһ�ļ����������ʹ�ø�ָ��)
echo.
echo ʹ�÷�����(CMD):
echo   Call "%~dpn0" "����·��" "���·��" "NotDel" "NotSub" "SubDir" "SearchFilter" "���ȼ�" "UI����" "����ģʽ"
echo   (���·�����ļ����к������š��ո���Ż�����Ӱ��CMD�ķ��ţ�����ʹ��Callָ���˫��������·��)
echo.	
echo ʹ�÷�����:
echo   ֱ����BAT�����ļ����ļ��У��Զ������ط�װ
echo.
echo ѡ��ȱʡ:
echo   [-] ʹ��"-"�ű�ʾ��ѡ���ȱ����ȱѡ�ʹ�ó���Ĭ��ֵ
echo     (�����ȱ����·�������ڳ�����ѯ��)
echo   ����: %~n0 - "D:\Video" - - - "*.mp4" - - -
echo     (���﷨����ָ������ļ���ΪD:\Video��ָ��ֻ�������׺��Ϊmp4���ļ�������ѡ���ȱ)
echo.
echo MKVmerge�������ȼ�(���ȼ�)��
echo   [0] �ϵͽ������ȼ����п��ܼ�����װ�ٶȣ������ܻ�ӿ���������Ĵ��̶�д
echo   [1] ��׼�������ȼ�
echo   [2] �ϸ߽������ȼ���������΢�ӿ��װ�ٶȣ������ܻ����������ֹ���������ȼ�����Ĵ��̶�д
echo   [����] ��Ч������ʹ��Ĭ��ֵ
echo.
echo MKVmerge��������(UI����)��
echo   [0] English(en)
echo   [1] ��������(zh_CN)
echo   [2] ���w����(zh_TW)
echo   [3] �ձ��Z(ja)
echo   [����] ��Ч������ʹ��Ĭ��ֵ
echo.
echo NotDel������
echo   [0] 0����ɾ��Դ�ļ�
echo   [1] ���⸳ֵ��ɾ��Դ�ļ�
echo.
echo NotSub����:
echo   [0] 0��û�������Ļ��Ƕ������
echo   [1] ���⸳ֵ��û�������Ļʱ��ȻǶ������
echo.
echo SubDir����:
echo	[0] 0����������Ŀ¼
echo	[1] ���⸳ֵ������������Ŀ¼
echo.
echo ����ģʽ:
echo	[0] 0�����ò���ģʽ���ر�����CLS������Echo
echo	[1] ���⸳ֵ�������ò���ģʽ
echo.
echo SearchFilter�﷨��
echo   ����������ʹ�ñ�׼�ļ������﷨��������ʹ��ͨ���(*)�����磺
echo   "*.mkv"��ֻ���������ļ���׺��ΪMKV���ļ�
echo   "*SEFO*.*"�������������ļ����к���"SEFO"���ļ�(�����ִ�Сд)�Ҳ��ܺ�׺����ʲô
echo   "*VCB-S*Hi10*.mkv"�������ļ����к���"VCB-S"��"Hi10"("VCB-S"������"Hi10"֮ǰ)�ĺ�׺��ΪMKV���ļ�
exit