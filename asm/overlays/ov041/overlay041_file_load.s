.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_resource_transition.c. */
.extern GameFile_Close
.extern GameFile_Destroy
.extern GameFile_GetLength
.extern GameFile_Init
.extern GameFile_Open
.extern GameFile_Read
.extern OS_Halt
.extern data_ov041_02205984
.extern func_02003e20
.extern gHeapContext

    .global func_ov041_021fe088
func_ov041_021fe088: ; 0x021fe088
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4c
    mov r6, r0
    add r0, sp, #0x0
    mov r4, r2
    mov r5, r1
    bl GameFile_Init
    add r0, sp, #0x0
    mov r1, r4
    bl GameFile_Open
    cmp r0, #0x0
    bne .L_021fe0bc
    bl OS_Halt
.L_021fe0bc:
    add r0, sp, #0x0
    bl GameFile_GetLength
    ldr r1, .L_021fe108
    ldr r3, .L_021fe10c
    mvn r2, #0x3
    mov r4, r0
    bl func_02003e20
    add r1, r6, r5, lsl #0x2
    str r0, [r1, #0x168]
    mov r1, r0
    add r0, sp, #0x0
    mov r2, r4
    bl GameFile_Read
    add r0, sp, #0x0
    bl GameFile_Close
    add r0, sp, #0x0
    bl GameFile_Destroy
    add sp, sp, #0x4c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021fe108: .word data_ov041_02205984
.L_021fe10c: .word gHeapContext
    .size func_ov041_021fe088, . - func_ov041_021fe088

