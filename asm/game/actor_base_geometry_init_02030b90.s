; Matching retail form; see src/game/actor_base_geometry_init.c.
.text
.extern data_020def7c
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Assign
.extern ActorBounds_Copy
.extern ActorBounds_Set
.extern ActorBounds_Translate

    .global ActorBaseGeometry_Init
    .type ActorBaseGeometry_Init, @function
ActorBaseGeometry_Init: ; 0x02030b90
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    ldr r2, .L_02030cfc
    mov r5, r0
    mov r4, r1
    mov r1, #0x0
    str r2, [r5, #0x0]
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x4
    str r1, [sp, #0x0]
    bl ActorBounds_Set
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x8
    str r1, [sp, #0x0]
    bl ActorBounds_Set
    mov r2, #0x0
    str r2, [r5, #0xc]
    ldr r1, [r4, #0x58]
    add r0, r5, #0x18
    str r1, [r5, #0x10]
    str r2, [r5, #0x14]
    ldrsh r1, [r4, #0x22]
    ldrsh r2, [r4, #0x24]
    ldrsh r3, [r4, #0x26]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    bl VecFx32Object_InitComponents
    add r0, r5, #0x28
    ldrsh r1, [r4, #0x22]
    ldrsh r2, [r4, #0x24]
    ldrsh r3, [r4, #0x26]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    bl VecFx32Object_InitComponents
    add r0, r5, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r0, #0x0
    strb r0, [r5, #0x48]
    strb r0, [r5, #0x49]
    strb r0, [r5, #0x4a]
    strb r0, [r5, #0x4b]
    strb r0, [r5, #0x4c]
    ldrh r0, [r4, #0x0]
    strb r0, [r5, #0x4d]
    ldrh r0, [r4, #0x2]
    strh r0, [r5, #0x4e]
    ldrb r0, [r4, #0x12]
    ldrb r1, [r4, #0x13]
    mov r0, r0, lsl #0x17
    mov r6, r0, asr #0x18
    mov r0, r1, lsl #0x17
    mov r7, r0, asr #0x18
    rsb r8, r6, #0x0
    strb r8, [sp, #0x8]
    rsb r9, r7, #0x0
    strb r9, [sp, #0x9]
    add r1, sp, #0x8
    add r0, r5, #0x4
    strb r6, [sp, #0xa]
    strb r7, [sp, #0xb]
    bl ActorBounds_Copy
    add r1, sp, #0x4
    strb r8, [sp, #0x4]
    strb r9, [sp, #0x5]
    strb r6, [sp, #0x6]
    strb r7, [sp, #0x7]
    add r0, r5, #0x8
    bl ActorBounds_Copy
    ldrb r1, [r4, #0x14]
    ldrb r2, [r4, #0x15]
    add r0, r5, #0x8
    bl ActorBounds_Translate
    ldr r1, [r4, #0x28]
    add r0, r5, #0x28
    str r1, [r5, #0xc]
    str r1, [r5, #0x14]
    add r1, r5, #0x18
    bl VecFx32Object_Assign
    ldrsh r1, [r4, #0x50]
    mov r0, r5
    strh r1, [r5, #0x50]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02030cfc: .word data_020def7c
    .size ActorBaseGeometry_Init, . - ActorBaseGeometry_Init
