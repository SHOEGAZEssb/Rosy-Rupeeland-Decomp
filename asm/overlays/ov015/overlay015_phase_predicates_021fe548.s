    .text
    .extern data_021e9ac0
    .extern ActorDescriptorState_FindInactiveQuantity

/* Exact fallbacks for phase predicates; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global func_ov015_021fe548
    .global func_ov015_021fe560

func_ov015_021fe548:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr

    .global func_ov015_021fe560
func_ov015_021fe560:
    stmdb sp!, {r3, lr}
    ldr r0, L_021fe584
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    bl ActorDescriptorState_FindInactiveQuantity
    cmp r0, #0x63
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
L_021fe584: .word data_021e9ac0

    .size func_ov015_021fe548, func_ov015_021fe560 - func_ov015_021fe548
    .size func_ov015_021fe560, . - func_ov015_021fe560
