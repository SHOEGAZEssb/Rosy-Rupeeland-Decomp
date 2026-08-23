.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern func_02034a60
.extern Type7Actor_GetStateCode
.extern Fx32Vector2_Magnitude
.extern func_ov088_02219154
.extern func_ov088_0221af2c
.extern func_ov088_0221b098
.extern gSceneManager

.global func_ov088_0221add8
func_ov088_0221add8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0221af1c
    mov r5, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, .L_0221af20
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea8]
    cmp r4, #0x0
    beq .L_0221aebc
    ldr r0, [r5, #0x24c]
    cmp r0, #0x0
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x30]
    bne .L_0221ae98
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221aebc
    mov r0, r4
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    bne .L_0221aebc
    ldr r0, [r5, #0x3c]
    ldr r1, [r5, #0x40]
    bl Fx32Vector2_Magnitude
    cmp r0, #0x1000
    bgt .L_0221aebc
    ldr r3, [r5, #0x1c]
    ldr r0, [r4, #0x1c]
    ldr r2, [r5, #0x20]
    ldr r1, [r4, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl Fx32Vector2_Magnitude
    cmp r0, #0x30000
    bge .L_0221aebc
    mov r0, r5
    mov r1, #0x1e
    bl func_ov088_0221af2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0221ae98:
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0221aebc
    mov r0, r5
    bl func_ov088_0221b098
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0221aebc:
    add r2, r5, #0x200
    ldrh r0, [r2, #0x1a]
    tst r0, #0x40
    beq .L_0221af00
    ldr r1, .L_0221af24
    bic r3, r0, #0x40
    add r0, r5, #0x25c
    strh r3, [r2, #0x1a]
    bl func_ov088_02219154
    ldr r1, .L_0221af28
    mov r0, r5
    mov r2, #0x0
    bl func_02034a60
    cmp r4, #0x0
    ldrne r0, [r4, #0x14]
    orrne r0, r0, #0x10000000
    strne r0, [r4, #0x14]
.L_0221af00:
    ldr r1, [r5, #0x250]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0221af1c: .word gSceneManager
.L_0221af20: .word data_021052fc
.L_0221af24: .word 0xfffff99a
.L_0221af28: .word 0xfd87
.size func_ov088_0221add8, . - func_ov088_0221add8
