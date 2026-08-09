.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern Heap_Free
.extern data_ov087_022189e0
.extern func_02031488
.extern func_0203b61c

.global func_ov087_022178dc
func_ov087_022178dc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217930
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_02217918
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217918:
    mov r0, r4
    bl func_0203b61c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217930: .word data_ov087_022189e0
.size func_ov087_022178dc, . - func_ov087_022178dc
