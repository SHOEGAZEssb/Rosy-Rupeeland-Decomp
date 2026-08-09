.text
.extern genrand_int32
.extern func_ov042_021fda0c
.global func_ov042_021fdd48
func_ov042_021fdd48:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xf24]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    add r0, r6, r0, lsl #0x2
    mov r1, #0x4
    str r1, [r0, #0xb3c]
    bl genrand_int32
    ldr r1, [r6, #0xf24]
    add r2, r6, #0x4c
    add r1, r6, r1, lsl #0x1
    add r1, r1, #0x900
    strh r0, [r1, #0xac]
    ldr r1, [r6, #0xf24]
    mov r0, #0xc
    mla r0, r1, r0, r2
    mov r1, r4
    bl func_ov042_021fda0c
    ldr r0, [r6, #0xf24]
    mov r1, #0x0
    add r0, r6, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r1, [r0, #0x74]
    ldr r3, [r6, #0xf24]
    mov r1, #0xc
    add r0, r6, r3, lsl #0x1
    add r0, r0, #0xa00
    mla r2, r3, r1, r6
    ldrh r0, [r0, #0x74]
    str r0, [r2, #0x504]
    ldr r0, [r6, #0xf24]
    mla r1, r0, r1, r6
    ldr r0, [r1, #0x504]
    str r0, [r1, #0x500]
    ldr r0, [r6, #0xf24]
    add r0, r6, r0, lsl #0x1
    add r0, r0, #0xc00
    strh r5, [r0, #0xcc]
    ldr r0, [r6, #0xf24]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r6, #0xf24]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov042_021fdd48, . - func_ov042_021fdd48
