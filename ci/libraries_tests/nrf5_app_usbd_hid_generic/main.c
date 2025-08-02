#include "app_usbd_hid_generic.h"

int main()
{
    app_usbd_class_inst_t inst;
    hid_generic_clear_buffer(&inst);
    return 0;
}