.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern data_ov054_0220f0e0
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern OverlaySlot_Init
.extern func_0201e250

.global func_ov054_0220e400
func_ov054_0220e400:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_0201e250
    ldr r1, .L_0220e49c
    add r0, r4, #0x194
    str r1, [r4, #0x0]
    str r6, [r4, #0x8]
    str r5, [r4, #0xc]
    mov r1, #0x0
    str r1, [r4, #0x10]
    bl VecFx32Object_Init
    mov r1, #0x1000
    add r0, r4, #0x1a8
    str r1, [r4, #0x1a4]
    bl OverlaySlot_Init
    mov r2, #0x0
    mov r1, r2
.L_0220e450:
    add r0, r4, r2, lsl #0x1
    strb r1, [r0, #0x15]
    strb r2, [r0, #0x14]
    add r2, r2, #0x1
    cmp r2, #0xc0
    blt .L_0220e450
    mov r2, #0x14000
    add r0, sp, #0x0
    mov r3, r1
    rsb r2, r2, #0x0
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    add r0, r4, #0x194
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0220e49c: .word data_ov054_0220f0e0
.size func_ov054_0220e400, . - func_ov054_0220e400
