.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern func_ov039_022076d0
.extern func_ov046_0220bac0
.extern func_ov049_0220bb84

.global func_0209e384
func_0209e384:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    add r1, r4, #0x80
    bl func_ov039_022076d0
    cmp r0, #0x1
    bne .L_0209e3c4
    ldr r0, [r4, #0xc]
    bl func_ov049_0220bb84
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_0209e3c4:
    ldr r0, [r4, #0xc]
    add r1, r4, #0x80
    bl func_ov046_0220bac0
    ldmia sp!, {r4, pc}
.size func_0209e384, . - func_0209e384
