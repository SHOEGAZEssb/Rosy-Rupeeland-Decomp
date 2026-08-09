.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_ov063_022105dc
.extern func_02002290
.extern func_020022dc
.extern func_02005058
.extern func_020a6390
.extern gGameWork

.global func_ov063_0220ff48
func_ov063_0220ff48:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220ffc4
    mov r5, r0
    str r1, [r5, #0x0]
    bl Scene_ClearFlags03
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    beq .L_0220ff78
    mov r0, r4
    bl func_020a6390
    mov r0, r4
    bl Heap_Free
.L_0220ff78:
    mov r1, #0x0
    ldr r0, .L_0220ffc8
    str r1, [r5, #0x24]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0220ffcc
    bl GameWork_ClearFlag
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    add r0, r5, #0x38
    bl func_02005058
    add r0, r5, #0x28
    bl func_02005058
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ffc4: .word data_ov063_022105dc
.L_0220ffc8: .word gGameWork
.L_0220ffcc: .word 0x3f5
.size func_ov063_0220ff48, . - func_ov063_0220ff48
