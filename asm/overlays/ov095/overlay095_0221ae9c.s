.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov095_0221ae14

.global func_ov095_0221ae9c
func_ov095_0221ae9c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, #0x0
    mov r6, r0
    mov r5, r4
.L_0221aeac:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x304]
    bl func_ov095_0221ae14
    cmp r0, #0x0
    add r5, r5, #0x1
    addne r4, r4, #0x1
    cmp r5, #0x2
    blt .L_0221aeac
    cmp r4, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov095_0221ae9c, . - func_ov095_0221ae9c
