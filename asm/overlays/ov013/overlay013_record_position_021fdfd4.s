    .text
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_0209189c
    .extern func_020918f4

/* Exact fallback; see src/overlays/ov013/overlay013_record_position.c. */
    .global func_ov013_021fdfd4

func_ov013_021fdfd4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r0, [r9, #0x84]
    mov r8, r1
    mov r7, r2
    add r1, r9, #0x78
    mov r2, #0x1
    mov r6, r3
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r9, #0x178
    mov r5, r0
    add r0, r1, #0x800
    mov r1, #0x4
    bl func_020918f4
    and r1, r0, #0xff
    mov r0, r5
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r9, #0x178
    ldr r4, [r8, #0x20]
    add r0, r0, #0x800
    rsb r1, r6, #0x0
    mov r2, r6
    bl func_0209189c
    mov r1, r4, asr #0xb
    add r1, r4, r1, lsr #0x14
    add r4, r0, r1, asr #0xc
    add r2, r9, #0x178
    add r0, r2, #0x800
    ldr r6, [r8, #0x10]
    rsb r1, r7, #0x0
    mov r2, r7
    bl func_0209189c
    mov r1, r6, asr #0xb
    add r1, r6, r1, lsr #0x14
    add r0, r0, r1, asr #0xc
    strh r0, [r5, #0x2c]
    strh r4, [r5, #0x2e]
    ldrh r0, [r5, #0x24]
    orr r0, r0, #0x100
    strh r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov013_021fdfd4, . - func_ov013_021fdfd4
