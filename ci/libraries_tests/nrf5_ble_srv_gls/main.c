#include "ble_gls.h"

int main()
{
    ble_gls_t gls;
    ble_gls_init_t gls_init;
    ble_gls_init(&gls, &gls_init);
    return 0;
}