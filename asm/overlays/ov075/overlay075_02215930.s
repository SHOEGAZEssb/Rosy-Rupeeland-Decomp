.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern gGamePhaseRuntime
.extern DualLayerTileRenderer_SetPackedTileValue

.global func_ov075_02215930
func_ov075_02215930:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r2, .L_022159c0
    mov r7, r0
    ldr r0, [r2, #0x0]
    ldr r5, [r7, #0x2a8]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xed4]
    mov r8, r1, lsl #0x1b
    b .L_022159ac
.L_02215958:
    ldr r6, [r7, #0x2ac]
    b .L_0221599c
.L_02215960:
    mov r0, r4
    ldr r3, [r0, #0x0]
    mov r1, r5
    ldr r3, [r3, #0x2c]
    mov r2, r6
    blx r3
    bic r1, r0, #0x3e0
    str r0, [sp, #0x0]
    orr r3, r1, r8, lsr #0x16
    mov r0, r4
    mov r1, r5
    mov r2, r6
    str r3, [sp, #0x4]
    bl DualLayerTileRenderer_SetPackedTileValue
    add r6, r6, #0x1
.L_0221599c:
    ldr r0, [r7, #0x2b4]
    cmp r6, r0
    ble .L_02215960
    add r5, r5, #0x1
.L_022159ac:
    ldr r0, [r7, #0x2b0]
    cmp r5, r0
    ble .L_02215958
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_022159c0: .word gGamePhaseRuntime
.size func_ov075_02215930, . - func_ov075_02215930
