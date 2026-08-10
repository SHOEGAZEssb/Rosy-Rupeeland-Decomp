.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_ov077_02216fc8
.extern func_020349b8
.extern ActorExtendedType2_IncrementSavedProgressCounter
.extern func_ov077_02216cac

.global func_ov077_02216960
func_ov077_02216960:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022169b0
    mov r4, r0
    ldr r3, [r1, #0x70]
    ldr r2, [r1, #0x74]
    mov r1, #0x0
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    bl func_ov077_02216cac
    mov r0, r4
    bl ActorExtendedType2_IncrementSavedProgressCounter
    ldr r1, .L_022169b4
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    ldr r1, .L_022169b8
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    ldmia sp!, {r4, pc}
.L_022169b0: .word data_ov077_02216fc8
.L_022169b4: .word 0x9f85
.L_022169b8: .word 0x9f83
.size func_ov077_02216960, . - func_ov077_02216960
