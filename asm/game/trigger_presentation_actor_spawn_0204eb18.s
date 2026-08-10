; Matching retail form; see src/game/trigger_presentation_actor_spawn.c.
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_SpawnActorFromDescriptor
.extern ActorSpawnDescriptor_Init
.extern func_0204ea8c
.text

    .global func_0204eb18
func_0204eb18: ; 0x0204eb18
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0xb0
    ldr r5, [sp, #0xc0]
    ldr r4, [sp, #0xc4]
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r4, #0x2
    str r4, [sp, #0x8]
    mov ip, #0x0
    str ip, [sp, #0xc]
    ldr r4, [r2, #0x4]
    mov lr, r0
    mov r0, r4, asr #0xc
    str r0, [sp, #0x10]
    ldr r0, [r2, #0x8]
    mov r4, r1
    mov r0, r0, asr #0xc
    str r0, [sp, #0x14]
    ldr r0, [r2, #0xc]
    ldr r1, [sp, #0xc8]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x18]
    str r1, [sp, #0x1c]
    ldr r0, [sp, #0xcc]
    mov r2, lr
    str r0, [sp, #0x20]
    str ip, [sp, #0x24]
    str ip, [sp, #0x28]
    str ip, [sp, #0x2c]
    str ip, [sp, #0x30]
    str ip, [sp, #0x34]
    mov r0, #0xff
    str r0, [sp, #0x38]
    str ip, [sp, #0x3c]
    str ip, [sp, #0x40]
    str ip, [sp, #0x44]
    add r0, sp, #0x4c
    mov r1, #0x4
    str ip, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0204ebf0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    mov r5, r0
    mov r1, r4
    bl func_0204ea8c
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x100
    str r0, [r5, #0x10]
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, pc}
.L_0204ebf0: .word data_021052fc
.size func_0204eb18, . - func_0204eb18

