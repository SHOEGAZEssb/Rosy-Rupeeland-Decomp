; Matching retail form; see src/game/actor_extended_type2_target_bind_effect.c.
.text
.extern Heap_Alloc
.extern data_020df9e8
.extern gActorExtendedType2SpritePresentationAllocationTag
.extern AuxiliaryTimedSpritePresentation_Init
.extern func_020ada8c
.extern gHeapContext
.extern genrand_int32
.global ActorExtendedType2_BindTargetAndSpawnEffect
.type ActorExtendedType2_BindTargetAndSpawnEffect, @function
ActorExtendedType2_BindTargetAndSpawnEffect: ; 0x020422f4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    ldr r2, .L_020423b8
    mov r5, r0
    ldr r3, [r2, #0x1e8]
    ldr r0, [r2, #0x1ec]
    mov r4, r1
    str r3, [r5, #0x218]
    str r0, [r5, #0x21c]
    ldr r1, .L_020423bc
    ldr r3, .L_020423c0
    add ip, r5, #0x200
    mov r6, #0x0
    mov r0, #0x14
    mov r2, #0x4
    strh r6, [ip, #0x54]
    bl Heap_Alloc
    movs r6, r0
    beq .L_0204239c
    bl genrand_int32
    ldr r2, [r5, #0x54]
    bic r0, r0, #0x80000000
    mov r1, #0x3
    ldr r7, [r2, #0x0]
    bl func_020ada8c
    ldr ip, .L_020423c4
    and r1, r0, #0xff
    mov r0, r6
    mov r2, r7
    str ip, [sp, #0x0]
    add r3, ip, #0x1
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x12
    sub r3, ip, #0x1
    str r1, [sp, #0xc]
    sub r1, r1, #0x13
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    add r1, r5, #0x18
    bl AuxiliaryTimedSpritePresentation_Init
.L_0204239c:
    str r4, [r5, #0x228]
    mov r0, #0x0
    str r0, [r5, #0x264]
    strb r0, [r5, #0x268]
    strb r0, [r5, #0x269]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020423b8: .word data_020df9e8
.L_020423bc: .word gActorExtendedType2SpritePresentationAllocationTag
.L_020423c0: .word gHeapContext
.L_020423c4: .word 0x135c
.size ActorExtendedType2_BindTargetAndSpawnEffect, . - ActorExtendedType2_BindTargetAndSpawnEffect
