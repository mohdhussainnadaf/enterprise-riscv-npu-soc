#include "npu_hal.h"

static uint32_t mock_ctrl = 0;
static uint32_t mock_data_a = 0;
static uint32_t mock_data_b = 0;

void npu_init(void) {
    mock_ctrl = 0x01; // Enable NPU core
}

void npu_load_weights(uint8_t a, uint8_t b) {
    mock_data_a = a;
    mock_data_b = b;
}

uint32_t npu_read_status(void) {
    return mock_ctrl;
}
