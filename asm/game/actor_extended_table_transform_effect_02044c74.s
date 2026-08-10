; Matching retail form; see src/game/actor_extended_table_transform_effect.c.
.text
.extern func_02005030
.extern func_02005058
.extern VecFx32_Subtract
.extern ActorExtendedType2_GetDescriptorValue2C
.extern func_0204cfa4
.extern func_02050078
.extern func_020adc90
.global ActorExtendedTable_ApplyTargetRelativeTransform
.type ActorExtendedTable_ApplyTargetRelativeTransform, @function
ActorExtendedTable_ApplyTargetRelativeTransform: ; 0x02044c74
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x30
    mov r7, r0
    ldr r2, [r7, #0x228]
    mov r6, r1
    add r0, sp, #0x20
    add r1, r2, #0x18
    bl func_02005030
    add r0, sp, #0x10
    add r1, r7, #0x18
    bl func_02005030
    mov r0, r7
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    ble .L_02044d54
    add r0, sp, #0x0
    add r1, sp, #0x10
    add r2, sp, #0x20
    bl VecFx32_Subtract
    mov r2, #0x0
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_0204cfa4
    mov r4, r0
    cmp r4, #0x1000
    ble .L_02044d4c
    mov r0, r7
    bl ActorExtendedType2_GetDescriptorValue2C
    mov r5, r0, lsl #0x4
    ldr r0, [sp, #0x4]
    mov r1, r4
    bl func_020adc90
    smull r2, r1, r0, r5
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    ldr r0, [sp, #0x8]
    mov r1, r4
    str r2, [sp, #0x4]
    bl func_020adc90
    smull r2, r1, r0, r5
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x8]
    mov r0, r7
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
.L_02044d4c:
    add r0, sp, #0x0
    bl func_02005058
.L_02044d54:
    add r1, sp, #0x10
    add r2, sp, #0x20
    mov r0, r6
    bl func_02050078
    mov r4, r0
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size ActorExtendedTable_ApplyTargetRelativeTransform, . - ActorExtendedTable_ApplyTargetRelativeTransform
