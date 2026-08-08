.text

/* Exact fallback; see src/overlays/ov030/overlay030_display_setup.c for documented portable C. */
.extern data_020f4e14
.extern func_020755e0
.extern func_020925a4
.extern func_020925dc
.extern func_020925f8
.extern func_02092618
.extern func_02092638
.extern func_02092688
.extern func_ov030_021fe3e0
.extern func_ov030_021fe414


    .global func_ov030_021fe2b4
func_ov030_021fe2b4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r3, L_021fe3cc
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1c
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl func_020925a4
    mov r1, #0x1
    mov r0, #0x0
    mov r2, #0x18
    mov r3, #0x4
    str r1, [sp, #0x0]
    bl func_ov030_021fe3e0
    mov r1, #0x1
    mov r0, #0x2
    mov r2, #0x1a
    mov r3, #0x4
    str r1, [sp, #0x0]
    bl func_ov030_021fe414
    ldr r1, L_021fe3d0
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x2]
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
    ldr r1, L_021fe3d4
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
    ldr r0, L_021fe3d8
    ldr r0, [r0, #0x0]
    bl func_020755e0
    ldrh r2, [r0, #0x16]
    ldr r1, L_021fe3dc
    strh r2, [r0, #0x6]
    ldrh r2, [r0, #0x1e]
    strh r2, [r0, #0x8]
    strh r1, [r0, #0xa]
    ldrh r1, [r0, #0x1e]
    strh r1, [r0, #0xc]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fe3cc: .word 0x4000304
L_021fe3d0: .word 0x400000c
L_021fe3d4: .word 0x400100c
L_021fe3d8: .word data_020f4e14
L_021fe3dc: .word 0x4210
.size func_ov030_021fe2b4, .-func_ov030_021fe2b4
