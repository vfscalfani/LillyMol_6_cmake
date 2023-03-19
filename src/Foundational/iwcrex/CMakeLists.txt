project(iwcrex)

set(srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/iwgrep-2.5.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/_iwaray_grep25rx.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/_iwgrep25regex.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/grep-2.5.regex.c
)

add_library(iwcrex ${srcs})
