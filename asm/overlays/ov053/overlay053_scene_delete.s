.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern Heap_Free
.extern data_ov053_0220dd10
.extern func_02002290
.extern func_020022dc
.extern func_020055d0
.extern func_0201e28c
.extern func_02071f38
.extern func_02074330
.extern gDebugFont

.global func_ov053_0220d850
func_ov053_0220d850:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220d8a4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_0220d8a8
    ldr r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    bl func_02074330
    add r0, r4, #0x28
    bl func_02071f38
    bl func_020022dc
    mov r1, #0x0
    bl func_02002290
    add r0, r4, #0x24
    bl func_020055d0
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220d8a4: .word data_ov053_0220dd10
.L_0220d8a8: .word gDebugFont
.size func_ov053_0220d850, . - func_ov053_0220d850
