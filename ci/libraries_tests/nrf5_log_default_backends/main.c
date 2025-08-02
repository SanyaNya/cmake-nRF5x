
#include "nrf_log.h"
#include "nrf_log_default_backends.h"

int main()
{
    nrf_log_default_backends_init();
    nrf_log_push("OK");
    return 0;
}