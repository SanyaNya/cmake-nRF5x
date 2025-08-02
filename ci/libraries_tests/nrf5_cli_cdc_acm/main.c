#include <stdbool.h>
#include "nrf_cli_cdc_acm.h"

NRF_CLI_CDC_ACM_DEF(hello);

int main()
{
    hello.p_cb->p_context = NULL;
    return 0;
}