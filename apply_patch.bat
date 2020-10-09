echo off
SET WEBRTC=%1
set PATCH_DIR=%CD%
echo "Webrtc root"%WEBRTC%
echo "Patch folder:"%PATCH_DIR%

pushd %WEBRTC%\src\
cd build
echo %CD%
git.exe --work-tree %WEBRTC%\src\build apply %PATCH_DIR%/build.patch
cd ..\
echo %CD%
git.exe --work-tree %CD% apply %PATCH_DIR%/webrtc.patch

:end
popd

