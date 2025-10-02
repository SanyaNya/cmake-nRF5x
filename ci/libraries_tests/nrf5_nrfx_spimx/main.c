#include "nrfx_spimx.h"

void nrfx_spimx_evt_handler(nrfx_spimx_evt_t const *p_event, void *p_context)
{
}

int main()
{
    nrfx_spimx_t spim;
    nrfx_spimx_config_t config;
    nrfx_spimx_init(&spim, &config, nrfx_spim_evt_handler, NULL);
    return 0;
}
