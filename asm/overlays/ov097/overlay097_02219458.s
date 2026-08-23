.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Actor_PlayRadialSpatialSound
.extern func_ov097_022194e8
.extern func_ov097_0221951c

.global func_ov097_02219458
func_ov097_02219458:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov097_022194e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x8
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xbe]
    ldr r0, [r4, #0x44]
    add r0, r0, #0x4000
    str r0, [r4, #0x44]
    cmp r0, #0x6000
    movgt r0, #0x6000
    strgt r0, [r4, #0x44]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x3000
    str r0, [r4, #0xd0]
    tst r0, #0x10
    ldreq r1, [r4, #0x24]
    ldreq r0, [r4, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022194d0
    mov r0, r4
    mov r1, #0x0
    bl func_ov097_0221951c
.L_022194d0:
    ldr r1, .L_022194e4
    mov r0, r4
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    ldmia sp!, {r4, pc}
.L_022194e4: .word 0xf684
.size func_ov097_02219458, . - func_ov097_02219458
