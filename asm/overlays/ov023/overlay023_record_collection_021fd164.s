.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern data_021f5128
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern RecordMode_GetAnimationIndex


    .global func_ov023_021fd164
func_ov023_021fd164:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr r0, [r6, #0x34]
    cmp r1, r0
    bge L_021fd214
    mov r0, #0x18
    mul r5, r1, r0
    ldr r0, [r6, #0x2c]
    ldr r1, [r0, r5]
    add r2, r0, r5
    cmp r1, #0x0
    beq L_021fd214
    ldr r0, [r2, #0x10]
    cmp r0, #0x0
    bne L_021fd214
    ldr r1, [r1, #0x4]
    ldr r0, L_021fd21c
    ldr r1, [r1, #0xc]
    ldr r4, [r0, #0x0]
    and r3, r1, #0xff
    ldr r0, [r6, #0x4]
    add r1, r2, #0x4
    mov r2, #0x2
    ldr r7, [r4, r3, lsl #0x2]
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r1, [r6, #0x2c]
    mov r4, r0
    add r0, r1, r5
    str r4, [r0, #0x10]
    add r0, r7, #0x660
    ldr r1, [r6, #0x2c]
    add r0, r0, #0x8
    add r5, r1, r5
    bl RecordMode_GetAnimationIndex
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, r0
    ldrsh r2, [r5, #0x14]
    ldrsh r3, [r5, #0x16]
    mov r0, r4
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fd214:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fd21c: .word data_021f5128
.size func_ov023_021fd164, .-func_ov023_021fd164

