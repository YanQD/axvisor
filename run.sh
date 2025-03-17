type=$1

if [ "$type" = "memory" ]; then
    make ARCH=aarch64 VM_CONFIGS=tmp/arceos-aarch64.toml:tmp/linux-qemu-aarch64-vm2.toml LOG=debug BUS=mmio NET=y FEATURES=page-alloc-64g MEM=8g SECOND_SERIAL=y SMP=2 run
elif [ "$type" = "fs" ]; then
    make A=$(pwd) LOG=debug ARCH=aarch64 BLK=y VM_CONFIGS=configs/vms/nimbos-aarch64_0.toml:configs/vms/nimbos-aarch64_1.toml FEATURES=page-alloc-64g,hv,irq MEM=8g  APP_FEATURES=fs FEATURES=ext4fs SMP=2 SECOND_SERIAL=y run
else
    echo "Invalid type"
fi

