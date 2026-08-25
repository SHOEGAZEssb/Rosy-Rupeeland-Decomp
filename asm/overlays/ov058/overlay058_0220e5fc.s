.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern MIi_CpuClearFast
.extern data_ov058_0220fce4
.extern Heap_AllocAlternateEntry
.extern gHeapContext

.global func_ov058_0220e5fc
func_ov058_0220e5fc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220e634
    mov r4, r0
    ldr r3, .L_0220e638
    mov r0, #0xc000
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r4, #0x0]
    mov r1, r0
    mov r0, #0x0
    mov r2, #0xc000
    bl MIi_CpuClearFast
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e634: .word data_ov058_0220fce4
.L_0220e638: .word gHeapContext
.size func_ov058_0220e5fc, . - func_ov058_0220e5fc
