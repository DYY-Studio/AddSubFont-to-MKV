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
rem EXEin
rem �ñ�����������ʱ���õ�MKVmerge��·��
rem
set "exein=mkvmerge"
rem ------------------------------------------
rem DEBUGģ�飬�ڳ���������ֹʱ��������
:Module_DEBUG
if not defined debug (
	set debug=0
	cmd /c call "%~0" "%~1" "%~2%~3%~4%~5%~6%~7%~8%~9"
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
:get_input
rem EasyUse�����������
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
						echo [EasyUse Error] ���·����Ч
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
	echo [ERROR] ����·������
	goto Show_Help	
)
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
rem ��ȡ������Ϣ
set "rf=%~dp0"
rem ��λ����������Ŀ¼����ֹ�Թ���Աģʽ�����������ξ���
cd /d "%rf%"
rem �������
if not "%debug_mode%"=="0" cls
title [LOAD] ���ڲ���mkvmerge������...
echo [LOAD] ���ڲ���mkvmerge�Ƿ����...
:check_mkvmerge
rem ����MKVmerge�Ƿ����
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

if not "%errorlevel%"=="0" (
	echo [ERROR] EXEIN�����õ�·����Ч
	set "errorlevel=0"
) else goto no_check_again

call "mkvmerge" -V>nul 2>nul

if "%errorlevel%"=="0" (
	set "exein=mkvmerge"
	echo [CORRECT] EXEIN=mkvmerge
) else (
	echo [ERROR] �޷�ʹ��MKVmerge
	title [ERROR] ASFMKV can't use MKVmerge
	exit
)
:no_check_again
echo [LOAD] ���ڲ�������"%ui_language%"�Ƿ����...
for /f "skip=1 tokens=1 delims= " %%a in ('call "%exein%" --ui-language list') do (
	if "%ui_language%"=="%%~a" goto uil_check_ok
)
echo [ERROR] ����"%ui_language%"������
echo [CORRECT] �Ѹ���ΪĬ������"en"
set "ui_language=en"
:uil_check_ok
set "ver=1.03-EasyUse"
if not "%debug_mode%"=="0" cls
rem ��ȡMKVmerge�İ汾��Ϣ�����ı���
echo [INF] ASFMKV V%ver% ^| Copyright(c) 2018-2019 yyfll
for /f "tokens=1-2* delims= " %%a in ('call "%exein%" -V') do (
	if "%debug_mode%"=="0" (
		title AddSubFont-to-MKV [USE:%%a %%b][GB2312][VER. %ver%^(DEBUG_MODE^)]
	) else title AddSubFont-to-MKV [USE:%%a %%b][GB2312][VER. %ver%]
	echo [USE] %%a %%b ^| Copyright^(c^) 2002-2019 Moritz Bunkus
)
rem ������������ֱ��ִ��
echo.
@if "%debug_mode%"=="0" echo off
call :show_custom_settings
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
if exist "%APPDATA%\filelist.log" del /q "%APPDATA%\filelist.log"
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
		echo "%%~a">>"%APPDATA%\filelist.log"
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
findstr /I "%filter%" "%~dp0filereader.log">>"%APPDATA%\filelist.log"
rem ���¼��������������ļ�
if defined dirin (
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do set /a count=count+1
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
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
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
if exist "%logdir%" (
	for /r "%logdir%" %%a in (*.log) do (
		if exist "%%~a" (
			if not "%%~za" GTR "0" (
				rmdir "%logdir%" 2>nul
			) else goto logdir_has_file
		)
	)
)
:ld_has_file
if exist "%date_logdir%" (
	for /r "%date_logdir%" %%a in (*.log) do (
		if exist "%%~a" (
			if not "%%~za" GTR "0" (
				rmdir "%logdir%" 2>nul
			) else goto date_ld_has_file
		)
	)
)
:date_ld_has_file
if exist "%r_out_dir%" (
	for /r "%r_out_dir%" %%a in (*.log) do (
		if exist "%%~a" (
			if not "%%~za" GTR "0" (
				rmdir "%logdir%" 2>nul
			) else goto Process_End
		)
	)
)
:Process_End
title [yyfll��������������] ������ɣ�
if not "%debug_mode%"=="0" cls
if not "%nul_output%"=="0" if defined outpath echo [OutPath] ������ɵ��ļ������"%outpath%"
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
if exist "%APPDATA%\filelist.log" del /q "%APPDATA%\filelist.log"
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
call :show_custom_settings
echo.
rem ��nul_outputΪ0ʱ������ѽ�������NUL���ڲ���ʱ��ռ�ô��̿ռ�
call "%exein%" -i "%vpath%" --ui-language "%ui_language%"
:run_mkvmerge
set "debug_file=%rf%DEBUG-%working%.log"
if "%nul_output%"=="0" (
	for /f "tokens=* delims=^|" %%a in ("%mkvinput%") do (
		call "%exein%" -o NUL --ui-language "%ui_language%" -v "%vpath%"%%~a
		if "%errorlevel%"=="2" (
			set /a error=error+1
			echo INPUT_FILE��"%vpath%">"%debug_file%"
			echo [DEBUG.mkvmerge] �����������в��ض���mkvmerge���...
			call "%exein%" -o NUL -v -r "%debug_file%" --ui-language "%ui_language%" "%vpath%"%%~a
		)
	)
) else (
	call "%exein%" -o "%opath%" --ui-language "%ui_language%" --priority "%priority%" -v --title "[ASFMKV-%ver%] %filename%" "%vpath%"%mkvinput% 
	if not "%errorlevel%"=="0" (
		set /a error=error+1
		echo INPUT_FILE��"%vpath%">"%debug_file%"
		echo [DEBUG.mkvmerge] �����������в��ض���mkvmerge���...
		call "%exein%" -o NUL -r "%debug_file%" --ui-language "%ui_language%" --priority "%priority%" -v --title "[ASFMKV-%ver%] %filename%" "%vpath%"%mkvinput%
	)
)
if exist "%debug_file%" move -y "%debug_file%" "%logdir%"
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
set "input_string=%~1"
if "%input_string:~0,1%"=="" (
	echo [ERROR] ��û�������κ��ַ���
	goto RB.error_input
)
set "for_delims=%~2"
if "%for_delims%"=="" (
	echo [ERROR] ��û�������κ�Ҫ�滻���ַ���
	goto RB.error_input
)
setlocal enabledelayedexpansion
for /l %%a in (0,1,1) do set "delims[%%a]=!for_delims:~%%a!"
if defined delims[1] (
	echo [ERROR] Replace��������ǵ����ַ�
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
echo [ERROR] ������Ч
pause
goto RB.end_clear
:Module_GetOutputPath
goto Get_Output_Path
:SubNum
rem INPUT_VALUE_1����Ļ�ļ�·��(������չ��)
if "%subdir%"=="0" (
	rem ��1902-2��ʼ����subdirʱֱ�ӱ���filelist����������Ŀ¼�����Դ˽��ʹ���ʹ����
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
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
	for /f "usebackq tokens=*" %%a in ("%APPDATA%\filelist.log") do (
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
echo Add Subtitle^&Font to MKV [EasyUse1.0]
echo Copyright(c) 2018-2019 By yyfll
echo.
echo ��ʾ����ҳ��(��ҳ��)����ʹ������ָ��:
echo Call "%~dpnx0" -h
echo Call "%~dpnx0" -help
echo Call "%~dpnx0" /h
echo Call "%~dpnx0" /?
echo.
echo ���ÿ��أ�
echo   ?h                  	��ʾ����^(�������^)
echo   ?del [y/n]          	�Ƿ�ɾ�������ļ�
echo   ?sub [y/n]          	û����Ļʱ�Ƿ�Ƕ�������ļ�
echo   ^(ע�⣺sub�����ڿ���ʱ���Զ����������װ����notfontΪ����ֵ^)
echo   ?out [path]         	���Ŀ¼
echo   ?dir [y/n]          	�Ƿ�������Ŀ¼
echo   ?dbm [y/n]:[y/n]    	�Ƿ�ʹ�ò���ģʽ�Ϳ����^(����ģʽ����:���������^)
echo   ^(ע�⣺dbm������ֻ����һ��y��ͬʱ��������ģʽ�Ϳ��������֮��Ȼ^)
echo   ?ffl [filter]       	�ļ�������
echo   ?pri [0-4]  			ѡ��������ȼ�
echo   ?uil [1-4/input]   	ѡ��Mkvmerge������
echo   ?exe [path]			�Զ���MKVmerge��·��
echo. 
echo ����ע�⣺
echo   ���ر����������������𣬱���
echo   "?out %APPDATA%\test ?pri 3 ?dbm n:y"
echo   ��Ȼ��Ҳ����ʹ�þ����뷽ʽ(���ܳ���8������!)
echo   "?out %APPDATA%\test" "?pri 3" "?dbm n:y"
echo.	
echo ���÷�����^(CMD^)��
echo 	ASFMKV "����·��" "[���ÿ���]"
echo.
echo ���÷�����^(CMD^):
echo 	Call "(����ĳЩ���ŵ�·��)\ASFMKV" "����·��" "[���ÿ���]"
echo.	^(���·�����ļ����к������š��ո���Ż�����Ӱ��CMD�ķ��ţ�����ʹ��Callָ���˫��������·��^)
echo.
echo ���÷�����:
echo   ֱ����BAT�����ļ����ļ��У��Զ������ط�װ
echo.
echo �������ȼ���
echo   [0] lowest ^(���^)
echo   [1] lower^(�ϵ�^)
echo   [2] normal^(��׼^)
echo   [3] higher^(�ϸ�^)
echo   [4] highest ^(���/ʵʱ^)
echo.
echo MKVmerge������ԣ�
echo   [1] en^(English^)
echo   [2] zh_CN^(��������^)
echo   [3] zh_TW^(���w����^)
echo   [4] ja^(�ձ��Z^)
echo   ������ѡ���Ӧ����mkvmerge������֣�������֧��ʱʹ��
echo   ��Ҳ����ֱ���������ԣ����� "?uil zh_CN"
echo   ��ѡ���������"mkvmerge --ui-language list"
echo.
echo �ļ�������(δ������)��
echo   ����������ʹ�ñ�׼�ļ������﷨�����磺
echo   "*.mkv"��ֻ���������ļ���׺��ΪMKV���ļ�
echo   "*SEFO*.*"�������������ļ����к���"SEFO"���ļ�^(�����ִ�Сд^)�Ҳ��ܺ�׺����ʲô
echo   ��ʵ�������ʹ��ͨ������������
exit
:show_custom_settings
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
echo [PRI][A] ���ȼ�"%priority%"
echo [UIL][A] MKVmerge�������"%ui_language%"
if not "%exein%"=="mkvmerge" (
	echo [EXE][A] ʹ��"%exein%"
) else echo [EXE][N] ʹ��Ĭ�ϳ���
goto :EOF