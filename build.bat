cd %TITAN_THIRD_PARTY%\webrtc\src
SET buildMode=%1
shift
echo %buildMode%
gn gen out/release_x86 "--args=is_debug=%buildMode% target_cpu=\"x86\" rtc_include_tests=false"
ninja -C out/release_x86 -j 16