.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern Heap_Free
.extern data_ov084_022141c8
.extern func_0200637c
.extern func_0203e494

.global func_ov084_02212ba0
func_ov084_02212ba0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02212be4
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x2a4]
    cmp r4, #0x0
    beq .L_02212bcc
    mov r0, r4
    bl func_0200637c
    mov r0, r4
    bl Heap_Free
.L_02212bcc:
    mov r0, r5
    bl func_0203e494
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02212be4: .word data_ov084_022141c8
.size func_ov084_02212ba0, . - func_ov084_02212ba0
