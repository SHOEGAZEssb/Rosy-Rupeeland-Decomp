    .text
    .extern Overlay000_DestroyRowResources
    .extern Overlay000_CreateRowResources
    .extern Overlay000_SyncSelection
    .extern Overlay000_Grid_Render
    .global Overlay000_Grid_UpdateTransition
Overlay000_Grid_UpdateTransition:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x26c]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fc4f4
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fc4dc
    mov r0, #0x24
    mul r1, r3, r0
    ldr r0, [r4, #0x264]
    rsb r1, r1, #0x34
    sub r1, r1, r0
    str r1, [r4, #0x268]
    ldr r0, [r4, #0x8]
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x26c]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl Overlay000_DestroyRowResources
    ldr r1, [r4, #0x26c]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl Overlay000_CreateRowResources
L_021fc4dc:
    mov r0, r4
    bl Overlay000_SyncSelection
    mov r0, r4
    bl Overlay000_Grid_Render
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fc4f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size Overlay000_Grid_UpdateTransition, .-Overlay000_Grid_UpdateTransition
