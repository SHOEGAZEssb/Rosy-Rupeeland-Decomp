    .text
    .extern func_020befec
    .extern IndexedSelectionController_SetValue
    .extern func_02093d50
    .global func_ov000_021fca4c
func_ov000_021fca4c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    mov r0, r5
    mov r1, #0x5
    str r5, [r4, #0x25c]
    bl func_020befec
    add r0, r4, #0x270
    bl IndexedSelectionController_SetValue
    mov r0, r5
    mov r1, #0x5
    bl func_020befec
    mov r1, r0
    ldr r0, [r4, #0x26c]
    bl func_02093d50
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    ldrne r0, [r4, #0x250]
    addne r0, r0, r5, lsl #0x5
    ldrne r0, [r0, #0x10]
    cmpne r1, r0
    movne r0, #0x100
    strneh r0, [r1, #0x32]
    movne r0, #0x0
    strne r0, [r4, #0x1c]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov000_021fca4c, .-func_ov000_021fca4c
