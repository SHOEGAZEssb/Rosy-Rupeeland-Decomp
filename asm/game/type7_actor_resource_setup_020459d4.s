; Matching retail form; see src/game/type7_actor_resource_setup.c.
.text
.extern data_020f4e18
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateState
.global Type7Actor_SetupResources
.type Type7Actor_SetupResources, @function
Type7Actor_SetupResources: ; 0x020459d4
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r2, [r4, #0xc]
    ldr r1, .L_02045a5c
    str r2, [sp, #0x0]
    mov r5, r0
    ldr r1, [r1, #0x0]
    add r0, r5, #0x1f0
    ldmib r4, {r2, r3}
    bl func_02071ee0
    ldr r2, [r5, #0x1f0]
    mov r0, r5
    ldr r1, [r2, #0x28]
    orr r1, r1, #0x1000000
    str r1, [r2, #0x28]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldrb r1, [r4, #0x10]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1f0]
    ldr r2, [r5, #0x1f4]
    ldr r3, [r5, #0x1f8]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x54]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r0, [r5, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r4, #0x3c]
    ldrne r0, [r5, #0x54]
    strneb r1, [r0, #0x3a]
    ldmia sp!, {r3, r4, r5, pc}
.L_02045a5c: .word data_020f4e18
.size Type7Actor_SetupResources, . - Type7Actor_SetupResources
