.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern gGamePhaseRuntime
.extern data_ov096_02218b08
.extern VecFx32Object_Assign
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern Sound_PlayOwnedEffect
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_020adcac
.extern func_020befec
.extern func_020bf1f8
.extern gSoundContext
.extern genrand_int32

.global func_ov096_02217f6c
func_ov096_02217f6c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r1, [r5, #0x260]
    mov r0, #0x2
    bic r1, r1, #0x3
    str r1, [r5, #0x260]
    strh r0, [r5, #0xd6]
    add r0, r5, #0x78
    add r1, r5, #0x18
    bl VecFx32Object_Assign
    ldr r2, [r5, #0x29c]
    add r1, r5, #0x200
    cmp r2, #0x0
    ldrnesh r4, [r2, #0x22]
    ldrsh r0, [r1, #0x5a]
    moveq r4, #0x5a
    cmp r0, #0x0
    bne .L_02217fd4
    bl genrand_int32
    mov r1, #0x258
    bl func_020bf1f8
    add r1, r1, #0xf0
    add r0, r5, #0x200
    strh r1, [r0, #0x58]
    b .L_022180e0
.L_02217fd4:
    ldrh r1, [r1, #0x58]
    cmp r0, r1
    blt .L_02218048
    ldr r0, .L_022180fc
    adds r1, r5, #0x18
    ldr r0, [r0, #0x0]
    addne r1, r1, #0x4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x40000
    bge .L_02218028
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x5a]
    add r1, r4, #0x1
    strh r1, [r0, #0x58]
    b .L_022180e0
.L_02218028:
    mov r1, #0x5a
    ldr r0, .L_02218100
    strb r1, [r5, #0x29a]
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_022180e0
.L_02218048:
    cmp r2, #0x0
    beq .L_022180e0
    mov r1, r4
    bl func_020befec
    cmp r1, #0x0
    ldreqb r0, [r5, #0x298]
    cmpeq r0, #0x1
    ldreqb r0, [r5, #0x299]
    cmpeq r0, #0x2
    bne .L_022180e0
    mov r0, #0x4
    strb r0, [r5, #0x299]
    ldr r2, [r5, #0x54]
    mov r0, r5
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r4, [r5, #0x208]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r5, #0x54]
    mov r1, #0x16
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    add r1, r0, #0x43
    ldr r0, .L_02218104
    mov r2, #0x4
    ldr r0, [r0, #0x0]
    mov r3, r5
    bl Sound_PlayOwnedEffect
.L_022180e0:
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_022180fc: .word gGamePhaseRuntime
.L_02218100: .word data_ov096_02218b08
.L_02218104: .word gSoundContext
.size func_ov096_02217f6c, . - func_ov096_02217f6c
