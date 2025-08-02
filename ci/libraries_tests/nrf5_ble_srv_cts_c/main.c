#include "ble_cts_c.h"

int main()
{
    ble_cts_c_t cts;
    ble_cts_c_init_t cts_init;
    ble_cts_c_init(&cts, &cts_init);
    return 0;
}