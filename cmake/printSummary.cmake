# output chosen build options
macro( OptionOutput _outputstring )
    if( ${ARGN} )
        set( _var "YES" )
    else( ${ARGN} )
        set( _var "NO" )
    endif( ${ARGN} )
    message( STATUS "${_outputstring}${_var}" )
endmacro( OptionOutput _outputstring )

function(printList items)
    foreach (item ${items})
        message("\t ${item}")
    endforeach()
endfunction()

get_property(COMPILER_OPTIONS     DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTY COMPILE_OPTIONS)

message( STATUS "Install prefix:    ${CMAKE_INSTALL_PREFIX}")
message( STATUS "------------------------------------------------------------------" )
message( STATUS "CMake Generator:   ${CMAKE_GENERATOR}" )
message( STATUS "CMAKE_BUILD_TYPE:  ${CMAKE_BUILD_TYPE}" )
message( STATUS "Compiler info: ${CMAKE_CXX_COMPILER_ID} (${CMAKE_CXX_COMPILER}) ; version: ${CMAKE_CXX_COMPILER_VERSION}")
message( STATUS " --- Compiler flags --- ")
message( STATUS "General:           ${CMAKE_CXX_FLAGS}" )
printList("${COMPILER_OPTIONS}")
message( STATUS "Extra:             ${EXTRA_COMPILE_FLAGS}" )
message( STATUS "Debug:             ${CMAKE_CXX_FLAGS_DEBUG}" )
message( STATUS "Release:           ${CMAKE_CXX_FLAGS_RELEASE}" )
message( STATUS "RelWithDebInfo:    ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}" )
message( STATUS "MinSizeRel:        ${CMAKE_CXX_FLAGS_MINSIZEREL}" )
message( STATUS " --- Linker flags --- ")
message( STATUS "General:           ${CMAKE_EXE_LINKER_FLAGS}" )
message( STATUS "Debug:             ${CMAKE_EXE_LINKER_FLAGS_DEBUG}" )
message( STATUS "Release:           ${CMAKE_EXE_LINKER_FLAGS_RELEASE}" )
message( STATUS "RelWithDebInfo:    ${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO}" )
message( STATUS "MinSizeRel:        ${CMAKE_EXE_LINKER_FLAGS_MINSIZEREL}" )
message( STATUS "" )
message( STATUS "Compiler Options")
OptionOutput( "Warnings as errors:                 " EXIV2_WARNINGS_AS_ERRORS        )
OptionOutput( "Use extra compiler warning flags:   " EXIV2_EXTRA_WARNINGS            )
message( STATUS "" )

message( STATUS "------------------------------------------------------------------" )
OptionOutput( "Building shared library:            " BUILD_SHARED_LIBS               )
OptionOutput( "Building PNG support:               " EXIV2_ENABLE_PNG AND ZLIB_FOUND )
if    ( EXIV2_ENABLE_EXTERNAL_XMP )
    OptionOutput( "XMP metadata support (EXTERNAL):    " EXIV2_ENABLE_EXTERNAL_XMP   )
else()
    OptionOutput( "XMP metadata support:               " EXIV2_ENABLE_XMP            )
endif()
OptionOutput( "Native language support:            " EXIV2_ENABLE_NLS                )
OptionOutput( "Conversion of Windows XP tags:      " EXIV2_ENABLE_PRINTUCS2          )
OptionOutput( "Nikon lens database:                " EXIV2_ENABLE_LENSDATA           )
OptionOutput( "Building webready support:          " EXIV2_ENABLE_WEBREADY           )
if    ( EXIV2_ENABLE_WEBREADY )
    OptionOutput( "USE Libcurl for HttpIo:             " EXIV2_ENABLE_CURL           )
endif ( EXIV2_ENABLE_WEBREADY )

if (WIN32)
    OptionOutput( "Dynamic runtime override:           " EXIV2_ENABLE_DYNAMIC_RUNTIME)
    OptionOutput( "Unicode paths (wstring):            " EXIV2_ENABLE_WIN_UNICODE    )
endif()
OptionOutput( "Building exiv2 command:             " EXIV2_BUILD_EXIV2_COMMAND       )
OptionOutput( "Building samples:                   " EXIV2_BUILD_SAMPLES             )
OptionOutput( "Building unit tests:                " EXIV2_BUILD_UNIT_TESTS          )
OptionOutput( "Building fuzz tests:                " EXIV2_BUILD_FUZZ_TESTS          )
OptionOutput( "Building doc:                       " EXIV2_BUILD_DOC                 )
OptionOutput( "Building with boost::regex          " EXV_NEED_BOOST_REGEX            )
OptionOutput( "Building with coverage flags:       " BUILD_WITH_COVERAGE             )
OptionOutput( "Using ccache:                       " BUILD_WITH_CCACHE               )


message( STATUS "------------------------------------------------------------------" )
