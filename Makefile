# Makefile

NAME := test
SOURCES_C := $(wildcard drivers/*.c) $(wildcard src/*.c)
SOURCES_ASM := $(wildcard gcc/*.S)
OBJECTS := $(SOURCES_ASM:.S=.o) $(SOURCES_C:.c=.o)

# TSSOP 16: CPU_MKE04Z8VTG4
# SOIC 20:  CPU_MKE04Z8VWJ4
# CQFN 24:  CPU_MKE04Z8VFK4
CPU := CPU_MKE04Z8VFK4

CC := arm-none-eabi-gcc
AS := arm-none-eabi-gcc

INCLUDE := -Iarm -Iconfig -Idrivers

ASFLAGS := -D__STARTUP_CLEAR_BSS \
           -Wall \
           -fno-common \
           -ffunction-sections \
           -fdata-sections \
           -ffreestanding \
           -fno-builtin \
           -mthumb \
           -mapcs \
           -std=gnu99 \
           -mcpu=cortex-m0plus \
           -mfloat-abi=soft \
           --specs=nano.specs \
           --specs=nosys.specs

# Release
ASFLAGS := -O3  -O3  -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -DPRINTF_FLOAT_ENABLE=0 -DSCANF_FLOAT_ENABLE=0 -DPRINTF_ADVANCED_ENABLE=0 -DSCANF_ADVANCED_ENABLE=0 -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP

# Release 2
ASFLAGS := -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP

# Debug
ASFLAGS := -O0  -g -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP

CFLAGS := -Wall \
          -Wextra \
          -Os \
          -mcpu=cortex-m0plus \
          -mthumb \
          -mapcs \
          -fmessage-length=0 \
          -fsigned-char \
          -fno-common \
          -ffunction-sections \
          -fdata-sections \
          -ffreestanding \
          -fno-builtin \
          -g3 -DFRDM_KE04 \
          -DCPU_KE04 \
          -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -DPRINTF_FLOAT_ENABLE=0 -DSCANF_FLOAT_ENABLE=0 -DPRINTF_ADVANCED_ENABLE=0 -DSCANF_ADVANCED_ENABLE=0 \
          -D$(CPU) \
          -std=gnu11

# Release
CFLAGS := -O3  -O3  -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -DPRINTF_FLOAT_ENABLE=0 -DSCANF_FLOAT_ENABLE=0 -DPRINTF_ADVANCED_ENABLE=0 -DSCANF_ADVANCED_ENABLE=0 -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP 

# Release 2
CFLAGS :=  -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP

# Debug
CFLAGS :=  -O0 -g  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP


LDFLAGS := -Xlinker -Map="test.map" \
           -Xlinker -static \
           -Xlinker -z \
           -Xlinker muldefs \
           -Xlinker --gc-sections \
           -Xlinker -print-memory-usage \
           -Xlinker --sort-section=alignment \
           -mthumb \
           -mcpu=cortex-m0plus \
           -mfloat-abi=soft \
           -T test_Debug.ld \
           -static -nostdlib

#-nostdlib \

# Release
LDFLAGS := -O3  -O3  -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -DPRINTF_FLOAT_ENABLE=0 -DSCANF_FLOAT_ENABLE=0 -DPRINTF_ADVANCED_ENABLE=0 -DSCANF_ADVANCED_ENABLE=0 -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP   --specs=nano.specs --specs=nosys.specs -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -Xlinker --gc-sections -Xlinker -static -Xlinker -print-memory-usage -Xlinker -z -Xlinker muldefs -mcpu=cortex-m0plus -mfloat-abi=soft -T gcc/MKE04Z8xxx4_flash.ld 

# Release 2
LDFLAGS := -O3  -O3  -DNDEBUG -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP   --specs=nano.specs --specs=nosys.specs -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -Xlinker --gc-sections -Xlinker -static  -Xlinker -print-memory-usage -Xlinker -z -Xlinker muldefs -mcpu=cortex-m0plus -mfloat-abi=soft -T gcc/MKE04Z8xxx4_flash.ld -static

# Debug
LDFLAGS := -O0 -DCPU_MKE04Z8VFK4 -DFRDM_KE04Z -DFREEDOM -Os -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -std=gnu99 -mcpu=cortex-m0plus -mfloat-abi=soft -MMD -MP   --specs=nano.specs --specs=nosys.specs -Wall -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mthumb -mapcs -Xlinker --gc-sections -Xlinker -static  -Xlinker -print-memory-usage -Xlinker -z -Xlinker muldefs -mcpu=cortex-m0plus -mfloat-abi=soft -T gcc/MKE04Z8xxx4_flash.ld -static


all : $(NAME).elf

$(NAME).elf: $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $(NAME).elf -Wl,--start-group -lm -lc -lgcc -lnosys -Wl,--end-group

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"

%.o: %.S
	$(AS) $(ASFLAGS) $(INCLUDE) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"

clean:
	rm -f $(NAME).elf $(OBJECTS)

.PHONY: all clean
