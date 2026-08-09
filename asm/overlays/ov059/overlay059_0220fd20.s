.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_02071ea4

.global func_ov059_0220fd20
func_ov059_0220fd20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x44
    str r1, [r4, #0x0]
    bl func_02071ea4
    mov r1, #0x0
    str r1, [r4, #0x50]
    str r1, [r4, #0x54]
    str r1, [r4, #0x58]
    str r1, [r4, #0x5c]
    str r1, [r4, #0x60]
    str r1, [r4, #0x64]
    str r1, [r4, #0x68]
    mov r0, r4
    str r1, [r4, #0x6c]
    ldmia sp!, {r4, pc}
.size func_ov059_0220fd20, . - func_ov059_0220fd20
