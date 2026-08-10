; Matching retail form; see src/game/actor_extended_type2_scene_interaction.c.
.text
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern func_0203392c
.extern func_02038d38
.extern func_02039c3c
.extern func_02048378
.extern gSceneManager
.global ActorExtendedType2_UpdateSceneInteraction
.type ActorExtendedType2_UpdateSceneInteraction, @function
ActorExtendedType2_UpdateSceneInteraction: ; 0x0204344c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, .L_0204352c
    mov r6, r0
    ldr r0, [r2, #0x0]
    mov r5, r1
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_0204351c
    ldr r0, .L_02043530
    ldr r1, [r6, #0x260]
    ldr r0, [r0, #0x0]
    tst r1, #0x2
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea8]
    beq .L_020434a8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020434ac
.L_020434a8:
    mov r0, #0x0
.L_020434ac:
    cmp r0, #0x0
    cmpne r4, #0x0
    beq .L_0204351c
    ldr r0, [r4, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0204351c
    ldr r0, .L_02043530
    mov r1, r6
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl func_02039c3c
    cmp r0, #0x0
    beq .L_0204351c
    ldr r0, .L_02043530
    add r1, r6, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0x14
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r3, #0x0
    bl func_02038d38
    mov r0, r4
    mov r1, r6
    bl func_02048378
.L_0204351c:
    mov r0, r6
    mov r1, r5
    bl func_0203392c
    ldmia sp!, {r4, r5, r6, pc}
.L_0204352c: .word gSceneManager
.L_02043530: .word data_021052fc

    .global ActorExtendedType2_UpdateDescriptorQueryFlags
.size ActorExtendedType2_UpdateSceneInteraction, . - ActorExtendedType2_UpdateSceneInteraction
