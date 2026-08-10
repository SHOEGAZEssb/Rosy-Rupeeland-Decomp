.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern VecFx32Object_Destroy
.extern Actor_ApplyMotionImpulse
.extern func_ov076_022135e0

.global func_ov076_022136f8
func_ov076_022136f8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x260]
    mov r4, r2
    tst r0, #0x8000
    bne .L_02213738
    add r0, sp, #0x0
    mov r2, #0x4000
    bl func_ov076_022135e0
    add r1, sp, #0x0
    mov r0, r5
    mov r2, r4
    bl Actor_ApplyMotionImpulse
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02213738:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov076_022136f8, . - func_ov076_022136f8
