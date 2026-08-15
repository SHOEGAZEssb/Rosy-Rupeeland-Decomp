.text

/* Exact fallback; see src/overlays/ov028/overlay028_lifecycle_tail.c. */
.extern data_ov028_021ff29c
.extern PresentationList_DeleteAll
.extern func_020afd0c
.extern func_ov028_021fce94
.extern func_ov028_021fe438
.extern Heap_Free


    .global func_ov028_021ff0b0
func_ov028_021ff0b0:
    stmdb sp!, {r3, lr}
    bl func_ov028_021fe438
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov028_021ff0b0, .-func_ov028_021ff0b0
    .global func_ov028_021ff0c0
func_ov028_021ff0c0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021ff118
    ldr r1, [r4, #0x280]
    ldr r0, L_021ff124
    add r1, r1, #0x1
    str r1, [r4, #0x280]
    mov r3, #0x9
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021ff118:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021ff124: .word 0x4000050
.size func_ov028_021ff0c0, .-func_ov028_021ff0c0
    .global func_ov028_021ff128
func_ov028_021ff128:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021ff144
    add r0, r0, #0x280
    bl func_ov028_021fce94
L_021ff144:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov028_021ff128, .-func_ov028_021ff128
    .global func_ov028_021ff14c
func_ov028_021ff14c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff170
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff170: .word data_ov028_021ff29c
.size func_ov028_021ff14c, .-func_ov028_021ff14c
