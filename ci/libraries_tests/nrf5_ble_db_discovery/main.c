#include <stdint.h>
#include <stdbool.h>
#include "ble_db_discovery.h"

void ble_db_discovery_evt_handler(ble_db_discovery_evt_t *p_evt)
{
}

int main()
{
    ble_db_discovery_init(ble_db_discovery_evt_handler);
    return 0;
}