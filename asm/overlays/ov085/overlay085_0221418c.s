.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214360
.extern func_ov085_02213bd0

.global func_ov085_0221418c
func_ov085_0221418c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    str r1, [r4, #0x210]
    ldr r2, [r0, #0x0]
    add r1, r4, #0x214
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r1, .L_022141c4
    mov r0, r4
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
    ldmia sp!, {r4, pc}
.L_022141c4: .word data_ov085_02214360
.size func_ov085_0221418c, . - func_ov085_0221418c
