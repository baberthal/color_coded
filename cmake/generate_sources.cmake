message(STATUS "Generating sources...")

set(COLOR_CODED_ENV_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include/env)
set(ENV_IMPL_TARGET ${COLOR_CODED_ENV_INCLUDE_DIR}/impl.hpp)

message(STATUS "  Directory: ${COLOR_CODED_ENV_INCLUDE_DIR}")
message(STATUS "  Target: ${ENV_IMPL_TARGET}")

# Create directories if they don't exist
file(MAKE_DIRECTORY ${COLOR_CODED_ENV_INCLUDE_DIR})

# Remove the impl.hpp to create a fresh one, since the PWD changes.
if(EXISTS ${ENV_IMPL_TARGET})
  file(REMOVE ${ENV_IMPL_TARGET})
endif()

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/env_impl.hpp.cmake
  ${ENV_IMPL_TARGET}
)

# execute_process(
#   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/generate_sources ${LLVM_ROOT_DIR} ${CLANG_VERSION}
#   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
# )
