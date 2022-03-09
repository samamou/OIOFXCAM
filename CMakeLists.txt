cmake_minimum_required(VERSION 3.11)

project(Assignment03_Team14)

include(ExternalProject)

set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/dist CACHE PATH ${CMAKE_SOURCE_DIR}/dist FORCE)
set(CMAKE_BUILD_TYPE "Debug")
if(MSVC OR XCODE)
    set(CMAKE_CONFIGURATION_TYPES "Debug" CACHE STRING "Debug" FORCE)
endif()
set(CMAKE_CXX_STANDARD 11)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(OpenGL REQUIRED COMPONENTS OpenGL)
include(BuildGLEW)
include(BuildGLFW)
include(BuildGLM)

set(EXEC Assignment03)
file(GLOB SRC src/*.cpp)
add_executable(${EXEC} ${SRC})
target_include_directories(${EXEC} PUBLIC include)
target_link_libraries(${EXEC} PUBLIC OpenGL::GL glew_s glfw glm)

find_package(OpenISS REQUIRED)
find_package(OpenFrameworks REQUIRED)

target_link_libraries(${EXEC} PUBLIC 
    ${OPENISS_LIBRARIES}
    ${OF_LIBS}
    
)
target_include_directories(${EXEC} PUBLIC 
    ${OPENISS_INCLUDE_DIRS}
    ${OPENISS_INCLUDE_DIRS}/adapters
    ${OF_INCLUDE_DIRS}
)

list(APPEND BIN ${EXEC})

set(ASSETS assets)

install(TARGETS ${BIN} DESTINATION ${CMAKE_INSTALL_PREFIX})
install(DIRECTORY ${ASSETS} DESTINATION ${CMAKE_INSTALL_PREFIX})

if (CMAKE_SYSTEM MATCHES Windows)
    install(FILES "${OF_ROOT}/libs/FreeImage/lib/vs/x64/FreeImage.dll" DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES "${OF_ROOT}/libs/curl/lib/vs/x64/libcurl-d.dll" DESTINATION ${CMAKE_INSTALL_PREFIX})
    install(FILES "${OF_ROOT}/libs/fmod/lib/vs/x64/fmod.dll" DESTINATION ${CMAKE_INSTALL_PREFIX})
endif()