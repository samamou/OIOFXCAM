# openFrameworks
set(OF openFrameworks)
set(OF_ROOT "openframeworks" CACHE PATH "Path to the root folder of openFrameworks")
find_library(OF_LIBRARY "openFrameworks.lib")
find_package(GLUT REQUIRED)
find_package(OpenGL REQUIRED)

# Includes for openFrameworks
# Include source files of openFrameworks
set(OF_SOURCES
    "${OF_ROOT}/libs/openFrameworks/3d/of3dPrimitives.cpp"
    "${OF_ROOT}/libs/openFrameworks/3d/of3dUtils.cpp"
    "${OF_ROOT}/libs/openFrameworks/3d/ofCamera.cpp"
    "${OF_ROOT}/libs/openFrameworks/3d/ofEasyCam.cpp"
    "${OF_ROOT}/libs/openFrameworks/3d/ofNode.cpp"

    "${OF_ROOT}/libs/openFrameworks/app/ofAppNoWindow.cpp"
    "${OF_ROOT}/libs/openFrameworks/app/ofAppRunner.cpp"
    "${OF_ROOT}/libs/openFrameworks/app/ofAppGLFWWindow.cpp"
    "${OF_ROOT}/libs/openFrameworks/app/ofBaseApp.cpp"
    "${OF_ROOT}/libs/openFrameworks/app/ofMainLoop.cpp"

    "${OF_ROOT}/libs/openFrameworks/events/ofEvents.cpp"

    "${OF_ROOT}/libs/openFrameworks/gl/ofBufferObject.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofFbo.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofGLProgrammableRenderer.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofGLRenderer.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofGLUtils.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofLight.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofMaterial.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofShader.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofTexture.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofVbo.cpp"
    "${OF_ROOT}/libs/openFrameworks/gl/ofVboMesh.cpp"

    "${OF_ROOT}/libs/openFrameworks/graphics/of3dGraphics.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofBitmapFont.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofCairoRenderer.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofGraphics.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofGraphicsBaseTypes.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofImage.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofPath.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofPixels.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofRendererCollection.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofTessellator.cpp"
    "${OF_ROOT}/libs/openFrameworks/graphics/ofTrueTypeFont.cpp"

    "${OF_ROOT}/libs/openFrameworks/math/ofMath.cpp"
    "${OF_ROOT}/libs/openFrameworks/math/ofMatrix3x3.cpp"
    "${OF_ROOT}/libs/openFrameworks/math/ofMatrix4x4.cpp"
    "${OF_ROOT}/libs/openFrameworks/math/ofQuaternion.cpp"
    "${OF_ROOT}/libs/openFrameworks/math/ofVec2f.cpp"
    "${OF_ROOT}/libs/openFrameworks/math/ofVec4f.cpp"

    "${OF_ROOT}/libs/openFrameworks/types/ofBaseTypes.cpp"
    "${OF_ROOT}/libs/openFrameworks/types/ofColor.cpp"
    "${OF_ROOT}/libs/openFrameworks/types/ofParameter.cpp"
    "${OF_ROOT}/libs/openFrameworks/types/ofParameterGroup.cpp"
    "${OF_ROOT}/libs/openFrameworks/types/ofRectangle.cpp"

    "${OF_ROOT}/libs/openFrameworks/utils/ofFileUtils.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofFpsCounter.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofLog.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofMatrixStack.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofSystemUtils.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofThread.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofTimer.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofURLFileLoader.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofUtils.cpp"
    "${OF_ROOT}/libs/openFrameworks/utils/ofXml.cpp"
)

# Include correct video headers depending on system
list(APPEND OF_SOURCES
    "${OF_ROOT}/libs/openFrameworks/video/ofVideoGrabber.cpp"
    "${OF_ROOT}/libs/openFrameworks/video/ofVideoPlayer.cpp"
)
if(CMAKE_SYSTEM MATCHES Linux)
    list(APPEND OF_SOURCES
        "${OF_ROOT}/libs/openFrameworks/video/ofGstUtils.cpp"
        "${OF_ROOT}/libs/openFrameworks/video/ofGstVideoGrabber.cpp"
        "${OF_ROOT}/libs/openFrameworks/video/ofGstVideoPlayer.cpp"
    )
    SET(GCC_COVERAGE_COMPILE_FLAGS "`pkg-config --cflags --libs gstreamer-1.0`")
    add_definitions(${GCC_COVERAGE_COMPILE_FLAGS})
elseif(CMAKE_SYSTEM MATCHES Darwin)
    list(APPEND OF_SOURCES
        "${OF_ROOT}/libs/openFrameworks/video/ofAVFoundationPlayer.mm"
        "${OF_ROOT}/libs/openFrameworks/video/ofAVFoundationVideoPlayer.m"
        "${OF_ROOT}/libs/openFrameworks/video/ofAVFoundationGrabber.mm"
        "${OF_ROOT}/libs/openFrameworks/video/ofQTKitGrabber.mm"
        "${OF_ROOT}/libs/openFrameworks/video/ofQTKitMovieRenderer.m"
        "${OF_ROOT}/libs/openFrameworks/video/ofQTKitPlayer.mm"
    )
elseif(CMAKE_SYSTEM MATCHES Windows)
    list(APPEND OF_SOURCES
        "${OF_ROOT}/libs/openFrameworks/video/ofDirectShowGrabber.cpp"
        "${OF_ROOT}/libs/openFrameworks/video/ofDirectShowPlayer.cpp"
    )
endif()

#add_library(${OF} STATIC ${OF_SOURCES})
#target_link_libraries(${OF} PUBLIC ${OF_LIBRARY})

set(OF_INCLUDE_DIRS
    "${OF_ROOT}/libs/openFrameworks"
    "${OF_ROOT}/libs/openFrameworks/3d"
    "${OF_ROOT}/libs/openFrameworks/app"
    "${OF_ROOT}/libs/openFrameworks/communication"
    "${OF_ROOT}/libs/openFrameworks/events"
    "${OF_ROOT}/libs/openFrameworks/gl"
    "${OF_ROOT}/libs/openFrameworks/graphics"
    "${OF_ROOT}/libs/openFrameworks/math"
    "${OF_ROOT}/libs/openFrameworks/sound"
    "${OF_ROOT}/libs/openFrameworks/types"
    "${OF_ROOT}/libs/openFrameworks/utils"
    "${OF_ROOT}/libs/openFrameworks/video"
    "${OF_ROOT}/libs/glew/include"
    "${OF_ROOT}/libs/glut/include"
    "${OF_ROOT}/libs/glm/include"
    "${OF_ROOT}/libs/glfw/include"
    "${OF_ROOT}/libs/rtAudio/include"
    "${OF_ROOT}/libs/quicktime/include"
    "${OF_ROOT}/libs/freetype/include"
    "${OF_ROOT}/libs/freetype/include/freetype2"
    "${OF_ROOT}/libs/freeImage/include"
    "${OF_ROOT}/libs/fmod/include"
    "${OF_ROOT}/libs/videoInput/include"
    "${OF_ROOT}/libs/tess2/include"
    "${OF_ROOT}/libs/cairo/include"
    "${OF_ROOT}/libs/cairo/include/cairo"
    "${OF_ROOT}/libs/poco/include"
    "${OF_ROOT}/libs/openssl/include"
    "${OF_ROOT}/libs/utf8/include"
    "${OF_ROOT}/libs/boost/include"
    "${OF_ROOT}/libs/json/include"
    "${OF_ROOT}/libs/curl/include"
    "${OF_ROOT}/libs/uriparser/include"
    "${OF_ROOT}/libs/pugixml/include"
    "${OF_ROOT}/addons"
)

#target_include_directories(${OF} PUBLIC ${OF_INCLUDE_DIRS})

if (CMAKE_SYSTEM MATCHES Windows)
    file(GLOB_RECURSE OF_LIBS
        "${OF_ROOT}/libs/boost/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/cairo/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/curl/lib/vs/x64/libcurl-d.lib"
        "${OF_ROOT}/libs/curl/lib/vs/x64/libcurl-d_imp.lib"
        "${OF_ROOT}/libs/fmod/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/FreeImage/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/freetype/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/glew/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/glfw/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/libusb/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/openssl/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/pugixml/lib/vs/x64/pugixmld.lib"
        "${OF_ROOT}/libs/rtAudio/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/tess2/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/uriparser/lib/vs/x64/*.lib"
        "${OF_ROOT}/libs/videoInput/lib/vs/x64/videoInputd.lib"
    )
    #target_link_libraries(${OF} PUBLIC ${OF_LIBS})
    list(APPEND OF_LIBS
        winmm.lib
    )
elseif (CMAKE_SYSTEM MATCHES Linux)
endif()

list(APPEND OF_LIBS
    ${OPENGL_LIBRARIES}
    ${GLUT_LIBRARIES}
    ${OF_LIBRARY}
)
add_definitions(-DCURL_STATICLIB)
add_definitions(-DUNICODE)
