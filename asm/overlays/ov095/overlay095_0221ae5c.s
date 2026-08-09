.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov095_0221ae14

.global func_ov095_0221ae5c
func_ov095_0221ae5c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, #0x0
    mov r5, #0x2
.L_0221ae6c:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x304]
    bl func_ov095_0221ae14
    cmp r0, #0x0
    add r5, r5, #0x1
    addne r4, r4, #0x1
    cmp r5, #0x4
    blt .L_0221ae6c
    cmp r4, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov095_0221ae5c, . - func_ov095_0221ae5c
