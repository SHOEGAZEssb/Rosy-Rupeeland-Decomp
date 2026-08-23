.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern SceneManager_GetCurrent
.extern Sound_Play
.extern data_020c9670
.extern data_021052fc
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32Object_Subtract
.extern ActorMotionAreaFollower_GetPosition
.extern Actor_SnapshotTransientState
.extern Actor_UpdateAnimationState
.extern ActorDerivedRuntime_UpdateFrame
.extern Sound_PlayEffectWithParameters
.extern Sound_StopEffect
.extern Sound_SetEffectParameters
.extern func_020befec
.extern func_ov087_02217ed8
.extern func_ov087_022183fc
.extern func_ov087_02218454
.extern gSceneManager
.extern gSoundContext

.global func_ov087_022179b0
func_ov087_022179b0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r1, [r5, #0x10]
    tst r1, #0x1000000
    beq .L_022179d0
    bl ActorDerivedRuntime_UpdateFrame
    b .L_02217ebc
.L_022179d0:
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x80
    beq .L_02217a08
    ldr r0, .L_02217ec4
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0xe
    beq .L_02217ebc
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x80
    strh r1, [r0, #0x1a]
.L_02217a08:
    mov r0, r5
    bl Actor_SnapshotTransientState
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x4
    mov r0, r5
    beq .L_02217a2c
    bl func_ov087_02218454
    b .L_02217a30
.L_02217a2c:
    bl func_ov087_022183fc
.L_02217a30:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x1e]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x1e]
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x16]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x16]
    bgt .L_02217abc
    ldrsh r0, [r0, #0x14]
    cmp r0, #0x0
    bge .L_02217a90
    ldr r0, [r5, #0xc8]
    subs r0, r0, #0x2000
    str r0, [r5, #0xc8]
    ldrmi r0, [r5, #0xc8]
    addmi r0, r0, #0x10000
    strmi r0, [r5, #0xc8]
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x18]
    strh r1, [r0, #0x16]
    b .L_02217abc
.L_02217a90:
    ble .L_02217abc
    ldr r0, [r5, #0xc8]
    add r0, r0, #0x2000
    str r0, [r5, #0xc8]
    cmp r0, #0x10000
    ldrge r0, [r5, #0xc8]
    subge r0, r0, #0x10000
    strge r0, [r5, #0xc8]
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x18]
    strh r1, [r0, #0x16]
.L_02217abc:
    ldr r0, [r5, #0xc8]
    add r1, r5, #0x200
    add r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0xd
    strb r0, [r5, #0xd4]
    ldrsh r0, [r1, #0x24]
    cmp r0, #0x1
    bne .L_02217de8
    ldrsh r0, [r1, #0x26]
    mov r1, #0xc
    mov r0, r0, lsl #0xc
    bl func_020befec
    ldr r2, [r5, #0x208]
    ldr r1, [r5, #0xc8]
    smull r0, r3, r2, r0
    adds r4, r0, #0x800
    mov r0, r1, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, .L_02217ec8
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    adc r3, r3, #0x0
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    ldrsh r0, [r2, r0]
    smull r2, r3, r1, r4
    adds ip, r2, #0x800
    smull r2, r1, r0, r4
    adc r3, r3, #0x0
    adds r0, r2, #0x800
    mov ip, ip, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    adc r3, r1, #0x0
    mov r2, r0, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    add r0, sp, #0x18
    rsb r1, ip, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r1, sp, #0x18
    add r0, r5, #0x38
    bl VecFx32Object_Add
    ldr r0, .L_02217ecc
    cmp r4, r0
    ble .L_02217bd8
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x200
    bne .L_02217bb8
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_StopEffect
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
.L_02217bb8:
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x400
    strh r1, [r0, #0x1a]
    ldrh r1, [r0, #0x1a]
    orr r1, r1, #0x200
    strh r1, [r0, #0x1a]
    b .L_02217c74
.L_02217bd8:
    sub r0, r0, #0x334
    cmp r4, r0
    bge .L_02217c3c
    add r0, r5, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x400
    bne .L_02217c1c
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_StopEffect
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
.L_02217c1c:
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x200
    strh r1, [r0, #0x1a]
    ldrh r1, [r0, #0x1a]
    orr r1, r1, #0x400
    strh r1, [r0, #0x1a]
    b .L_02217c74
.L_02217c3c:
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_StopEffect
    ldr r0, .L_02217ed0
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_StopEffect
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x600
    strh r1, [r0, #0x1a]
.L_02217c74:
    ldrb r3, [r5, #0x4b]
    tst r3, #0xf
    beq .L_02217d7c
    ands r1, r3, #0xc
    mov r0, #0x0
    cmpne r1, #0xc
    beq .L_02217ce8
    tst r1, #0x4
    beq .L_02217cb0
    ldr r1, [r5, #0x40]
    cmp r1, #0x0
    rsbgt r0, r1, #0x0
    strgt r0, [r5, #0x40]
    movgt r0, #0x1
    b .L_02217ccc
.L_02217cb0:
    tst r1, #0x8
    beq .L_02217ccc
    ldr r1, [r5, #0x40]
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    strlt r0, [r5, #0x40]
    movlt r0, #0x1
.L_02217ccc:
    ldr r2, [r5, #0x40]
    add r1, r5, #0x200
    rsb r2, r2, #0x0
    str r2, [r5, #0x40]
    ldrsh r2, [r1, #0x26]
    sub r2, r2, #0xa
    strh r2, [r1, #0x26]
.L_02217ce8:
    ands r1, r3, #0x3
    cmpne r1, #0x3
    beq .L_02217d40
    tst r1, #0x1
    beq .L_02217d14
    ldr r1, [r5, #0x3c]
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    strlt r0, [r5, #0x3c]
    movlt r0, #0x1
    b .L_02217d30
.L_02217d14:
    tst r1, #0x2
    beq .L_02217d30
    ldr r1, [r5, #0x3c]
    cmp r1, #0x0
    rsbgt r0, r1, #0x0
    strgt r0, [r5, #0x3c]
    movgt r0, #0x1
.L_02217d30:
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x26]
    sub r2, r2, #0xa
    strh r2, [r1, #0x26]
.L_02217d40:
    cmp r0, #0x0
    beq .L_02217d7c
    ldr r0, [r5, #0x22c]
    mov r2, #0x0
    cmp r0, #0x0
    str r2, [sp, #0x0]
    movgt r3, #0x20
    ldr r0, .L_02217ed0
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    movle r3, #0x7f
    mov r1, #0x67
    bl Sound_PlayEffectWithParameters
    mov r0, #0xa
    str r0, [r5, #0x22c]
.L_02217d7c:
    ldr r0, .L_02217ed4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r1, [r0, #0x4]
    ldr r2, [r5, #0x1c]
    mvn r0, #0x7f
    sub r1, r2, r1
    add r1, r1, #0x80000
    cmp r0, r1, asr #0xc
    mov r1, r1, asr #0xc
    movgt r1, r0
    bgt .L_02217dbc
    cmp r1, #0x7f
    movgt r1, #0x7f
.L_02217dbc:
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x228]
    ldr r0, .L_02217ed0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x67
    mov r2, #0x4
    mov r3, #0x50
    bl Sound_SetEffectParameters
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
.L_02217de8:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x26]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x26]
    blt .L_02217e0c
    cmp r1, #0xc
    movlt r1, #0xc
    strlth r1, [r0, #0x26]
.L_02217e0c:
    ldr r0, [r5, #0x22c]
    add r1, r5, #0x38
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x22c]
    ldr r2, [r5, #0x210]
    add r0, sp, #0x8
    bl func_ov087_02217ed8
    add r1, sp, #0x8
    add r0, r5, #0x38
    bl VecFx32Object_Subtract
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r1, r5, #0x200
    mov r2, #0x0
    mov r0, r5
    strh r2, [r1, #0x14]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x24]
    cmp r0, #0x1
    bne .L_02217ea4
    ldr r0, .L_02217ed4
    add r1, r5, #0x18
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    ldr r0, .L_02217ed4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea4]
    ldr r0, [r1, #0x24]
    add r0, r0, #0xa000
    str r0, [r1, #0x24]
.L_02217ea4:
    mov r0, r5
    bl Actor_UpdateAnimationState
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_02217ebc:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
.L_02217ec4: .word gSceneManager
.L_02217ec8: .word data_020c9670
.L_02217ecc: .word 0x19a
.L_02217ed0: .word gSoundContext
.L_02217ed4: .word data_021052fc
.size func_ov087_022179b0, . - func_ov087_022179b0
