#include "ble_hrs.h"

int main()
{
    ble_hrs_t hrs;
    ble_hrs_init_t hrs_init;
    ble_hrs_init(&hrs, &hrs_init);
    return 0;
}