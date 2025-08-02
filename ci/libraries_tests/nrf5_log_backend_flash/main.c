
#include "nrf_log.h"
#include "nrf_log_backend_flash.h"

int main()
{
    nrf_fstorage_api_t api;
    nrf_log_backend_flash_init(&api);
    nrf_log_push("OK");
    return 0;
}
