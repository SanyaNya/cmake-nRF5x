
#include "nrf_log.h"
#include "nrf_log_backend_uart.h"

int main()
{
    nrf_log_backend_uart_init();
    nrf_log_push("OK");
    return 0;
}