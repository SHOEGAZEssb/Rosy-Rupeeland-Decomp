.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorExtendedType2_TryCompleteAttachmentGate

.global func_ov095_0221bbcc
func_ov095_0221bbcc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_TryCompleteAttachmentGate
    add r1, r4, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, #0x0
    movne r1, #0x0
    strneb r1, [r4, #0x24c]
    ldmia sp!, {r4, pc}
.size func_ov095_0221bbcc, . - func_ov095_0221bbcc
