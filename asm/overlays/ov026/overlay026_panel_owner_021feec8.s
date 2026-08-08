.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_owner.c. */
.extern func_ov026_021fd900
.extern func_ov026_021fd964


    .global func_ov026_021feec8
func_ov026_021feec8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov026_021fd900
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x2
    mov r3, #0x16
    bl func_ov026_021fd964
    ldr r0, [r4, #0xa0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r0, [r4, #0xa4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, #0x10
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x1a
    bl func_ov026_021fd964
    ldr r0, [r4, #0xa8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov026_021feec8, .-func_ov026_021feec8

