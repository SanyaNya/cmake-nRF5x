#include "ble_racp.h"

int main()
{
    ble_racp_value_t value;
    uint8_t data[] = {0};
    ble_racp_encode(&value, data);
    return 0;
}