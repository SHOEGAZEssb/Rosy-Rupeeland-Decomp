.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern Heap_Free
.extern func_ov039_021fd71c

.global func_0209e2f4
func_0209e2f4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x14]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_0209e31c
    mov r0, r4
    bl func_ov039_021fd71c
    mov r0, r4
    bl Heap_Free
.L_0209e31c:
    mov r0, #0x0
    str r0, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.size func_0209e2f4, . - func_0209e2f4
