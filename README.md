python3 -c '
readme = """# Enterprise Multi-Core RISC-V SoC & Neural Accelerator

## System Architecture

```text
                               +----------------------------------------+
                               |    Host Machine / Control Software     |
                               |  (PyTorch Models / C++ Compiler Engine)|
                               +-------------------+--------------------+
                                                   |
                                     PCIe / AXI4 Full Interconnect
                                                   |
+--------------------------------------------------v--------------------------------------------------+
|                                    RISC-V Multiprocessor System-on-Chip                             |
|                                                                                                     |
|  +-----------------------+     +-----------------------+     +-----------------------------------+  |
|  |   RISC-V Core 0       |     |   RISC-V Core 1       |     |   Vector Neural Processing Unit   |  |
|  | (RV32IM / 5-Stage)   |     | (RV32IM / 5-Stage)   |     |   (2D Matrix Engine / INT8 Tensor)    |  |
|  +-----------+-----------+     +-----------+-----------+     +-----------------+-----------------+  |
|              |                             |                                   |                    |
|              +-----------------------------+-----------------------------------+                    |
|                                            |                                                        |
|                                  AXI4 Crossbar Switch                                               |
|                                            |                                                        |
|  +-----------------------+     +-----------+-----------+     +-----------------------------------+  |
|  | Synchronous FIFO      |     |  UART / SPI Subsystem |     |  SRAM Memory Controller           |  |
|  | Bridge (DMA Controller|     |  (Peripheral Bus)     |     |  (Shared L2 Cache Layer)          |  |
|  +-----------------------+     +-----------------------+     +-----------------------------------+  |
+-----------------------------------------------------------------------------------------------------+
