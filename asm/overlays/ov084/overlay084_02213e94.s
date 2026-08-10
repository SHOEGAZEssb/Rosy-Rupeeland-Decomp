.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_ov084_02214640
.extern ActorExtendedType2_Init

.global func_ov084_02213e94
func_ov084_02213e94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02213ebc
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x98]
    ldmia sp!, {r4, pc}
.L_02213ebc: .word data_ov084_02214640
.size func_ov084_02213e94, . - func_ov084_02213e94
