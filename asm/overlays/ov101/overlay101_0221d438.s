.text
; Matching fallback for the portable implementation in src/overlays/ov101/overlay101_recovery.c.
.extern Heap_Free
.extern Scene_Destroy
.extern data_ov101_0221d658
.extern func_02002290
.extern func_020022dc

.global func_ov101_0221d438
func_ov101_0221d438:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221d46c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020022dc
    mov r1, #0x3
    bl func_02002290
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221d46c: .word data_ov101_0221d658
.size func_ov101_0221d438, . - func_ov101_0221d438
