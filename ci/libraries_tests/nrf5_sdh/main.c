
#include "nrf_sdh.h"

void app_error_fault_handler(uint32_t id, uint32_t pc, uint32_t info)
{
}

int main()
{
    nrf_sdh_enable_request();
    return 0;
}