.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern VecFx32Object_Destroy
.extern Actor_ApplyMotionImpulse
.extern func_ov097_022188f8
.extern func_ov097_022194e8

.global func_ov097_022191b8
func_ov097_022191b8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r3, [r6, #0x260]
    mov r5, r1
    mov r4, r2
    tst r3, #0x8000
    bne .L_02219220
    bl func_ov097_022194e8
    cmp r0, #0x0
    beq .L_022191f8
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Actor_ApplyMotionImpulse
    b .L_02219220
.L_022191f8:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x4000
    bl func_ov097_022188f8
    add r1, sp, #0x0
    mov r0, r6
    mov r2, r4
    bl Actor_ApplyMotionImpulse
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02219220:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov097_022191b8, . - func_ov097_022191b8
