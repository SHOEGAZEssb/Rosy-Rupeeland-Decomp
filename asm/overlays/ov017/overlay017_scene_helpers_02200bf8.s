    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_helpers.c. */
    .extern data_021e9ac0
    .extern ActorDescriptorState_FindInactiveQuantity
.global Overlay017_HasGlobalValueReachedLimit
Overlay017_HasGlobalValueReachedLimit:
    stmdb sp!, {r3, lr}
    ldr r0, L_02200c1c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    bl ActorDescriptorState_FindInactiveQuantity
    cmp r0, #0x63
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
L_02200c1c: .word data_021e9ac0
    .size Overlay017_HasGlobalValueReachedLimit, . - Overlay017_HasGlobalValueReachedLimit
