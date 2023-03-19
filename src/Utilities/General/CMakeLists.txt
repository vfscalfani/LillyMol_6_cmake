project(utilities)

# tcount
set(tcount_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/tcount.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/tokens_in_quoted_string.cc
)
set(tcount_libs
  cmdline
  iwstring_data_source
  iwre2
  iwstring
  ${IW_EXTRA_LIBS}
)
add_executable(tcount ${tcount_srcs})
target_link_libraries(tcount LINK_PUBLIC ${tcount_libs})


# average
set(average_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/average.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.h
)
set(average_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(average ${average_srcs})
target_link_libraries(average LINK_PUBLIC ${average_libs})


# concat_files
set(concat_files_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/concat_files.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(concat_files_libs
  accumulator
  cmdline
  iwmisc
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(concat_files ${concat_files_srcs})
target_link_libraries(concat_files LINK_PUBLIC ${concat_files_libs})


# dfilefilter
set(dfilefilter_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/dfilefilter.cc
)
set(dfilefilter_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwmisc
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(dfilefilter ${dfilefilter_srcs})
target_link_libraries(dfilefilter LINK_PUBLIC ${dfilefilter_libs})


# fetch_sdf_quick
set(fetch_sdf_quick_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/fetch_sdf_quick.cc
)
set(fetch_sdf_quick_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwmisc
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(fetch_sdf_quick ${fetch_sdf_quick_srcs})
target_link_libraries(fetch_sdf_quick LINK_PUBLIC ${fetch_sdf_quick_libs})


# fetch_smiles_quick
set(fetch_smiles_quick_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/fetch_smiles_quick.cc
)
set(fetch_smiles_quick_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(fetch_smiles_quick ${fetch_smiles_quick_srcs})
target_link_libraries(fetch_smiles_quick LINK_PUBLIC ${fetch_smiles_quick_libs})

# iwsplit
set(iwsplit_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/iwsplit.cc
)
set(iwsplit_libs
  accumulator
  cmdline_v2
  iwstring_data_source
  iwmisc
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(iwsplit ${iwsplit_srcs})
target_link_libraries(iwsplit LINK_PUBLIC ${iwsplit_libs})

# iwcut
set(iwcut_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/iwcut.cc
)
set(iwcut_libs
  accumulator
  cmdline
  iwmisc
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(iwcut ${iwcut_srcs})
target_link_libraries(iwcut LINK_PUBLIC ${iwcut_libs})

# normalise
set(normalise_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/normalise.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(normalise_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(normalise ${normalise_srcs})
target_link_libraries(normalise LINK_PUBLIC ${normalise_libs})

# random_records
set(random_records_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/random_records.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(random_records_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(random_records ${random_records_srcs})
target_link_libraries(random_records LINK_PUBLIC ${random_records_libs})

# unique_rows
set(unique_rows_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/unique_rows.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(unique_rows_libs
  accumulator
  cmdline_v2
  iwstring_data_source
  iwstring
  iwmisc
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(unique_rows ${unique_rows_srcs})
target_link_libraries(unique_rows LINK_PUBLIC ${unique_rows_libs})

# notenoughvariance
set(notenoughvariance_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/notenoughvariance.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(notenoughvariance_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwmisc
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(notenoughvariance ${notenoughvariance_srcs})
target_link_libraries(notenoughvariance LINK_PUBLIC ${notenoughvariance_libs})

# whatsmissing
set(whatsmissing_srcs
  ${CMAKE_CURRENT_SOURCE_DIR}/whatsmissing.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/iwtokeniser.cc
)
set(whatsmissing_libs
  accumulator
  cmdline
  iwstring_data_source
  iwstring
  iwmisc
  iwre2
  ${IW_EXTRA_LIBS}
)
add_executable(whatsmissing ${whatsmissing_srcs})
target_link_libraries(whatsmissing LINK_PUBLIC ${whatsmissing_libs})
