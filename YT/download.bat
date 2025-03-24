@echo off

title YouTube Downloader

:: Make sure the script runs in its own directory so downloads go there:

cd /D "%~dp0"
 
:START

cls

echo -----------------------------------------

echo  Jaiden's YouTube Downloader (using yt-dlp and ffmpeg)

echo -----------------------------------------

echo Please enter the YouTube URL (or type EXIT to quit):

set /p VIDEO_URL=

if /I "%VIDEO_URL%"=="EXIT" (

    echo Exiting script...

    timeout /t 2 >nul

    exit /B 0

)
 
if "%VIDEO_URL%"=="" (

    echo URL cannot be empty. Press any key to try again...

    pause >nul

    goto START

)
 
:FORMAT

cls

echo -----------------------------------------

echo   Choose a format:

echo -----------------------------------------

echo 1) mp3 (Audio only)

echo 2) mp4 (Video)

echo -----------------------------------------

set /p CHOICE=Enter your choice (1 or 2):
 
if "%CHOICE%"=="1" (

    set "FILE_FORMAT=mp3"

) else if "%CHOICE%"=="2" (

    set "FILE_FORMAT=mp4"

) else (

    echo Invalid choice. Press any key to try again...

    pause >nul

    goto FORMAT

)
 
cls

echo Starting download in ^"%FILE_FORMAT%^" format...

echo -----------------------------------------

if /I "%FILE_FORMAT%"=="mp3" (

    yt-dlp.exe -x --audio-format mp3 --retries infinite --fragment-retries infinite --socket-timeout 30 "%VIDEO_URL%"

) else if /I "%FILE_FORMAT%"=="mp4" (

    yt-dlp.exe -f mp4 --retries infinite --fragment-retries infinite --socket-timeout 30 "%VIDEO_URL%"

)
 
echo -----------------------------------------

echo Download complete! The file is saved here:

echo %~dp0

echo -----------------------------------------

echo Press any button to close this window, to download another video, reopen the shortcut

pause >nul
 