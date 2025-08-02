#include "bsp.h"

void bsp_event_callback(bsp_event_t event)
{
}

int main()
{
    bsp_init(0, bsp_event_callback);
    return 0;
}