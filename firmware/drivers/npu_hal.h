#ifndef NPU_HAL_H
#define NPU_HAL_H

#include <stdint.h>

#define NPU_BASE_ADDR   0x80000000
#define NPU_REG_CTRL    (*(volatile uint32_t *)(NPU_BASE_ADDR + 0x00))
#define NPU_REG_STATUS  (*(volatile uint32_t *)(NPU_BASE_ADDR + 0x04))
#define NPU_REG_DATA_A  (*(volatile uint32_t *)(NPU_BASE_ADDR + 0x08))
#define NPU_REG_DATA_B  (*(volatile uint32_t *)(NPU_BASE_ADDR + 0x0C))

void npu_init(void);
void npu_load_weights(uint8_t a, uint8_t b);
uint32_t npu_read_status(void);

#endif
