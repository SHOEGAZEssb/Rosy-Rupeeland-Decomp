.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_ov077_02217118
.extern func_02005058
.extern func_0203e494

.global func_ov077_02212c18
func_ov077_02212c18:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02212c60
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02212c40
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02212c40:
    add r0, r4, #0x2b4
    bl func_02005058
    add r0, r4, #0x2a4
    bl func_02005058
    mov r0, r4
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02212c60: .word data_ov077_02217118
.size func_ov077_02212c18, . - func_ov077_02212c18
