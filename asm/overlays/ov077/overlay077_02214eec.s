.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Sound_Play
.extern Actor_PlayHorizontalSpatialSound
.extern func_ov077_02214fc0
.extern gSoundContext

.global func_ov077_02214eec
func_ov077_02214eec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrsh r0, [r5, #0xda]
    mov r4, r1
    cmp r0, #0x3
    bge .L_02214f3c
    add r0, r5, #0x200
    ldrh r1, [r0, #0xe8]
    cmp r1, #0x1
    bhi .L_02214f3c
    ldrsh r0, [r0, #0xea]
    cmp r0, #0x0
    bgt .L_02214f3c
    cmp r4, #0x0
    ldrne r1, [r4, #0x1f8]
    ldrne r0, [r5, #0x2d0]
    ldrnesh r1, [r1, #0x0]
    ldrnesh r0, [r0, #0x0]
    cmpne r1, r0
    beq .L_02214f64
.L_02214f3c:
    mov r0, r5
    mov r1, #0x40
    bl func_ov077_02214fc0
    ldr r0, .L_02214fb4
    ldr r1, .L_02214fb8
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_02214f64:
    add r3, r5, #0x200
    mov r2, #0x0
    strh r2, [r3, #0xec]
    ldr r1, .L_02214fbc
    mov r0, r5
    strh r2, [r3, #0xe8]
    mov ip, #0x1
    strh ip, [r3, #0xea]
    bl Actor_PlayHorizontalSpatialSound
    cmp r4, #0x0
    add r1, r5, #0x200
    ldreqh r2, [r1, #0xf2]
    moveq r0, #0x1
    movne r0, #0x0
    biceq r2, r2, #0x8
    streqh r2, [r1, #0xf2]
    ldrneh r2, [r1, #0xf2]
    orrne r2, r2, #0x8
    strneh r2, [r1, #0xf2]
    ldmia sp!, {r3, r4, r5, pc}
.L_02214fb4: .word gSoundContext
.L_02214fb8: .word 0x13f
.L_02214fbc: .word 0x9f80
.size func_ov077_02214eec, . - func_ov077_02214eec
