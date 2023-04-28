# This is the default variant when you `make` the rt-smart port.
# 设置编译工具链，可以使用绝对路径
CROSS_COMPILE = riscv64-unknown-linux-musl-

# 使用arm平台时, -mcmodel=medany参数要删除
CFLAGS += -Wall -O0 -g -mcmodel=medany

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
LD_FILES = $(dir $(mkfile_path))/../../link.lds
LDFLAGS += -static -T ${LD_FILES}

# 引用libffi库
# INC += -I/home/ubuntu/work/k230/rtt_base/build/libffi-3.3/include
# LDFLAGS += -L/home/ubuntu/work/k230/rtt_base/build/libffi-3.3/lib

FROZEN_MANIFEST ?= $(VARIANT_DIR)/manifest.py
