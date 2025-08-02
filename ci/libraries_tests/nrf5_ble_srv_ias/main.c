#include "ble_ias.h"

int main()
{
    ble_ias_t ias;
    ble_ias_init_t ias_init;
    ble_ias_init(&ias, &ias_init);
    return 0;
}