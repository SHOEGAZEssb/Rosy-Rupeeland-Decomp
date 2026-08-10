.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern VecFx32Object_InitComponents
.extern Actor_GetCachedTerrainHeight
.extern func_ov088_0221b2e0

.global func_ov088_0221a9c0
func_ov088_0221a9c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    ldr r2, [r6, #0x1c]
    ldr r1, [r6, #0x20]
    mov r7, r0
    mov r0, r6
    mov r4, r2, asr #0xc
    mov r5, r1, asr #0xc
    bl Actor_GetCachedTerrainHeight
    mov r8, r0, asr #0x10
    mov r0, r6
    mov r1, r4
    mov r3, r8
    add r2, r5, #0x28
    bl func_ov088_0221b2e0
    cmp r0, #0x0
    addne r0, r5, #0x28
    movne r4, r4, lsl #0xc
    movne r5, r0, lsl #0xc
    bne .L_0221aa8c
    mov r0, r6
    mov r1, r4
    mov r3, r8
    sub r2, r5, #0x28
    bl func_ov088_0221b2e0
    cmp r0, #0x0
    subne r0, r5, #0x28
    movne r4, r4, lsl #0xc
    movne r5, r0, lsl #0xc
    bne .L_0221aa8c
    mov r0, r6
    mov r2, r5
    mov r3, r8
    add r1, r4, #0x28
    bl func_ov088_0221b2e0
    cmp r0, #0x0
    addne r0, r4, #0x28
    movne r4, r0, lsl #0xc
    movne r5, r5, lsl #0xc
    bne .L_0221aa8c
    mov r0, r6
    mov r2, r5
    mov r3, r8
    sub r1, r4, #0x28
    bl func_ov088_0221b2e0
    cmp r0, #0x0
    subne r0, r4, #0x28
    movne r4, r0, lsl #0xc
    movne r5, r5, lsl #0xc
    ldreq r4, [r6, #0x1c]
    ldreq r5, [r6, #0x20]
.L_0221aa8c:
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    mov r3, r0
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl VecFx32Object_InitComponents
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov088_0221a9c0, . - func_ov088_0221a9c0
