echo off
cd %TITAN_THIRD_PARTY%\webrtc\src
SET buildMode=%1
shift
echo %buildMode%
IF %buildMode%==debug (
	gn gen out/release_x86 "--args=is_debug=false target_cpu=\"x86\" is_component_build=true rtc_include_tests=false"
	ninja -C out/release_x86 -j 16
)
IF %buildMode%==release (
	gn gen out/debug_x86 "--args=is_debug=true target_cpu=\"x86\" is_component_build=true rtc_include_tests=false"
	ninja -C out/debug_x86 -j 16
)