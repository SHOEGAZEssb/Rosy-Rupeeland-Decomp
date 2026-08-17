; Matching retail form; see src/game/grid_effect_actor_touch.c.
.extern gSceneTouchInitialData
.extern func_02031758
.extern ActorAttachment_CopyTouchState
.text
    .global GridEffectActor_ApplyTouchData
GridEffectActor_ApplyTouchData:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    bl func_02031758
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_0204ee18
    ldr r0, .L_0204ee20
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    ldr r2, [r5, #0x4]
    mov r0, r4
    str r2, [sp, #0x4]
    ldr r2, [r5, #0x8]
    str r2, [sp, #0x8]
    bl ActorAttachment_CopyTouchState
.L_0204ee18:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0204ee20: .word gSceneTouchInitialData
.size GridEffectActor_ApplyTouchData, . - GridEffectActor_ApplyTouchData

