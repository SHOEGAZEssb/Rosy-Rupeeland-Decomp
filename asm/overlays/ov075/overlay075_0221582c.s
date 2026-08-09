.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290

.global func_ov075_0221582c
func_ov075_0221582c:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x260]
    mov r1, #0x8
    bic r2, r2, #0x1
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    mov r1, #0x16
    strh r1, [r0, #0xd6]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0x5a]
    sub r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldrsh r2, [r1, #0x5a]
    cmp r2, #0x0
    bge .L_02215894
    ldr r2, .L_0221589c
    mov r3, #0x0
    ldr lr, [r2, #0x98]
    ldr ip, [r2, #0x9c]
    str lr, [r0, #0x218]
    str ip, [r0, #0x21c]
    ldr ip, [r2, #0x0]
    ldr r2, [r2, #0x4]
    str ip, [r0, #0x220]
    str r2, [r0, #0x224]
    strh r3, [r1, #0x5a]
.L_02215894:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0221589c: .word data_ov075_02217290
.size func_ov075_0221582c, . - func_ov075_0221582c
