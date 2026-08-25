    .text
    .extern func_020befec
    .global Overlay000_GetViewRecordFromIndex
Overlay000_GetViewRecordFromIndex:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    mov r5, r1
    mov r0, r4
    mov r1, #0x5
    bl func_020befec
    str r1, [r5, #0x4]
    mov r0, r4
    mov r1, #0x5
    bl func_020befec
    str r0, [r5, #0x0]
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay000_GetViewRecordFromIndex, .-Overlay000_GetViewRecordFromIndex
