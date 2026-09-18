#include <stdio.h>
#include <assert.h>
#include "drivers/npu_hal.h"

int main(void) {
    printf("[FW] Initializing RISC-V Microkernel & NPU HAL...\n");
    npu_init();
    
    npu_load_weights(0x05, 0x0A);
    assert(npu_read_status() == 0x01);
    
    printf("[FW SUCCESS] Hardware Abstraction Layer & C Firmware Driver Verified!\n");
    return 0;
}
