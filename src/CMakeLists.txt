find_package (Threads REQUIRED)

set (Boost_USE_STATIC_LIBS ON)
# set (Boost_NO_SYSTEM_PATHS ON)
#find_package (Boost 1.55.0 REQUIRED COMPONENTS date_time chrono filesystem system thread)
# we use the new version
find_package (Boost 1.71.0 REQUIRED COMPONENTS date_time chrono filesystem system thread)

include_directories (${Boost_INCLUDE_DIRS})

add_executable (blah main.cpp)

target_link_libraries (blah
  ${Boost_LIBRARIES}
  ${CMAKE_THREAD_LIBS_INIT})
