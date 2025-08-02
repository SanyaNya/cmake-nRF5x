#include "ancs_app_attr_get.h"
#include "ancs_attr_parser.h"
#include "nrf_ble_ancs_c.h"

int main()
{
    ancs_c_app_attr_request(NULL, NULL, 0);
    ancs_parse_get_attrs_response(NULL, NULL, 0);
    ble_ancs_c_init(NULL, NULL);
    return 0;
}