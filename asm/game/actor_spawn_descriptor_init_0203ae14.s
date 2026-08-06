; Matching retail form; see src/game/actor_spawn_descriptor_init.c.
.text
    .global func_0203ae14
    .type func_0203ae14, @function
func_0203ae14: ; 0x0203ae14
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r2, [sp, #0x0]
    str r3, [r0, #0x4]
    ldr r1, [sp, #0x4]
    str r2, [r0, #0x8]
    ldr r2, [sp, #0x8]
    str r1, [r0, #0xc]
    ldr r1, [sp, #0xc]
    strb r2, [r0, #0x10]
    ldr r2, [sp, #0x10]
    strb r1, [r0, #0x11]
    ldr r1, [sp, #0x14]
    strh r2, [r0, #0x22]
    ldr r2, [sp, #0x18]
    strh r1, [r0, #0x24]
    ldr r3, [sp, #0x1c]
    mov r1, #0x0
    strh r2, [r0, #0x26]
    ldr r2, [sp, #0x20]
    strb r3, [r0, #0x12]
    ldr r3, [sp, #0x24]
    strb r2, [r0, #0x13]
    ldr r2, [sp, #0x28]
    str r3, [r0, #0x28]
    mov r3, #0x7
    ldr ip, [sp, #0x2c]
    str r2, [r0, #0x2c]
    ldr r2, [sp, #0x30]
    str ip, [r0, #0x34]
    ldr ip, [sp, #0x34]
    str r2, [r0, #0x30]
    ldr r2, [sp, #0x38]
    str ip, [r0, #0x38]
    strh r2, [r0, #0x3c]
    ldr ip, [sp, #0x3c]
    strh r1, [r0, #0x3e]
    ldr r2, [sp, #0x40]
    strb ip, [r0, #0x16]
    ldr ip, [sp, #0x44]
    strb r2, [r0, #0x17]
    ldr r2, [sp, #0x48]
    strb ip, [r0, #0x14]
    strb r2, [r0, #0x15]
    sub r2, r1, #0x10
    strh r2, [r0, #0x1a]
    sub r2, r1, #0x31
    strh r2, [r0, #0x1c]
    mov r2, #0x10
    strh r2, [r0, #0x1e]
    strh r3, [r0, #0x20]
    str r1, [r0, #0x48]
    sub r2, r3, #0x8
    strh r2, [r0, #0x4c]
    strh r2, [r0, #0x4e]
    strh r1, [r0, #0x50]
    strh r2, [r0, #0x52]
    str r1, [r0, #0x54]
    str r1, [r0, #0x58]
    sub r2, r3, #0x13
    strb r2, [r0, #0x5c]
    sub r2, r3, #0x2f
    strb r2, [r0, #0x5d]
    mov r2, #0xc
    strb r2, [r0, #0x5e]
    strb r1, [r0, #0x5f]
    strh r1, [r0, #0x60]
    bx lr

    .size func_0203ae14, . - func_0203ae14

