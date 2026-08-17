.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern genrand_int32

.global Overlay050PairedEffect_ResetMotion
Overlay050PairedEffect_ResetMotion:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    bl genrand_int32
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x17
    sub r0, r0, #0x4000
    smull r1, r2, r0, r5
    adds r0, r1, #0x800
    mov r1, #0x0
    adc ip, r2, #0x0
    mov r2, r0, lsr #0xc
    add r0, sp, #0x0
    mov r3, r1
    orr r2, r2, ip, lsl #0x14
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    add r0, r4, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size Overlay050PairedEffect_ResetMotion, . - Overlay050PairedEffect_ResetMotion
