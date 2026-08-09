.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern Heap_Free
.extern data_ov090_0221cc68
.extern func_02005058

.global func_ov090_0221baa8
func_ov090_0221baa8:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221bae8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0221bad0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221bad0:
    add r0, r4, #0x8
    bl func_02005058
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221bae8: .word data_ov090_0221cc68
.size func_ov090_0221baa8, . - func_ov090_0221baa8
