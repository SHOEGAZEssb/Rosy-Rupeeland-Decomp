.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GraphicsSpriteState_SetFrameIndex
.extern func_020bf1f8
.extern genrand_int32

.global func_ov058_0220e598
func_ov058_0220e598:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    subs r0, r0, #0x1
    str r0, [r4, #0x30]
    ldmplia sp!, {r4, r5, r6, pc}
    bl genrand_int32
    and r0, r0, #0x3
    add r0, r0, #0x6
    str r0, [r4, #0x30]
    mov r5, #0x3
.L_0220e5c4:
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    ldr r0, [r4, #0x20]
    mov r6, r1
    ldrb r1, [r0, #0x39]
    cmp r6, r1
    beq .L_0220e5c4
    and r1, r6, #0xff
    bl GraphicsSpriteState_SetFrameIndex
    ldr r0, [r4, #0x24]
    and r1, r6, #0xff
    bl GraphicsSpriteState_SetFrameIndex
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov058_0220e598, . - func_ov058_0220e598
