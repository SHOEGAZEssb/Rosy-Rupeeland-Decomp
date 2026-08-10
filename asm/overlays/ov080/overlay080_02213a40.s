.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern ActorExtendedType2_InitializeReentryState
.extern func_ov080_02213a8c

.global func_ov080_02213a40
func_ov080_02213a40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_InitializeReentryState
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov080_02213a8c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov080_02213a8c
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov080_02213a8c
    ldmia sp!, {r4, pc}
.size func_ov080_02213a40, . - func_ov080_02213a40
