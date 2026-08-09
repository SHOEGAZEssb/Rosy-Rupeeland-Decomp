.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern Heap_Free
.extern data_ov094_02219e70
.extern func_02095308

.global func_ov094_02219bb0
func_ov094_02219bb0:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02219bd4
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02219bd4: .word data_ov094_02219e70
.size func_ov094_02219bb0, . - func_ov094_02219bb0
