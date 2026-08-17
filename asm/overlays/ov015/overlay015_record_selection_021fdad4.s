    .text
    .extern GameWork_TestFlag
    .extern ActorDescriptor_GetSubtype
    .extern InventoryRecord_GetMetadata
    .extern func_ov001_021fc7e4
    .extern func_ov015_021fd8a8
    .extern func_ov015_021fd8ec
    .extern func_ov015_021fd9f0
    .extern func_ov015_021fda50
    .extern gGameWork

/* Exact fallback for contextual record selection; see src/overlays/ov015/overlay015_selection_runtime.c. */
    .global func_ov015_021fdad4

func_ov015_021fdad4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fdd18
    mov r5, r0
    mov r4, #0x1
    ldr r0, [r1, #0x0]
    rsb r1, r4, #0x38c
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldr r0, [r5, #0xdc]
    movne r4, #0x0
    bl func_ov001_021fc7e4
    mov r6, r0
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    beq L_021fdd0c
    bl InventoryRecord_GetMetadata
    ldrb r0, [r0, #0x2]
    cmp r0, #0x1
    beq L_021fdb28
    cmp r0, #0x2
    b L_021fdcc4
L_021fdb28:
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    ldrne r1, [r0, #0x20]
    andne r1, r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_021fdb50
    mov r0, r5
    bl func_ov015_021fda50
    ldmia sp!, {r4, r5, r6, pc}
L_021fdb50:
    ldr r2, [r5, #0xec]
    cmp r2, #0x0
    ldrneh r1, [r2, #0x4]
    cmpne r1, #0x0
    beq L_021fdbcc
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    bne L_021fdb98
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0x24
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdb98:
    bl ActorDescriptor_GetSubtype
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0x2c
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdbcc:
    cmp r2, #0x0
    ldrh r1, [r0, #0x4]
    beq L_021fdc20
    cmp r1, #0x0
    bne L_021fdbec
    mov r0, r5
    bl func_ov015_021fda50
    ldmia sp!, {r4, r5, r6, pc}
L_021fdbec:
    bl ActorDescriptor_GetSubtype
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0x2c
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdc20:
    cmp r1, #0x0
    bne L_021fdc64
    cmp r4, #0x0
    beq L_021fdc58
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0xd
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdc58:
    mov r0, r5
    bl func_ov015_021fda50
    ldmia sp!, {r4, r5, r6, pc}
L_021fdc64:
    cmp r4, #0x0
    beq L_021fdc90
    bl ActorDescriptor_GetSubtype
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r2, #0x11
    mov r0, r5
    sub r3, r2, #0x12
    mov r1, #0xd
    bl func_ov015_021fd9f0
    ldmia sp!, {r4, r5, r6, pc}
L_021fdc90:
    bl ActorDescriptor_GetSubtype
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0x11
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdcc4:
    ldr r0, [r5, #0xec]
    cmp r0, #0x0
    bne L_021fdcd8
    cmp r4, #0x0
    bne L_021fdce4
L_021fdcd8:
    mov r0, r5
    bl func_ov015_021fda50
    ldmia sp!, {r4, r5, r6, pc}
L_021fdce4:
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x300]
    bl func_ov015_021fda50
    mov r0, r5
    mov r1, #0xd
    bl func_ov015_021fd8a8
    mov r0, r5
    bl func_ov015_021fd8ec
    ldmia sp!, {r4, r5, r6, pc}
L_021fdd0c:
    mov r0, r5
    bl func_ov015_021fda50
    ldmia sp!, {r4, r5, r6, pc}
L_021fdd18: .word gGameWork

    .size func_ov015_021fdad4, . - func_ov015_021fdad4
