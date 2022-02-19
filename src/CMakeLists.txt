add_library(RVCommon INTERFACE)
add_library(RVCommon::RVCommon ALIAS RVCommon)

target_include_directories(RVCommon INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
