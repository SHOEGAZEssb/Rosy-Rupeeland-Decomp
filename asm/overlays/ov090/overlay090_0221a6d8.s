.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_event_callback_a6d8.c.
.extern func_ov090_0221a784

.global func_ov090_0221a6d8
func_ov090_0221a6d8:
    stmdb sp!, {r3, lr}
    ldrb r3, [r0, #0x1ec]
    cmp r3, #0xb
    ldreqb r2, [r0, #0x247]
    cmpeq r2, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, [r1, #0x1fc]
    ldrsh r2, [r2, #0x0]
    cmp r2, #0x13
    beq .L_0221a714
    cmp r2, #0x14
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x15
    beq .L_0221a728
    ldmia sp!, {r3, pc}
.L_0221a714:
    ldr r2, [r0, #0x0]
    mov r1, #0x64
    ldr r2, [r2, #0xc4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0221a728:
    cmp r3, #0xb
    ldmneia sp!, {r3, pc}
    bl func_ov090_0221a784
    ldmia sp!, {r3, pc}
.size func_ov090_0221a6d8, . - func_ov090_0221a6d8
