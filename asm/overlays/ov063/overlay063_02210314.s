.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern Heap_Free
.extern func_020a6390

.global func_ov063_02210314
func_ov063_02210314:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_0221033c
    mov r0, r4
    bl func_020a6390
    mov r0, r4
    bl Heap_Free
.L_0221033c:
    mov r0, #0x0
    str r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov063_02210314, . - func_ov063_02210314
