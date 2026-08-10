.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Type7Actor_ProcessGlobalInteractionTrigger
.extern TrackedResourceActor_PostUpdate

.global func_ov097_0221a05c
func_ov097_0221a05c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Type7Actor_ProcessGlobalInteractionTrigger
    mov r0, r5
    mov r1, r4
    bl TrackedResourceActor_PostUpdate
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov097_0221a05c, . - func_ov097_0221a05c
