#include <stdint.h>
#include <stdbool.h>
#include "peer_data_storage.h"

int main()
{
    pm_peer_id_t id = 0;
    pds_peer_id_free(id);
    return 0;
}