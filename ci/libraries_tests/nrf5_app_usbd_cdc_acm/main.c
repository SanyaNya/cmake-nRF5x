#include "app_usbd_cdc_acm.h"

int main()
{
    app_usbd_cdc_acm_t dc_acm;
    char buffer[] = {0};
    app_usbd_cdc_acm_write(&dc_acm, buffer, sizeof(buffer));
    return 0;
}