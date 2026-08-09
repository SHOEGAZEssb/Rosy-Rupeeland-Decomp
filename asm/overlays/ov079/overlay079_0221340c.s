.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern func_ov079_0221329c
.extern func_ov079_02213310

.global func_ov079_0221340c
func_ov079_0221340c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x24]
    ldr r1, [r5, #0x1dc]
    cmp r2, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov079_02213310
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov079_0221329c
    mov r0, r4
    mov r1, r5
    bl func_ov079_0221329c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov079_0221340c, . - func_ov079_0221340c
