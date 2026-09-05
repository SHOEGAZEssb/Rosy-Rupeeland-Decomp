; Matching retail form; see src/game/type7_actor_idle_control.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e1788
.extern data_020e18d0
.extern gGamePhaseRuntime
.extern ActorMotionJitter_EnsureMinimum
.extern Type7Actor_TryCancelDistantTarget
.extern Type7Actor_TryInstallGlobalTargetCallback
.extern Type7Actor_SetCallbackPair
.extern Type7Actor_TryAcquireTarget
.extern Type7Actor_TryInteractWithNearbyType4Object
.extern Type7Actor_ClearTarget
.extern AuxiliaryInteraction_Destroy
.extern func_0206cc68
.extern AuxiliaryInteraction_MergeFrom
.extern gGameWork
.global Type7Actor_DisableTargeting
.global Type7Actor_HandleResourceInteraction
.global Type7Actor_UpdateIdleTargeting
.global Type7Actor_UpdateIdleTargetingWithType4Scan
.type Type7Actor_DisableTargeting, @function
.type Type7Actor_HandleResourceInteraction, @function
.type Type7Actor_UpdateIdleTargeting, @function
.type Type7Actor_UpdateIdleTargetingWithType4Scan, @function

Type7Actor_DisableTargeting: ; 0x02048c10
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Type7Actor_ClearTarget
    ldr r0, [r4, #0x268]
    orr r0, r0, #0x10000
    str r0, [r4, #0x268]
    ldmia sp!, {r4, pc}

Type7Actor_HandleResourceInteraction: ; 0x02048c2c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r4, #0x234]
    mov r0, r1
    cmp r2, #0x0
    beq .L_02048ce4
    mov r1, r2
    bl AuxiliaryInteraction_MergeFrom
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_02048c78
    mov r0, r5
    bl AuxiliaryInteraction_Destroy
    mov r0, r5
    bl Heap_Free
.L_02048c78:
    ldr r0, .L_02048d4c
    ldr r1, .L_02048d50
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r2, #0x0
    ldr r1, .L_02048d54
    str r2, [r4, #0x234]
    sub r3, r2, #0x1
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0x6
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_02048d58
    mov r1, #0x28
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    ldmia sp!, {r3, r4, r5, pc}
.L_02048ce4:
    mov r1, r4
    mov r2, #0x1
    bl func_0206cc68
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, .L_02048d5c
    mov r0, r4
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0x6
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_02048d58
    mov r1, #0x28
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    ldmia sp!, {r3, r4, r5, pc}
.L_02048d4c: .word gGameWork
.L_02048d50: .word 0x3fd
.L_02048d54: .word data_020e1788
.L_02048d58: .word gGamePhaseRuntime
.L_02048d5c: .word data_020e18d0

Type7Actor_UpdateIdleTargeting: ; 0x02048d60
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    bl Type7Actor_TryInstallGlobalTargetCallback
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl Type7Actor_TryCancelDistantTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl Type7Actor_TryAcquireTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0xb
    movge r0, #0x1
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}

Type7Actor_UpdateIdleTargetingWithType4Scan: ; 0x02048dd0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    bl Type7Actor_TryInstallGlobalTargetCallback
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl Type7Actor_TryCancelDistantTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl Type7Actor_TryAcquireTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02048e4c
    mov r0, r4
    bl Type7Actor_TryInteractWithNearbyType4Object
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_02048e4c:
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0xb
    movge r0, #0x2
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}

.size Type7Actor_DisableTargeting, Type7Actor_HandleResourceInteraction - Type7Actor_DisableTargeting
.size Type7Actor_HandleResourceInteraction, Type7Actor_UpdateIdleTargeting - Type7Actor_HandleResourceInteraction
.size Type7Actor_UpdateIdleTargeting, Type7Actor_UpdateIdleTargetingWithType4Scan - Type7Actor_UpdateIdleTargeting
.size Type7Actor_UpdateIdleTargetingWithType4Scan, . - Type7Actor_UpdateIdleTargetingWithType4Scan

