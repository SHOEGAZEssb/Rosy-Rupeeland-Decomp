.text

/* Exact fallback; see src/overlays/ov023/overlay023_graphics_setup.c. */
.extern data_020f4e14
.extern func_020755e0
.extern func_020925a4
.extern func_020925dc
.extern func_020925f8
.extern func_02092618
.extern func_02092638
.extern func_02092688


    .global func_ov023_021fe164
func_ov023_021fe164:
    stmdb sp!, {r4, lr}
    ldr r3, L_021fe25c
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1e
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl func_020925a4
    ldr r1, L_021fe260
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    bl func_020925f8
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    mov r0, #0x1c
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl func_020925dc
    ldr r1, L_021fe264
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x2]
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
    ldr r0, L_021fe268
    ldr r0, [r0, #0x0]
    bl func_020755e0
    ldrh r2, [r0, #0xe]
    ldr r1, L_021fe26c
    strh r2, [r0, #0x6]
    ldrh r2, [r0, #0x1e]
    strh r2, [r0, #0x8]
    strh r1, [r0, #0xa]
    ldrh r1, [r0, #0x1e]
    strh r1, [r0, #0xc]
    ldmia sp!, {r4, pc}
L_021fe25c: .word 0x4000304
L_021fe260: .word 0x400000a
L_021fe264: .word 0x400100c
L_021fe268: .word data_020f4e14
L_021fe26c: .word 0x4210
.size func_ov023_021fe164, .-func_ov023_021fe164

