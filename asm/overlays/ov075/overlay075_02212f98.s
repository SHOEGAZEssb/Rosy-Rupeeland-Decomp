.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_020349b8
.extern ActorExtendedType2_SpawnOptionalPresentation

.global func_ov075_02212f98
func_ov075_02212f98:
    stmdb sp!, {r4, lr}
    mov r1, #0x57
    mov r2, #0x0
    mov r4, r0
    bl func_020349b8
    mov r2, #0x100
    mov r0, r4
    sub r3, r2, #0x114
    mov r1, #0x0
    bl ActorExtendedType2_SpawnOptionalPresentation
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x100
    mov r3, #0x14
    bl ActorExtendedType2_SpawnOptionalPresentation
    ldmia sp!, {r4, pc}
.size func_ov075_02212f98, . - func_ov075_02212f98
