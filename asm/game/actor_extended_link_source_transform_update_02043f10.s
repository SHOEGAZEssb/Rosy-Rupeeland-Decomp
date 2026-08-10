; Matching retail form; see src/game/actor_extended_link_source_transform_update.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_02008378
.extern ActorExtendedType2_RunRenderCallback
.global ActorExtendedLinkSource_UpdatePartnerTransform
.type ActorExtendedLinkSource_UpdatePartnerTransform, @function
ActorExtendedLinkSource_UpdatePartnerTransform: ; 0x02043f10
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r4, r1
    ldr r1, [r4, #0x29c]
    mov r6, r0
    mov r5, r2
    tst r1, #0x1
    beq .L_02043fac
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1e0]
    blx r1
    mov r1, #0x0
    mov r3, r0
    add r0, sp, #0x20
    mov r2, r1
    bl VecFx32Object_InitComponents
    ldr r1, [r4, #0x298]
    add r0, sp, #0x10
    add r2, sp, #0x20
    add r1, r1, #0x18
    bl func_02008378
    add r0, r4, #0x18
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    ldr r1, [r4, #0x298]
    add r0, sp, #0x0
    add r2, sp, #0x20
    add r1, r1, #0x28
    bl func_02008378
    add r0, r4, #0x28
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
.L_02043fac:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl ActorExtendedType2_RunRenderCallback
    ldr r0, [r4, #0x29c]
    tst r0, #0x1
    ldrne r0, [r4, #0x298]
    cmpne r0, #0x0
    beq .L_02044028
    ldr r0, [r0, #0x54]
    ldr r1, [r4, #0x54]
    ldrb r2, [r0, #0x3a]
    mov r0, r4
    strb r2, [r1, #0x3a]
    ldr r2, [r4, #0x298]
    ldr r1, [r0, #0x0]
    ldr r2, [r2, #0x54]
    ldr r1, [r1, #0x1e0]
    ldrh r5, [r2, #0x28]
    blx r1
    ldr r2, [r4, #0x5c]
    sub r1, r5, r0, asr #0xc
    mov r2, r2, lsl #0x10
    ldr r0, [r4, #0x54]
    add r1, r1, r2, asr #0x10
    strh r1, [r0, #0x28]
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    b .L_02044038
.L_02044028:
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x10
.L_02044038:
    strneh r0, [r1, #0x24]
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.size ActorExtendedLinkSource_UpdatePartnerTransform, . - ActorExtendedLinkSource_UpdatePartnerTransform
