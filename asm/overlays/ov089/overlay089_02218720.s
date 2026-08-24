.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Sound_Play
.extern gGamePhaseRuntime
.extern Type7Actor_SetActorEnabled
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov089_02217c14
.extern gSoundContext

.global func_ov089_02218720
func_ov089_02218720:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r1, [r0, #0xc]
    tst r1, #0x2
    bicne r1, r1, #0x2
    strneh r1, [r0, #0xc]
    movne r0, #0x2
    strneh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrh r0, [r0, #0xc]
    tst r0, #0x80
    beq .L_02218768
    ldr r0, .L_0221894c
    mov r1, #0x84
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
.L_02218768:
    add r0, r4, #0x200
    ldrh r1, [r0, #0xc]
    tst r1, #0x100
    beq .L_022187ec
    bic r2, r1, #0x100
    ldr r1, .L_02218950
    strh r2, [r0, #0xc]
    ldr r0, [r1, #0x0]
    mov r1, #0x84
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    ldr r0, [r0, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x17
    cmp r0, #0xa
    bhi .L_022187c0
    ldr r0, .L_0221894c
    mov r2, #0x4
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_022187ec
.L_022187c0:
    cmp r0, #0x14
    bhi .L_022187dc
    ldr r0, .L_0221894c
    mov r2, #0x5
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_022187ec
.L_022187dc:
    ldr r0, .L_0221894c
    mov r2, #0x6
    ldr r0, [r0, #0x0]
    bl Sound_Play
.L_022187ec:
    ldrsh r1, [r4, #0xd6]
    ldr r0, [r4, #0x54]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
.L_02218800:
    ldmia sp!, {r4, pc}
    b .L_02218814
    b .L_02218840
    b .L_022188f4
    b .L_02218920
.L_02218814:
    ldrb r1, [r4, #0xd4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_02218840:
    ldrb r1, [r4, #0xd4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x54]
    mov r1, #0x1
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x240]
    str r1, [r0, #0x14]
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x240]
    strb r1, [r0, #0x1a]
    ldrb r0, [r4, #0xd4]
    ldr r2, [r4, #0x240]
    add r1, r0, #0x8
    ldr r0, [r2, #0x4]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x240]
    add r1, r4, #0x18
    ldr r2, [r0, #0x4]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x240]
    bl func_ov089_02217c14
    ldr r0, .L_02218950
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r1, r4, #0x200
    ldrh r1, [r1, #0xc]
    tst r1, #0x800
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x4
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl Type7Actor_SetActorEnabled
    ldmia sp!, {r4, pc}
.L_022188f4:
    ldrb r1, [r4, #0xd4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_02218920:
    ldrb r1, [r4, #0xd4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0221894c: .word gSoundContext
.L_02218950: .word gGamePhaseRuntime
.size func_ov089_02218720, . - func_ov089_02218720
