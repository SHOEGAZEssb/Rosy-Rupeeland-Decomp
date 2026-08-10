; Matching retail form; see src/game/type7_actor_destructor.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e16b0
.extern data_020e1c38
.extern data_021052fc
.extern gType7ActorRegistry
.extern VecFx32Object_Destroy
.extern ActorDerivedType1_SetSpecialModeEnabled
.extern ActorDerivedRuntime_DestroyAlternate
.extern Type7MarkerPresentation_Destroy
.extern func_0206c978
.extern gGameWork
.global Type7Actor_Destroy
.type Type7Actor_Destroy, @function
Type7Actor_Destroy: ; 0x02045724
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02045860
    mov r4, r0
    ldr r0, .L_02045864
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    cmp r0, #0x0
    beq .L_02045754
    mov r1, #0x0
    bl ActorDerivedType1_SetSpecialModeEnabled
.L_02045754:
    mov r2, #0x0
    ldr r1, .L_02045868
    b .L_02045778
.L_02045760:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r0, r4
    moveq r0, #0x0
    streq r0, [r1, r2, lsl #0x2]
    beq .L_02045780
    add r2, r2, #0x1
.L_02045778:
    cmp r2, #0x3
    blt .L_02045760
.L_02045780:
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_0204579c
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_0204579c:
    ldr r0, .L_0204586c
    ldr r1, .L_02045870
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x1
    bne .L_02045828
    ldr r0, [r4, #0x268]
    tst r0, #0x10000
    beq .L_020457dc
    ldr r0, .L_02045874
    mvn r1, #0x0
    str r1, [r0, #0x2b4]
    mov r1, #0x0
    str r1, [r0, #0x2b8]
    b .L_020457fc
.L_020457dc:
    ldr r1, [r4, #0x1fc]
    ldr r0, .L_02045874
    str r1, [r0, #0x2bc]
    ldr r0, [r4, #0x268]
    tst r0, #0x10
    movne r1, #0x1
    ldr r0, .L_02045874
    moveq r1, #0x0
.L_020457fc:
    str r1, [r0, #0x2d0]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x7e]
    ldr r0, .L_02045874
    str r1, [r0, #0x2c0]
    ldr r1, [r4, #0x1c]
    mov r1, r1, asr #0xc
    str r1, [r0, #0x2c4]
    ldr r1, [r4, #0x20]
    mov r1, r1, asr #0xc
    str r1, [r0, #0x2c8]
.L_02045828:
    add r0, r4, #0x2a8
    bl Type7MarkerPresentation_Destroy
    add r0, r4, #0x284
    bl VecFx32Object_Destroy
    add r0, r4, #0x26c
    bl VecFx32Object_Destroy
    add r0, r4, #0x224
    bl VecFx32Object_Destroy
    add r0, r4, #0x214
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02045860: .word data_020e1c38
.L_02045864: .word data_021052fc
.L_02045868: .word gType7ActorRegistry
.L_0204586c: .word gGameWork
.L_02045870: .word 0x3fd
.L_02045874: .word data_020e16b0
.size Type7Actor_Destroy, . - Type7Actor_Destroy
