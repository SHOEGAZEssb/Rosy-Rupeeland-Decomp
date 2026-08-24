.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_020e6e68
.extern gGamePhaseRuntime
.extern data_ov097_0221a4c8
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32Object_Assign
.extern Sound_PlayOwnedEffect
.extern func_ov078_02213c3c
.extern func_ov097_02218d04
.extern gSoundContext

.global func_ov097_02218b40
func_ov097_02218b40:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x38
    mov r6, r0
    mov r5, r1
    bl func_ov078_02213c3c
    ldr r0, [r6, #0x260]
    mov r1, #0x3
    bic r0, r0, #0xa
    str r0, [r6, #0x260]
    mov r0, r6
    strb r1, [r6, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    bne .L_02218cec
    add r0, sp, #0x28
    bl VecFx32Object_Init
    ldrh r0, [r5, #0x1a]
    tst r0, #0x10
    mvnne r4, #0x80000000
    bne .L_02218bd8
    ldr r1, .L_02218cf4
    add r0, sp, #0x18
    ldr r2, [r1, #0x0]
    add r1, r6, #0x18
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    add r2, r2, #0x18
    bl func_ov097_02218d04
    add r0, sp, #0x28
    add r1, sp, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add r0, sp, #0x28
    bl VecFx32Object_GetMagnitude
    mov r4, r0
.L_02218bd8:
    ldrh r0, [r5, #0x1a]
    tst r0, #0x20
    ldrne r0, .L_02218cf4
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r2, [r0, #0xea8]
    cmpne r2, #0x0
    beq .L_02218c44
    ldr r0, [r2, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02218c44
    add r0, sp, #0x8
    add r1, r6, #0x18
    add r2, r2, #0x18
    bl func_ov097_02218d04
    add r0, sp, #0x28
    add r1, sp, #0x8
    bl VecFx32Object_Assign
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x28
    bl VecFx32Object_GetMagnitude
    add r1, r0, #0x18000
    b .L_02218c48
.L_02218c44:
    mvn r1, #0x80000000
.L_02218c48:
    cmp r4, #0x3c000
    mov r2, #0x0
    bge .L_02218c6c
    cmp r4, r1
    bgt .L_02218c6c
    sub r0, r2, #0x80000001
    cmp r4, r0
    movne r2, #0x1
    bne .L_02218c80
.L_02218c6c:
    cmp r1, #0x3c000
    bge .L_02218c80
    mvn r0, #0x80000000
    cmp r1, r0
    movne r2, #0x1
.L_02218c80:
    cmp r2, #0x0
    beq .L_02218ce4
    ldr r1, .L_02218cf8
    add r0, r6, #0x200
    ldr r2, [r1, #0x0]
    ldr r1, [r1, #0x4]
    mov r3, #0x0
    str r2, [r6, #0x2a4]
    str r1, [r6, #0x2a8]
    strh r3, [r0, #0x98]
    ldrh r1, [r6, #0x4e]
    ldr r0, .L_02218cfc
    mov r1, r1, lsl #0x1
    ldrh r2, [r0, r1]
    cmp r2, #0x0
    beq .L_02218ce4
    str r3, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_02218d00
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_PlayOwnedEffect
.L_02218ce4:
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
.L_02218cec:
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, pc}
.L_02218cf4: .word gGamePhaseRuntime
.L_02218cf8: .word data_ov097_0221a4c8
.L_02218cfc: .word data_020e6e68
.L_02218d00: .word gSoundContext
.size func_ov097_02218b40, . - func_ov097_02218b40
