#include "nrf_esb.h"

void nrf_esb_event_handler(nrf_esb_evt_t const * p_event)
{
}

int main()
{
  uint8_t base_addr_0[4] = {0xE7, 0xE7, 0xE7, 0xE7};
  uint8_t base_addr_1[4] = {0xC2, 0xC2, 0xC2, 0xC2};
  uint8_t addr_prefix[8] = {0xE7, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8 };
  nrf_esb_config_t nrf_esb_config         = NRF_ESB_DEFAULT_CONFIG;
  nrf_esb_config.payload_length           = 8;
  nrf_esb_config.protocol                 = NRF_ESB_PROTOCOL_ESB_DPL;
  nrf_esb_config.bitrate                  = NRF_ESB_BITRATE_2MBPS;
  nrf_esb_config.mode                     = NRF_ESB_MODE_PRX;
  nrf_esb_config.event_handler            = nrf_esb_event_handler;
  nrf_esb_config.selective_auto_ack       = false;

  nrf_esb_init(&nrf_esb_config);
}
