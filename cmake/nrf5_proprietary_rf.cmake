# MIT License

# Copyright (c) 2020 Polidea

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# WARNING: FILE GENERATED FROM ./ci/scripts/generate_cmake.sh SCRIPT.

# Enhanced ShockBurst (ESB)
add_library(nrf5_esb STATIC EXCLUDE_FROM_ALL
  "${NRF5_SDK_PATH}/components/proprietary_rf/esb/nrf_esb.c"
)
target_include_directories(nrf5_esb PUBLIC
  "${NRF5_SDK_PATH}/components/proprietary_rf/esb"
)
target_link_libraries(nrf5_esb PUBLIC
  nrf5_app_error
  nrf5_app_util_platform
  nrf5_assert
  nrf5_atomic
  nrf5_balloc
  nrf5_boards
  nrf5_drv_uart
  nrf5_ext_fprintf
  nrf5_ext_segger_rtt
  nrf5_log
  nrf5_log_backend_rtt
  nrf5_log_backend_serial
  nrf5_log_backend_uart
  nrf5_log_default_backends
  nrf5_memobj
  nrf5_nrfx_prs
  nrf5_nrfx_soc
  nrf5_nrfx_uart
  nrf5_nrfx_uarte
  nrf5_ringbuf
  nrf5_strerror
)
target_compile_options(nrf5_esb PUBLIC
  "$<$<OR:$<COMPILE_LANGUAGE:CXX>,$<COMPILE_LANGUAGE:C>>:-DESB_PRESENT>"
)
target_compile_options(nrf5_esb PUBLIC
  "$<$<COMPILE_LANGUAGE:ASM>:-DESB_PRESENT>"
)
list(APPEND NRF5_LIBRARY_NRF5_ESB_DEPENDENCIES
  nrf5_app_error
  nrf5_app_scheduler
  nrf5_app_util_platform
  nrf5_assert
  nrf5_atfifo
  nrf5_atomic
  nrf5_balloc
  nrf5_balloc_fwd
  nrf5_boards
  nrf5_cli
  nrf5_cli_fwd
  nrf5_config
  nrf5_crc16
  nrf5_delay
  nrf5_drv_uart
  nrf5_esb
  nrf5_ext_fprintf
  nrf5_ext_segger_rtt
  nrf5_fds
  nrf5_fstorage
  nrf5_log
  nrf5_log_backend_rtt
  nrf5_log_backend_serial
  nrf5_log_backend_uart
  nrf5_log_default_backends
  nrf5_log_fwd
  nrf5_mdk
  nrf5_memobj
  nrf5_memobj_fwd
  nrf5_mtx
  nrf5_nrfx_common
  nrf5_nrfx_hal
  nrf5_nrfx_prs
  nrf5_nrfx_soc
  nrf5_nrfx_uart
  nrf5_nrfx_uarte
  nrf5_pwr_mgmt
  nrf5_queue
  nrf5_ringbuf
  nrf5_sdh
  nrf5_section
  nrf5_soc
  nrf5_strerror
)
