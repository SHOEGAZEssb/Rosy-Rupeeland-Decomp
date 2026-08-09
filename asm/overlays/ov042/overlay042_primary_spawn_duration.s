.text
.extern genrand_int32
.extern func_ov042_021fda0c
.global func_ov042_021fdeac
func_ov042_021fdeac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xf24]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    add r0, r6, r0, lsl #0x2
    mov r1, #0x6
    cmp r5, #0x6
    movlt r5, r1
    cmp r5, #0x1e
    str r1, [r0, #0xb3c]
    movgt r5, #0x1e
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
    ldr r2, [r6, #0xf24]
    mov r0, #0xc
    mla r1, r2, r0, r6
    mov r2, r5, lsl #0x1
    str r2, [r1, #0x500]
    ldr r1, [r6, #0xf24]
    mov r2, #0x0
    mla r0, r1, r0, r6
    str r2, [r0, #0x504]
    ldr r0, [r6, #0xf24]
    ldr r1, .L_021fdf6c
    add r0, r6, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r5, [r0, #0x74]
    ldr r0, [r6, #0xf24]
    add r0, r6, r0, lsl #0x1
    add r0, r0, #0xc00
    strh r1, [r0, #0xcc]
    ldr r0, [r6, #0xf24]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r6, #0xf24]
    ldmia sp!, {r4, r5, r6, pc}
.L_021fdf6c: .word 0x7fff
.size func_ov042_021fdeac, . - func_ov042_021fdeac
