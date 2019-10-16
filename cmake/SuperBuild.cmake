include (ExternalProject)

set_property (DIRECTORY PROPERTY EP_BASE Dependencies)

# We are just creating 2 blank CMake variables so that they can be created as lists and appended to later.
set (DEPENDENCIES)
set (EXTRA_CMAKE_ARGS)

# Use static linking to avoid issues with system-wide installations of Boost (this is the original library compile option from days of yore).
# i am not including "iostreams" as it requires bzip2 "Julian Seward" and the website for it is currently not working
list (APPEND DEPENDENCIES ep_boost)

# boost 1.71.0 download link
# https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2
# and its hash
# d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee

ExternalProject_Add (ep_boost
  # URL http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
  # URL_MD5 d6eef4b4cacb2183f2bf265a5a03a354
  URL https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2
  # URL_MD5 d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee
  # I got the hash below from simply copying it from the terminal since I could not find it elsewhere.
  URL_MD5 4cdf9b5c2dc01fb2b7b733d5af30e558
  CONFIGURE_COMMAND ./bootstrap.sh --with-libraries=atomic,date_time,filesystem,program_options,system,thread,chrono,context,coroutine,exception,graph,graph_parallel,locale,log,math,mpi,random,python,regex,serialization,signals,test,timer,wave
  BUILD_COMMAND ./b2 link=static
  BUILD_IN_SOURCE 1
  INSTALL_COMMAND ""
  )

list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${CMAKE_CURRENT_BINARY_DIR}/Dependencies/Source/ep_boost
  -DBoost_NO_SYSTEM_PATHS=ON)

# FIXME add to default target "all"?
ExternalProject_Add (ep_blah
  DEPENDS ${DEPENDENCIES}
  SOURCE_DIR ${PROJECT_SOURCE_DIR}
  CMAKE_ARGS -DUSE_SUPERBUILD=OFF ${EXTRA_CMAKE_ARGS}
  INSTALL_COMMAND ""
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/blah)
