#include "app_usbd_hid_mouse.h"

int main()
{
    app_usbd_hid_mouse_t mouse;
    app_usbd_hid_mouse_y_move(&mouse, 0);
    return 0;
}