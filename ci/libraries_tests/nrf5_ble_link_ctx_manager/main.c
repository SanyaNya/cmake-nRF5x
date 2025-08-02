#include <stdint.h>
#include <stdbool.h>
#include "ble_link_ctx_manager.h"

int main()
{
    blcm_link_ctx_storage_t context;
    blcm_link_ctx_get(&context, 0, 0);
    return 0;
}