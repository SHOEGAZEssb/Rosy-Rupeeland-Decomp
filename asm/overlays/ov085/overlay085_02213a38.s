.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_02004fe0
.extern func_020adfbc

.global func_ov085_02213a38
func_ov085_02213a38:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r5, r1
    mov r6, r0
    bl func_02004fe0
    cmp r4, #0x0
    addne r4, r4, #0x4
    cmp r5, #0x0
    addne r5, r5, #0x4
    mov r0, r5
    mov r1, r4
    add r2, r6, #0x4
    bl func_020adfbc
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov085_02213a38, . - func_ov085_02213a38
