    .text
    .extern func_020befec
    .extern IndexedSelectionController_SetValue
    .extern InventoryScroll_SetSelectedRow
    .global Overlay001_SetSelection
Overlay001_SetSelection: ; 0x021fc758
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    mov r0, r5
    mov r1, #0x5
    str r5, [r4, #0x1ac]
    bl func_020befec
    add r0, r4, #0x1c0
    bl IndexedSelectionController_SetValue
    mov r0, r5
    mov r1, #0x5
    bl func_020befec
    mov r1, r0
    ldr r0, [r4, #0x1bc]
    bl InventoryScroll_SetSelectedRow
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    ldrne r0, [r4, #0x20c]
    addne r0, r0, r5, lsl #0x5
    ldrne r0, [r0, #0x10]
    cmpne r1, r0
    movne r0, #0x100
    strneh r0, [r1, #0x32]
    movne r0, #0x0
    strne r0, [r4, #0x1c]
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay001_SetSelection, .-Overlay001_SetSelection
