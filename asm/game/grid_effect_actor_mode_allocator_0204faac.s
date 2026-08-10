; Matching retail form; see src/game/grid_effect_actor_mode_allocator.c.
.extern gGridEffectActorRuntimeState
.text
    .global GridEffectActorModeAllocator_Reserve
GridEffectActorModeAllocator_Reserve:
    ldr r0, .L_0204faf8
    mov ip, #0x0
    ldr r0, [r0, #0x4]
    mov r3, #0x1
    b .L_0204fae8
.L_0204fac0:
    tst r0, r3, lsl ip
    bne .L_0204fae4
    ldr r1, .L_0204faf8
    mov r0, ip, lsl #0x18
    ldr r2, [r1, #0x4]
    mov r0, r0, asr #0x18
    orr r2, r2, r3, lsl ip
    str r2, [r1, #0x4]
    bx lr
.L_0204fae4:
    add ip, ip, #0x1
.L_0204fae8:
    cmp ip, #0xc
    blt .L_0204fac0
    mvn r0, #0x0
    bx lr
.L_0204faf8: .word gGridEffectActorRuntimeState
.size GridEffectActorModeAllocator_Reserve, . - GridEffectActorModeAllocator_Reserve

