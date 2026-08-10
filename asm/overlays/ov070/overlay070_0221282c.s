.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020bf1f8
.extern genrand_int32

.global func_ov070_0221282c
func_ov070_0221282c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, #0x10
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    sub r4, r4, #0x1
.L_02212848:
    add r2, r9, r4, lsl #0x2
    ldr r1, [r2, #0x88]
    ldrh r0, [r1, #0x42]
    tst r0, #0x4
    beq .L_022128fc
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0x88]
    ldr r5, [r0, #0xc]
    bl genrand_int32
    and r0, r0, #0x3
    add r0, r0, r8, lsl #0x2
    add r1, r0, #0x11
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r2, r9, r4, lsl #0x2
    ldr r1, [r2, #0x88]
    mov r0, #0xc
    str r7, [r1, #0x30]
    ldr r1, [r2, #0x88]
    mul r5, r4, r0
    str r6, [r1, #0x34]
    bl genrand_int32
    mov r4, r0
    bl genrand_int32
    mov r1, #0x5
    bl func_020bf1f8
    mov r0, r4, lsl #0x1f
    mov r2, r0, lsr #0x1e
    add r1, r1, #0x1
    mov r0, #0x4b0
    mul r0, r1, r0
    sub r1, r2, #0x1
    mul r2, r1, r0
    add r0, r9, r5
    str r2, [r0, #0x14c]
    bl genrand_int32
    and r0, r0, #0x3
    add r0, r0, #0x4
    mov r0, r0, lsl #0xb
    rsb r1, r0, #0x0
    add r0, r9, r5
    str r1, [r0, #0x150]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_022128fc:
    subs r4, r4, #0x1
    bpl .L_02212848
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov070_0221282c, . - func_ov070_0221282c
