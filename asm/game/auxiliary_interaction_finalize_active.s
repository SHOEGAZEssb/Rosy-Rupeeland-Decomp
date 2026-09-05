.text
; Matching fallback for the portable implementation in src/game/auxiliary_interaction_finalize_active.c.
.extern ActorAttachmentManager_FinalizeRewards
.extern AuxiliaryInteraction_FinalizeResult

.global func_0206e590
func_0206e590:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x1a]
    mov r4, r1
    cmp r0, #0x1
    ldmhiia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x44]
    bl ActorAttachmentManager_FinalizeRewards
    cmp r4, #0x0
    movne r1, #0x0
    moveq r1, #0x1
    mov r0, r5
    bl AuxiliaryInteraction_FinalizeResult
    ldmia sp!, {r3, r4, r5, pc}
.size func_0206e590, . - func_0206e590
