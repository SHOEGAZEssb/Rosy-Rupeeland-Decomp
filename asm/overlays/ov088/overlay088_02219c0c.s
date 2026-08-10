.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern func_02005058
.extern func_02005070
.extern Actor_SetInteractionFlag2000
.extern Actor_GetCachedTerrainHeight
.extern ActorDerivedType1_IsIdleEligible
.extern func_ov088_02219d64
.extern func_ov088_0221a9c0
.extern gSceneManager

.global func_ov088_02219c0c
func_ov088_02219c0c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r5, r0
    ldr r0, [r5, #0x10]
    mov r4, r1
    tst r0, #0x1000000
    bne .L_02219d48
    ldr r0, .L_02219d5c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_02219d48
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02219d48
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x0
    ldreqsh r0, [r5, #0xda]
    cmpeq r0, #0x0
    bne .L_02219d18
    ldr r0, .L_02219d60
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r7, [r0, #0xea4]
    mov r0, r7
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    beq .L_02219d48
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    mov r6, r0
    mov r0, r7
    bl Actor_GetCachedTerrainHeight
    cmp r6, r0
    bne .L_02219d48
    add r0, sp, #0x10
    add r1, r7, #0x18
    add r2, r5, #0x18
    bl func_ov088_02219d64
    mov r1, #0x0
    add r0, sp, #0x10
    str r1, [sp, #0x1c]
    bl func_02005070
    cmp r0, #0x3c000
    bge .L_02219d0c
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0xf
    ldr r2, [r2, #0xc4]
    blx r2
    ldr r0, .L_02219d60
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    addne r0, r0, #0x200
    movne r1, #0xf
    strneh r1, [r0, #0xa6]
.L_02219d0c:
    add r0, sp, #0x10
    bl func_02005058
    b .L_02219d48
.L_02219d18:
    tst r1, #0x4
    bne .L_02219d48
    add r0, sp, #0x0
    mov r1, r5
    bl func_ov088_0221a9c0
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    add r0, sp, #0x0
    bl func_02005058
.L_02219d48:
    mov r0, r5
    mov r1, r4
    bl Actor_SetInteractionFlag2000
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02219d5c: .word gSceneManager
.L_02219d60: .word data_021052fc
.size func_ov088_02219c0c, . - func_ov088_02219c0c
