@rem !This file wrote by GB2312-80(zh-Hans) code page, do not open with other code pages. But you can even open this file with UTF-8 or UTF-16, these code pages can also show the texts!
@rem �ر��������
@echo off
rem ------------------------------------------
rem ��ӭʹ��yyfll��������װ����
rem ���������ڴ���ɵ��ʽ�����õķ�������������
rem ���������� yyfll1@qq.com ����ϵ������
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
rem ���ȼ�(Ĭ��"normal"(��ͨ))
set "priority=normal"
rem ------------------------------------------
rem SubDir�Զ������
rem �����Ƿ�����ָ��Ŀ¼�µ���Ŀ¼
rem [��0] ������Ŀ¼
rem [0] ��������Ŀ¼
rem 
rem �﷨��set "subdir=0"
rem 
rem �ݲ�֧�ֵ���������
set "subdir=0"
rem ------------------------------------------
rem DEBUGģ�飬�ڳ���������ֹʱ��������
:Module_DEBUG
if not defined debug (
	set debug=0
	cmd /k call "%~0" "%~1" "%~2" "%~5" "%~6" "%~7" "%~3" "%~4"
	if "%~1"=="" (
		echo �밴������˳�... 
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
cls
:get_input
if /i "%~1"=="-h" goto Show_Help
if /i "%~1"=="-help" goto Show_Help
if /i "%~1"=="/h" goto Show_Help
if /i "%~1"=="/?" goto Show_Help
if "%~1"=="" goto not_check_input
rem ��ȡͨ�����������������Ϣ
if not "%~7"=="-" if not "%~7"=="" (
	if "%~7"=="0" (
		set "ui_language=en"
	) else if "%~7"=="1" (
		set "ui_language=zh_CN"
	) else if "%~7"=="2" (
		set "ui_language=zh_TW"
	) else if "%~7"=="3" (
		set "ui_language=ja"
	)
)
if not defined ui_language set "ui_language=en"
if not "%~6"=="-" if not "%~6"=="" (
	if "%~6"=="0" (
		set "priority=lower"
	) else if "%~6"=="1" (
		set "priority=normal"
	) else if "%~6"=="2" (
		set "priority=higher"
	)
)
if not defined priority set "priority=normal"
if not "%~5"=="-" if not "%~5"=="" (
	set "searchfilter=%~5"
) else set "searchfilter="
echo "%~4"
if not "%~4"=="-" if not "%~4"=="" if not "%~4"=="0" (
	set "notsub=0"
) else set "notsub="
if not "%~3"=="-" if not "%~4"=="" if not "%~3"=="0" (
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
if defined searchfilter for /f "tokens=*" %%a in ("%searchfilter%") do call :Module_Replace2 "%%~dpna"
rem ��ȡ������Ϣ
set "rf=%~dp0"
rem ��λ����������Ŀ¼����ֹ�Թ���Աģʽ�����������ξ���
cd /d "%rf%"
rem �������
title [��ʼ��] ���ڲ���mkvmerge������...
rem ����MKVmerge�Ƿ����
mkvmerge -V>nul||cls && echo ����:mkvmerge��װ��������� && title [ERROR]mkvmerge Load Failed && exit
goto x264_check_out
ffmpeg -version>nul && for /f "tokens=1-3" %%a in ('ffmpeg -version') do echo [Test] Find %%a %%b %%c && goto ffmpeg_check_out
:ffmpeg_check_out
x264 -V>nul && for /f "tokens=*" %%a in ('x264 --help') do echo [Test] Find %%a && goto x264_check_out
:x264_check_out
rem ��ȡMKVmerge�İ汾��Ϣ�����ı���
for /f "tokens=1-2* delims= " %%a in ('mkvmerge -V') do (
	title [yyfll��������������]��Ƶ+��Ļ^&����--^>MKV[%%a %%b] [GB2312] [VER. 1812TEST]
	echo [PL] ����ʹ��%%a %%b %%c
)
rem ������������ֱ��ִ��
echo.
if not defined notdel (
	echo [ND] NotDel����δ�����壬���򽫻�������ط�װ��ɾ�������ļ�
) else echo [ND] NotDel�����ѱ����壬���򽫲���ɾ�������ļ�
if not defined notsub (
	echo [NS] NotSub����δ�����壬���򽫲�����û����Ļ�������ִ���ط�װ
) else echo [NS] NotSub�����ѱ����壬������û����Ļ�������ִ���ط�װ
if not defined notfont (
	echo [NF] NotFont����δ�����壬���򽫲��������ִ���ط�װ��������Ļ��Ƕ��
) else echo [NF] NotFont�����ѱ����壬���򽫻������ִ���ط�װ����Ƕ��Ļ�����壩
if defined outpath echo [OP] ���·���ѱ����壬�ļ��ط�װ�󽫻������"%outpath%"
if "%subdir%"=="0" echo [SD] SubDir�ѱ�����Ϊ������Ŀ��Ŀ¼�µ���Ŀ¼
if not defined searchfilter (
	set "searchfilter=*"
	set "filter="
	echo [FF] δʹ��
) else echo [FF] ʹ�ù����� "%searchfilter%"
if defined ifolder goto check_path
:need_folder
rem ���û���ȡ·��
echo.
set /p ifolder=�ļ�(��Ŀ¼)·��(��������)��
rem ����û�û�����룬���ٴ����û���ȡ��������ڣ�����ȥ������
if not defined ifolder (
	cls
	echo [ERROR] ��û�������κ�·����
	goto need_folder
) else for %%a in ("%ifolder%") do set "ifolder=%%~a"
:check_path
rem ���·�������ڣ����ٴ����û���ȡ
if not exist "%ifolder%" (
	cls
	echo [ERROR] ·����Ч��
	goto need_folder
)
echo.
:start_encode
cls
rem ��ʼ������
set working=0
set error=0
set count=0
rem ȷ����Ŀ¼�����ļ�
for %%a in ("%ifolder%") do set "attribute=%%~aa"
if /i %attribute:~0,1%==d goto Input_Dir
if not defined attribute goto Input_Dir
:Input_File
rem ������ļ��������һ��
set count=1
set "vpath=%ifolder%"
for %%a in ("%ifolder%") do set "ifolder=%%~dpa"
call :Module_GetOutputPath
call :Module_EncapsulationMKV||set /a error=error+1
goto Process_End
:Input_Dir
rem �����Ŀ¼��ִ����������
rem ɾ����ǰ���ڼ�¼�ļ��б��LOG����ֹ�ظ�д��
cd /d "%ifolder%"
if exist "%~dp0filelist.log" del /q "%~dp0filelist.log"
if exist "%~dp0filereader.log" del /q "%~dp0filereader.log"
title [yyfll��������������] ���������ļ��б�...�벻Ҫ�رձ�����...
echo [Module_DIR-INPUT] ������������������ļ��б�...
rem �����������������ļ�������·��ȫ��д�뵽filelist�ļ�
rem ���������subdir��������0�����ж���Щ·���Ƿ���Ŀ��Ŀ¼����������Ŀ¼
rem (1812TEST��Ϊ��һ����С���̶�ȡѹ���ӿ��ٶȣ�ʹ��DIR+FINDSTR����ԭ�е�FOR/R)
if "%subdir%"=="0" (
	rem ����FORѭ����DIR�����н���л�ȡĿ��Ŀ¼������ļ�
	for /f "tokens=*" %%a in ('dir /B /A:-D "%ifolder%"') do (
		if exist "%%~a" (
			set /a count=count+1
			echo "%%~a">>"%~dp0filereader.log"
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
:INPUT_DIR_SUBDIR
rem ���Ŀ��Ŀ¼����û���ļ���ֱ��������һ��
if %count%==0 goto INPUT_DIR_COUNT0
rem ���filterû�ж�����ֱ��������һ��(filterδ�����������Ҫ�����ļ�����)
if not defined filter goto INPUT_DIR_COUNT0
set "count=0"
rem ����findstr����֪�ļ���ȡ�������������˵��ļ�
findstr /I "%filter%" "%~dp0filereader.log">>"%~dp0filelist.log"
rem ���¼��������������ļ�
for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do set /a count=count+1
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
for /f "usebackq tokens=*" %%a in ("%~dp0filelist.log") do if exist "%%~a" set "vpath=%%~a" & call :Module_GetOutputPath & call :Module_EncapsulationMKV ||set /a error=error+1
:Process_End
title [yyfll��������������] ������ɣ�
cls
if %error% GTR 0 (
	goto Has_Error
) else echo [������%count%����ȫ������ɹ�]
echo ������ɣ�
goto Batch_End
:Has_Error
echo [������%count%�������%error%��δ�ܳɹ�����]
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
cls
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
rem ����ʵ����ָ�ֻ�ڲ���ʱʹ��
rem for /f "tokens=* delims=^|" %%a in ("%mkvinput%") do mkvmerge -o NUL "%vpath%"%%a 
mkvmerge --ui-language "%ui_language%" --priority "%priority%" -o "%opath%" --title "%filename%[ReMux By AddSubFontMKV]" "%vpath%"%mkvinput%
:Encapsulation_OK
if exist "%opath%" (
	for %%a in ("%opath%") do set "filelen=%%~za"
) else (
	set /a error=error+1
	goto :EOF
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
:Module_Replace2
set "filter="
if "%~1"=="" (
	echo [ERROR] ������Ч
	pause
	goto :EOF
)
set "inputstring=%~n1A"
set "outputstring="
set "loop=0"
:re_replace2
set /a loop=loop+1
for /f "tokens=%loop% delims=*" %%a in ("%inputstring%") do if not "%%a"=="" (
	set "outputstring=%outputstring%.*%%a"
	goto re_replace2
)
set "filter=%outputstring:~0,-1%"
set "inputstring="
set "outputstring="
set "loop="
goto :EOF
:Module_GetOutputPath
goto Get_Output_Path
:SubNum
if "%subdir%"=="0" (
	for /f "tokens=*" %%a in ("%ifolder%") do (
		for /f "tokens=*" %%b in ("%~1") do (
			echo "%%~a"=="%%~dpb"
			if "%%~a"=="%%~dpb" (
				set "sub[%subnum%]=%~1"
				set /a subnum=subnum+1
			) else if "%%~a"=="%%~dpb\" (
				set "sub[%subnum%]=%~1"
				set /a subnum=subnum+1
			) else if "%%~a\"=="%%~dpb" (
				set "sub[%subnum%]=%~1"
				set /a subnum=subnum+1
			) else (
				goto :EOF
			)
		)
	)
) else (
	set "sub[%subnum%]=%~1"
	set /a subnum=subnum+1
)
goto :EOF
:SubNum_DVDSUB
for %%a in ("%~1") do if not exist "%%~dpna.sub" goto :EOF
call :SubNum "%~1"
goto :EOF
:FontNum
set "font[%fontnum%]=%~1"
set /a fontnum=fontnum+1
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
for /r "%ifolder%" %%a in ("*%filename%*.ass","*%filename%*.ssa","*%filename%*.srt","*%filename%*.sup") do call :SubNum "%%~a"
for /r "%ifolder%" %%a in ("*%filename%*.idx") do call :SubNum_DVDSUB "%%~a"
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
echo Add Subtitle^&Font to MKV [Ver. Unknown]
echo Copyright(c) 2018 By yyfll
echo.
echo ��ʾ����ҳ��(��ҳ��)����ʹ������ָ��:
echo Call "%~dpna0" -h
echo Call "%~dpna0" -help
echo Call "%~dpna0" /h
echo Call "%~dpna0" /?
echo.
echo ʹ�÷�����(CMD)��
echo   %~n0 "����·��" "���·��" "���ȼ�" "UI����" "NotDel����" "NotSub����" "SearchFilter����"
echo   (�����AddSubFontToMKV��ͬһ�ļ����������ʹ�ø�ָ��)
echo.
echo ʹ�÷�����(CMD):
echo   Call "%~dpn0" "����·��" "���·��" "���ȼ�" "UI����" "NotDel����" "NotSub����" "SearchFilter����"
echo   (���·�����ļ����к������š��ո���Ż�����Ӱ��CMD�ķ��ţ�����ʹ��Callָ���˫��������·��)
echo.	
echo ʹ�÷�����:
echo   ֱ����BAT�����ļ����ļ��У��Զ������ط�װ
echo.
echo ѡ��ȱʡ:
echo   [-] ʹ��"-"�ű�ʾ��ѡ���ȱ����ȱѡ�ʹ�ó���Ĭ��ֵ
echo     (�����ȱ����·�������ڳ�����ѯ��)
echo   ����: %~n0 - "D:\Video" - - - - "*.mp4"
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
echo   [0] ֵΪ0���޸�ֵ������ɾ��Դ�ļ�
echo   [1] ֵ��Ϊ0�����⸳ֵ����ɾ��Դ�ļ�
echo.
echo NotSub����:
echo   [0] ֵΪ0���޸�ֵ����û�������Ļ��Ƕ������
echo   [1] ֵ��Ϊ0�����⸳ֵ����û�������Ļʱ��ȻǶ������
echo.
echo SearchFilter�﷨��
echo   ����������ʹ�ñ�׼�ļ������﷨��������ʹ��ͨ���(*)�����磺
echo   "*.mkv"��ֻ���������ļ���׺��ΪMKV���ļ�
echo   "*SEFO*.*"�������������ļ����к���"SEFO"���ļ�(�����ִ�Сд)�Ҳ��ܺ�׺����ʲô
echo   "*VCB-S*Hi10*.mkv"�������ļ����к���"VCB-S"��"Hi10"("VCB-S"������"Hi10"֮ǰ)�ĺ�׺��ΪMKV���ļ�
exit