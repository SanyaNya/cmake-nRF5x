#include "app_usbd_msc.h"

int main()
{
    app_usbd_msc_t msc;
    app_usbd_msc_sync(&msc);
    return 0;
}