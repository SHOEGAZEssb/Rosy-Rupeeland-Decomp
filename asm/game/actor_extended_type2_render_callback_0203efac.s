; Matching retail form; see src/game/actor_extended_type2_render_callback.c.
.text
.extern data_021052fc
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Actor_UpdatePresentation
.extern func_020a25c8
    .global ActorExtendedType2_RunRenderCallback
    .type ActorExtendedType2_RunRenderCallback, @function
ActorExtendedType2_RunRenderCallback: ; 0x0203efac
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x1c
    mov r5, r1
    ldr r1, [r5, #0x260]
    mov r6, r0
    mov r4, r2
    tst r1, #0x100000
    beq .L_0203f058
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1c
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_0203f058
    ldrb r0, [r5, #0x294]
    add r1, r0, #0x1
    and r0, r1, #0xff
    strb r1, [r5, #0x294]
    cmp r0, #0x14
    bls .L_0203f058
    ldr r0, .L_0203f0b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x20
    str r1, [sp, #0x0]
    mov r1, #0x18
    str r1, [sp, #0x4]
    mov r1, #0x46
    str r1, [sp, #0x8]
    ldr r1, [r5, #0x24]
    ldr r3, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    mov r1, r1, asr #0xc
    mov r3, r3, asr #0xc
    rsb r1, r1, r2, asr #0xc
    sub r2, r3, #0x10
    sub r3, r1, #0x18
    mov r1, #0x0
    bl func_020a25c8
    mov r0, #0x0
    strb r0, [r5, #0x294]
.L_0203f058:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Actor_UpdatePresentation
    add r0, sp, #0xc
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldrsh r2, [r5, #0x6a]
    ldr r3, [sp, #0x14]
    ldr r1, .L_0203f0b8
    add r0, r5, #0x284
    smlabb r1, r2, r1, r3
    str r1, [sp, #0x14]
    ldr r5, [r0, #0x0]
    add r2, sp, #0xc
    ldr r5, [r5, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx r5
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0203f0b4: .word data_021052fc
.L_0203f0b8: .word 0xb33
    .size ActorExtendedType2_RunRenderCallback, . - ActorExtendedType2_RunRenderCallback

