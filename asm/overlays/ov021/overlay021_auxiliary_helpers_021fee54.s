    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */

.global func_ov021_021fee54
func_ov021_021fee54:
    ldr r2, [r0, #0x48]
    mov r1, #0x18
    orr r2, r2, #0x2
    str r2, [r0, #0x48]
    ldr ip, [r0, #0x98]
    mov r2, #0x86
    ldrh r3, [ip, #0x24]
    bic r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr ip, [r0, #0x2c0]
    ldr r3, [r0, #0x98]
    ldr r0, [ip, #0x58]
    ldr ip, [r0, #0xc]
    ldr r0, [r0, #0x14]
    sub r0, r0, ip
    mul r1, r0, r1
    strh r2, [r3, #0x2c]
    add r0, r1, #0x1c
    strh r0, [r3, #0x2e]
    bx lr
    .size func_ov021_021fee54, . - func_ov021_021fee54

