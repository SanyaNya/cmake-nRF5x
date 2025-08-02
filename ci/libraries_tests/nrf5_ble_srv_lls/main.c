#include "ble_lls.h"

int main()
{
    ble_lls_t lls;
    ble_lls_init_t lls_init;
    ble_lls_init(&lls, &lls_init);
    return 0;
}