.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221a504
func_ov090_0221a504:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0221a510:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x1f4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0221a510
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov090_0221a504, . - func_ov090_0221a504
