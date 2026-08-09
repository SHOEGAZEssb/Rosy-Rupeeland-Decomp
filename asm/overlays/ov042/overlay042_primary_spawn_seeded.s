.text
.extern func_ov042_021fda0c
.global func_ov042_021fde00
func_ov042_021fde00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xf24]
    cmp r0, #0x0
    ldmltia sp!, {r4, pc}
    add r0, r4, r0, lsl #0x2
    mov r3, #0x5
    str r3, [r0, #0xb3c]
    ldr r0, [r4, #0xf24]
    add r3, r4, #0x4c
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x900
    strh r1, [r0, #0xac]
    ldr r1, [r4, #0xf24]
    mov r0, #0xc
    mla r0, r1, r0, r3
    mov r1, r2
    bl func_ov042_021fda0c
    ldr r1, [r4, #0xf24]
    mov r0, #0x0
    add r1, r4, r1, lsl #0x1
    add r1, r1, #0xa00
    strh r0, [r1, #0x74]
    ldr ip, [r4, #0xf24]
    mov r2, #0xc
    add r1, r4, ip, lsl #0x1
    add r1, r1, #0xa00
    mla r3, ip, r2, r4
    ldrh r1, [r1, #0x74]
    str r1, [r3, #0x504]
    ldr r1, [r4, #0xf24]
    mla r2, r1, r2, r4
    ldr r1, [r2, #0x504]
    str r1, [r2, #0x500]
    ldr r1, [r4, #0xf24]
    add r1, r4, r1, lsl #0x1
    add r1, r1, #0xc00
    strh r0, [r1, #0xcc]
    ldr r0, [r4, #0xf24]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r4, #0xf24]
    ldmia sp!, {r4, pc}
.size func_ov042_021fde00, . - func_ov042_021fde00
