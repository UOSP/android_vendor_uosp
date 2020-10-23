# Kernel
include vendor/uosp/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/uosp/config/BoardConfigQcom.mk
endif

# Soong
include vendor/uosp/config/BoardConfigSoong.mk
