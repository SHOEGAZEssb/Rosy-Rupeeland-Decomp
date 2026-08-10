.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern Actor_RestoreSavedFlags

.global func_ov075_02216b5c
func_ov075_02216b5c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    ldr r0, .L_02216bb4
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r3, [r0, #0x38]
    ldr r2, [r0, #0x3c]
    mov r1, #0x2
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r3, [r0, #0x90]
    ldr r2, [r0, #0x94]
    mov r0, #0x0
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    ldr r2, [r4, #0xd0]
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_02216bb4: .word data_ov075_02217290
.size func_ov075_02216b5c, . - func_ov075_02216b5c
