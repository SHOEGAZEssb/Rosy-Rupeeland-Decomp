.text
.extern genrand_int32
.extern func_ov042_021fda0c
.global func_ov042_021fdbc8
func_ov042_021fdbc8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xf24]
    mov r4, r2
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r1, #0x0
    moveq r1, #0x2
    add r0, r5, r0, lsl #0x2
    movne r1, #0x3
    str r1, [r0, #0xb3c]
    bl genrand_int32
    ldr r1, [r5, #0xf24]
    add r2, r5, #0x4c
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x900
    strh r0, [r1, #0xac]
    ldr r1, [r5, #0xf24]
    mov r0, #0xc
    mla r0, r1, r0, r2
    mov r1, r4
    bl func_ov042_021fda0c
    ldr r0, [r5, #0xf24]
    mov r2, #0x0
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r2, [r0, #0x74]
    ldr r4, [r5, #0xf24]
    mov r1, #0xc
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xa00
    mla r3, r4, r1, r5
    ldrh r0, [r0, #0x74]
    sub r2, r1, #0xd
    str r0, [r3, #0x504]
    ldr r0, [r5, #0xf24]
    mla r1, r0, r1, r5
    ldr r0, [r1, #0x504]
    str r0, [r1, #0x500]
    ldr r0, [r5, #0xf24]
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xc00
    strh r2, [r0, #0xcc]
    ldr r0, [r5, #0xf24]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r5, #0xf24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov042_021fdbc8, . - func_ov042_021fdbc8
