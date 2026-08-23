.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov077_022174c8
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseMetadata_GetByIndex
.extern ActorCollection_GetSpriteGroup
.extern ActorExtendedType2_InitializePresentation
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_020b57d4
.extern func_ov090_0221bc84
.extern func_ov090_0221c3dc
.extern func_ov090_0221c440
.extern func_ov090_0221c44c
.extern gHeapContext

.global func_ov077_02212d04
func_ov077_02212d04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x50
    mov r6, r0
    bl ActorExtendedType2_InitializePresentation
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2A
    mov r3, r0, lsl #0x10
    add r1, sp, #0x10
    mov r0, #0x0
    mov r2, #0x40
    mov r4, r3, asr #0x10
    bl func_020b57d4
    ldr r1, .L_02212e38
    ldr r3, .L_02212e3c
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02212dac
    ldr r0, .L_02212e40
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, .L_02212e40
    mov r7, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    mov r2, r0
    add r0, r6, #0x18
    str r0, [sp, #0x0]
    mov r0, #0x6000
    stmib sp, {r0, r4}
    add r3, sp, #0x10
    str r3, [sp, #0xc]
    ldr r3, [r6, #0x210]
    mov r1, r7
    mov r0, r5
    bl func_ov090_0221bc84
    mov r5, r0
.L_02212dac:
    mov r0, r5
    mov r1, #0x1
    str r5, [r6, #0x298]
    bl func_ov090_0221c3dc
    ldr r0, .L_02212e40
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x1
    bl GamePhaseMetadata_GetByIndex
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    beq .L_02212e24
    mov r4, #0x0
    b .L_02212e14
.L_02212df0:
    ldr r0, [r6, #0x298]
    mov r1, r4
    bl func_ov090_0221c440
    ldr r0, [r0, #0x4]
    add r4, r4, #0x1
    ldr r1, [r0, #0x8]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x14
    strh r0, [r1, #0x24]
.L_02212e14:
    ldr r0, [r6, #0x298]
    bl func_ov090_0221c44c
    cmp r4, r0
    blt .L_02212df0
.L_02212e24:
    ldr r0, [r6, #0x238]
    add r0, r0, #0x20000
    str r0, [r6, #0x24]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02212e38: .word data_ov077_022174c8
.L_02212e3c: .word gHeapContext
.L_02212e40: .word data_021052fc
.size func_ov077_02212d04, . - func_ov077_02212d04
