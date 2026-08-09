.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Free
.extern data_ov054_0220f130
.extern func_02002290
.extern func_020022dc
.extern func_02005058
.extern func_02006280
.extern func_0201e28c

.global func_ov054_0220e704
func_ov054_0220e704:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220e758
    mov r4, r0
    str r1, [r4, #0x0]
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0xe000
    str r0, [r1, #0x0]
    bl func_020022dc
    mov r1, #0x1
    bl func_02002290
    add r0, r4, #0x1a8
    bl func_02006280
    add r0, r4, #0x194
    bl func_02005058
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e758: .word data_ov054_0220f130
.size func_ov054_0220e704, . - func_ov054_0220e704
