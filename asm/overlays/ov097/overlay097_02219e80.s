.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Heap_Free
.extern data_ov097_0221aaa4
.extern func_02052318
.extern func_ov097_02219aa8

.global func_ov097_02219e80
func_ov097_02219e80:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02219eb8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x204]
    cmp r0, #0x0
    beq .L_02219ea0
    bl func_ov097_02219aa8
.L_02219ea0:
    mov r0, r4
    bl func_02052318
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02219eb8: .word data_ov097_0221aaa4
.size func_ov097_02219e80, . - func_ov097_02219e80
