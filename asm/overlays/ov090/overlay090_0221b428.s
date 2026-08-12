.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_terminal_effect_burst.c.
.extern Heap_Alloc
.extern data_020c9670
.extern data_021052fc
.extern data_ov090_0221cc00
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern AnimationResource_Init
.extern GamePhaseRuntime_GetActorCollection
.extern func_0201e0ec
.extern ActorCollection_QueueActorForRemoval
.extern func_020349b8
.extern PresentationBackedActor_Spawn
.extern func_020594ec
.extern func_020a2614
.extern func_020befec
.extern func_ov077_02216960
.extern func_ov090_0221b7e0
.extern gHeapContext
.extern gSoundContext
.extern genrand_int32

.global func_ov090_0221b428
func_ov090_0221b428:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x60
    mov r7, #0x1
    mov r10, #0x0
    mov r4, r0
    mov r6, r10
    mov r11, r7
    mov r8, r7
    ldr r5, .L_0221b7c4
    b .L_0221b498
.L_0221b450:
    ldr r0, [r5, #0x0]
    mov r1, r8
    bl GamePhaseRuntime_GetActorCollection
    ldr r9, [r0, r10, lsl #0x2]
    cmp r9, #0x0
    beq .L_0221b494
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x4
    moveq r0, r7
    movne r0, r6
    cmp r0, #0x0
    beq .L_0221b494
    ldr r0, [r5, #0x0]
    mov r1, r11
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r9
    bl ActorCollection_QueueActorForRemoval
.L_0221b494:
    add r10, r10, #0x1
.L_0221b498:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r10, r0
    blt .L_0221b450
    mov r5, #0x0
.L_0221b4b8:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1f4]
    bl func_ov077_02216960
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0221b4b8
    mov r9, #0x0
    ldr r7, .L_0221b7c4
    mov r8, #0x8
    mov r11, r9
    mov r5, #0x60
.L_0221b4e4:
    mul r0, r9, r5
    mov r10, r11
    add r6, r0, #0xc2
.L_0221b4f0:
    ldr r0, [r7, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, r10, lsl #0x6
    add r3, r1, #0xdc
    mov r1, #0x0
    add r2, r6, #0x100
    str r8, [sp, #0x0]
    bl func_020a2614
    add r10, r10, #0x1
    cmp r10, #0x2
    blt .L_0221b4f0
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_0221b4e4
    ldr r1, .L_0221b7c8
    ldr r3, .L_0221b7cc
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221b55c
    ldr r1, .L_0221b7d0
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_0221b55c:
    str r0, [r4, #0x208]
    add r0, sp, #0x50
    mov r1, #0x200000
    mov r2, #0x100000
    mov r3, #0x20000
    bl VecFx32Object_InitComponents
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    ldr r0, .L_0221b7d0
    mov r8, #0x0
    add r7, r0, #0x1
    add r6, r0, #0x2
    ldr r0, [sp, #0x1c]
    sub r0, r0, #0x13
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x1c]
    sub r0, r0, #0x11
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x1c]
    sub r0, r0, #0xd
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x1c]
    sub r5, r0, #0x9
    sub r0, r0, #0x5
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    sub r11, r0, #0x1f
    add r0, r0, #0x1000
    str r0, [sp, #0x30]
.L_0221b5d0:
    bl genrand_int32
    mov r1, r0
    mov r2, r1, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, r2, asr #0x4
    ldr r2, .L_0221b7d4
    add r0, sp, #0x40
    add r2, r2, r3, lsl #0x2
    ldrsh r3, [r2, #0x2]
    ldr r2, [sp, #0x30]
    and r1, r2, r1, lsr #0x8
    add r2, r1, #0x4000
    add r1, r3, r3, lsl #0x1
    mov r3, #0xa000
    bl VecFx32Object_InitComponents
    mov r0, r8
    mov r1, #0x3
    bl func_020befec
    cmp r8, #0x5
    ldr r0, [sp, #0x58]
    movlt r9, #0x2
    add r0, r0, r1, lsl #0xe
    str r0, [sp, #0x58]
    movlt r10, #0x3e8
    blt .L_0221b648
    cmp r8, #0xe
    movlt r9, #0x1
    movlt r10, #0x12c
    movge r9, #0x0
    movge r10, #0x64
.L_0221b648:
    cmp r9, #0x0
    bne .L_0221b65c
    bl genrand_int32
    and r1, r0, #0x3
    b .L_0221b674
.L_0221b65c:
    cmp r9, #0x1
    movne r1, #0x6
    bne .L_0221b674
    bl genrand_int32
    and r0, r0, #0x1
    add r1, r0, #0x4
.L_0221b674:
    mov r0, r10, lsl #0x10
    mov r2, r0, asr #0x10
    add r0, sp, #0x40
    str r0, [sp, #0x0]
    ldr r0, .L_0221b7d0
    add r3, sp, #0x50
    stmib sp, {r0, r7}
    str r6, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r0, #0x7
    str r0, [sp, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    mov r0, #0x12
    bl PresentationBackedActor_Spawn
    mov r10, r0
    tst r8, #0x1
    ldrne r1, [r10, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    strneh r0, [r1, #0x24]
    mov r0, r8
    mov r1, #0xf
    bl func_020befec
    add r0, r10, #0x100
    cmp r9, #0x0
    strh r1, [r0, #0xfc]
    bne .L_0221b708
    mov r0, #0x6
    str r0, [sp, #0x0]
    ldr r2, [sp, #0x20]
    add r0, sp, #0x3c
    mov r1, r5
    mov r3, #0xa
    bl func_ov090_0221b7e0
    b .L_0221b74c
.L_0221b708:
    cmp r9, #0x1
    bne .L_0221b730
    mov r0, #0xa
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x24]
    add r0, sp, #0x3c
    mov r2, r5
    mov r3, #0xe
    bl func_ov090_0221b7e0
    b .L_0221b74c
.L_0221b730:
    mov r0, #0x14
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x2c]
    add r0, sp, #0x3c
    mov r3, #0x14
    bl func_ov090_0221b7e0
.L_0221b74c:
    ldrsb r1, [sp, #0x3c]
    add r0, sp, #0x40
    strb r1, [r10, #0x8]
    ldrsb r1, [sp, #0x3d]
    strb r1, [r10, #0x9]
    ldrsb r1, [sp, #0x3e]
    strb r1, [r10, #0xa]
    ldrsb r1, [sp, #0x3f]
    strb r1, [r10, #0xb]
    strh r11, [r10, #0x68]
    strh r11, [r10, #0x6a]
    mov r1, #0x20
    strh r1, [r10, #0x6c]
    strh r1, [r10, #0x6e]
    bl VecFx32Object_Destroy
    add r8, r8, #0x1
    cmp r8, #0x1b
    blt .L_0221b5d0
    ldr r0, .L_0221b7d8
    mov r1, #0x8
    ldr r0, [r0, #0x0]
    bl func_020594ec
    ldr r1, .L_0221b7dc
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    add r0, sp, #0x50
    bl VecFx32Object_Destroy
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221b7c4: .word data_021052fc
.L_0221b7c8: .word data_ov090_0221cc00
.L_0221b7cc: .word gHeapContext
.L_0221b7d0: .word 0x1719
.L_0221b7d4: .word data_020c9670
.L_0221b7d8: .word gSoundContext
.L_0221b7dc: .word 0xa10c
.size func_ov090_0221b428, . - func_ov090_0221b428
