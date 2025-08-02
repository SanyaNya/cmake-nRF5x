#include <stdint.h>
#include <stdbool.h>
#include "gatt_cache_manager.h"
#include "gatts_cache_manager.h"

int main()
{
    gcm_init();
    gscm_init();
    return 0;
}