.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern Actor_RestoreSavedFlags

.global func_ov075_022157c8
func_ov075_022157c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    ldr r0, .L_02215828
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r3, [r0, #0x58]
    ldr r1, [r0, #0x5c]
    mov r2, #0x2
    str r3, [r4, #0x218]
    str r1, [r4, #0x21c]
    ldr r3, [r0, #0x60]
    ldr r0, [r0, #0x64]
    add r1, r4, #0x200
    str r3, [r4, #0x220]
    str r0, [r4, #0x224]
    ldr r3, [r4, #0xd0]
    mov r0, #0x0
    bic r3, r3, #0x200
    str r3, [r4, #0xd0]
    strh r2, [r4, #0xd6]
    strh r0, [r1, #0x5a]
    ldmia sp!, {r4, pc}
.L_02215828: .word data_ov075_02217290
.size func_ov075_022157c8, . - func_ov075_022157c8
