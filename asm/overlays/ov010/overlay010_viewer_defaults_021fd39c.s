    .text
    .extern func_020b0300

/* Exact fallback; see src/overlays/ov010/overlay010_viewer_defaults.c. */
    .global func_ov010_021fd39c
func_ov010_021fd39c: ; 0x021fd39c
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    str lr, [r0, #0x158]
    mov ip, #0x1
    str lr, [r0, #0x15c]
    str ip, [r0, #0x174]
    mov r3, #0x8
    str lr, [r0, #0x178]
    orr r1, r3, r3, lsl #0x5
    orr r2, r1, r3, lsl #0xa
    str lr, [r0, #0x17c]
    add r1, r0, #0x100
    strh lr, [r1, #0x70]
    mov r1, #0x1000
    str r1, [r0, #0x164]
    str r1, [r0, #0x168]
    mov r1, #0x100
    str r1, [r0, #0x16c]
    str r3, [r0, #0x154]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    rsb r2, ip, #0x8000
    mov r1, #0x1f
    mov r3, #0x3f
    str lr, [sp, #0x0]
    bl func_020b0300
    ldmia sp!, {r3, pc}

    .size func_ov010_021fd39c, . - func_ov010_021fd39c
