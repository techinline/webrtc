echo off
cd %TITAN_THIRD_PARTY%\webrtc\src
SET buildMode=%1
shift
echo %buildMode%
IF %buildMode%==release (
	gn gen out/release_x86 "--args=is_debug=false target_cpu=\"x86\" rtc_include_tests=false is_clang=false rtc_use_dummy_audio_file_devices=true"
	ninja -C out/release_x86 -j 16
)
IF %buildMode%==debug (
	gn gen out/debug_x86 "--args=is_debug=true target_cpu=\"x86\" rtc_include_tests=false is_clang=false rtc_use_dummy_audio_file_devices=true"
	ninja -C out/debug_x86 -j 16
)