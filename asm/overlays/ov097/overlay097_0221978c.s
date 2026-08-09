.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_0204067c
.extern func_ov097_022177e0
.extern gGameWork

.global func_ov097_0221978c
func_ov097_0221978c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x2bc]
    mov r4, r1
    cmp r0, #0x4b0
    bge .L_022197cc
    add r0, r0, #0x1
    str r0, [r5, #0x2bc]
    cmp r0, #0x384
    bne .L_022197cc
    ldr r0, .L_022197dc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    ldr r2, [r5, #0x2b8]
    mov r3, r1
    bl func_ov097_022177e0
.L_022197cc:
    mov r0, r5
    mov r1, r4
    bl func_0204067c
    ldmia sp!, {r3, r4, r5, pc}
.L_022197dc: .word gGameWork
.size func_ov097_0221978c, . - func_ov097_0221978c
