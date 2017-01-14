#
# Build PxTask
#

SET(GW_DEPS_ROOT $ENV{GW_DEPS_ROOT})

SET(PXSHARED_SOURCE_DIR ${PROJECT_SOURCE_DIR}/../../../../src)

SET(LL_SOURCE_DIR ${PXSHARED_SOURCE_DIR}/task)

SET(PXTASK_COMPILE_DEFS 
	${PXSHARED_Android_COMPILE_DEFS};PX_FOUNDATION_DLL=0;
)

if(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL "debug")
	LIST(APPEND PXTASK_COMPILE_DEFS
		${PXSHARED_ANDROID_DEBUG_COMPILE_DEFS}
	)
elseif(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL "checked")
	LIST(APPEND PXTASK_COMPILE_DEFS
		${PXSHARED_ANDROID_CHECKED_COMPILE_DEFS}
	)
elseif(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL "profile")
	LIST(APPEND PXTASK_COMPILE_DEFS
		${PXSHARED_ANDROID_PROFILE_COMPILE_DEFS}
	)
elseif(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL release)
	LIST(APPEND PXTASK_COMPILE_DEFS
		${PXSHARED_ANDROID_RELEASE_COMPILE_DEFS}
	)
else(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL "debug")
	MESSAGE(FATAL_ERROR "Unknown configuration ${CMAKE_BUILD_TYPE}")
endif(${CMAKE_BUILD_TYPE_LOWERCASE} STREQUAL "debug")

# include PxTask common
INCLUDE(../common/PxTask.cmake)

# enable -fPIC so we can link static libs with the editor
SET_TARGET_PROPERTIES(PxTask PROPERTIES POSITION_INDEPENDENT_CODE TRUE)