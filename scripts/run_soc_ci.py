import subprocess
import os
import sys

def run_pipeline():
    print("="*60)
    print("      ENTERPRISE RISC-V SoC & NPU ACCELERATOR CI PIPELINE      ")
    print("="*60)
    
    # 1. CPU Simulation
    print("\n[1/3] Running RISC-V RV32 CPU Execution Core Tests...")
    cmd1 = "iverilog -g2012 -o sim_build/cpu_sim.out rtl/cpu/rv32_pkg.sv rtl/cpu/rv32_alu.sv tb/tb_cpu_core.sv && vvp sim_build/cpu_sim.out"
    if subprocess.run(cmd1, shell=True).returncode != 0:
        sys.exit(1)

    # 2. NPU Simulation
    print("\n[2/3] Running 4x4 Systolic Array NPU Acceleration Tests...")
    cmd2 = "iverilog -g2012 -o sim_build/npu_sim.out rtl/npu/npu_pe.sv rtl/npu/systolic_array.sv tb/tb_npu_array.sv && vvp sim_build/npu_sim.out"
    if subprocess.run(cmd2, shell=True).returncode != 0:
        sys.exit(1)

    # 3. C Firmware Test
    print("\n[3/3] Running Embedded Firmware Driver & Microkernel Suite...")
    cmd3 = "gcc -Ifirmware -Ifirmware/drivers firmware/drivers/npu_hal.c firmware/main.c -o sim_build/firmware_runner && ./sim_build/firmware_runner"
    if subprocess.run(cmd3, shell=True).returncode != 0:
        sys.exit(1)

    print("\n" + "="*60)
    print("---> SUCCESS: ALL SOC HARDWARE, FIRMWARE & NPU PIPELINES PASSED!")
    print("="*60)

if __name__ == "__main__":
    run_pipeline()
