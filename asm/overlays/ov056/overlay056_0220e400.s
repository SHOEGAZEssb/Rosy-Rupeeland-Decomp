.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern GXS_SetGraphicsMode
.extern GameFile_Close
.extern GameFile_Destroy
.extern GameFile_GetLength
.extern GameFile_Init
.extern GameFile_Open
.extern GameFile_Read
.extern GameString_Concat
.extern GameString_Destroy
.extern GameString_InitCString
.extern data_ov056_0220f6e4
.extern data_ov056_0220f6ec
.extern data_ov056_0220f6f4
.extern Heap_DestroyRoot
.extern func_02003e20
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_020af7e8
.extern func_020b57d4
.extern func_ov056_0220e6dc
.extern func_ov056_0220e75c
.extern func_ov056_0220e828
.extern func_ov056_0220e9a0
.extern func_ov056_0220ee78
.extern func_ov056_0220f330
.extern func_ov056_0220f374
.extern gHeapContext

.global func_ov056_0220e400
func_ov056_0220e400:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x88
    mov r6, r0
    add r0, r6, #0x4
    add r0, r0, #0x800
    mov r5, r1
    mov r4, r2
    bl VecFx32Object_Init
    add r0, r6, #0x1c
    mov r1, #0x0
    str r1, [r6, #0x814]
    add r0, r0, #0x800
    str r1, [r6, #0x818]
    bl func_ov056_0220f330
    mov r0, #0x0
    str r0, [r6, #0x82c]
    str r0, [r6, #0x830]
    str r0, [r6, #0x834]
    str r0, [r6, #0x838]
    add r0, r6, #0x3c
    add r0, r0, #0x800
    bl func_ov056_0220e6dc
    add r0, r6, #0x4c
    add r0, r0, #0x800
    bl GameFile_Init
    add r0, r6, #0x98
    add r0, r0, #0x800
    bl VecFx32Object_Init
    mov r0, #0x0
    str r0, [r6, #0x8a8]
    bl Heap_DestroyRoot
    add r0, sp, #0x3c
    bl GameFile_Init
    mov r1, r5
    add r0, sp, #0x24
    mov r2, #0x0
    bl GameString_InitCString
    ldr r1, .L_0220e680
    add r0, sp, #0x1c
    mov r2, #0x0
    bl GameString_InitCString
    add r0, sp, #0x14
    add r1, sp, #0x24
    add r2, sp, #0x1c
    bl GameString_Concat
    ldr r1, [sp, #0x18]
    add r0, sp, #0x3c
    bl GameFile_Open
    add r0, sp, #0x14
    bl GameString_Destroy
    add r0, sp, #0x1c
    bl GameString_Destroy
    add r0, sp, #0x3c
    bl GameFile_GetLength
    ldr r1, .L_0220e684
    ldr r3, .L_0220e688
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    bl func_02003e20
    str r0, [r6, #0x0]
    add r0, sp, #0x3c
    bl GameFile_GetLength
    mov r2, r0
    ldr r1, [r6, #0x0]
    add r0, sp, #0x3c
    bl GameFile_Read
    add r0, sp, #0x3c
    bl GameFile_Close
    ldr r1, .L_0220e68c
    add r0, sp, #0xc
    mov r2, #0x0
    bl GameString_InitCString
    add r0, sp, #0x4
    add r1, sp, #0x24
    add r2, sp, #0xc
    bl GameString_Concat
    add r0, r6, #0x4c
    ldr r1, [sp, #0x8]
    add r0, r0, #0x800
    bl GameFile_Open
    add r0, sp, #0x4
    bl GameString_Destroy
    add r0, sp, #0xc
    bl GameString_Destroy
    add r0, r6, #0x4c
    add r0, r0, #0x800
    add r1, sp, #0x2
    mov r2, #0x2
    bl GameFile_Read
    add r0, r6, #0x4c
    add r0, r0, #0x800
    add r1, sp, #0x0
    mov r2, #0x2
    bl GameFile_Read
    ldrh r1, [sp, #0x2]
    add r0, r6, #0x1c
    add r0, r0, #0x800
    str r1, [r6, #0x834]
    ldrh r2, [sp, #0x0]
    str r2, [r6, #0x838]
    bl func_ov056_0220f374
    add r0, r6, #0x14
    add r0, r0, #0x800
    mov r1, #0x10
    bl func_ov056_0220e75c
    mov r1, #0x0
    mov r0, r1
.L_0220e5ac:
    mov r5, r1, lsr #0x1f
    rsb r3, r5, r1, lsl #0x1e
    mov r2, r0
    add lr, r5, r3, ror #0x1e
.L_0220e5bc:
    mov r5, r2, lsr #0x1f
    rsb r3, r5, r2, lsl #0x1e
    add ip, r5, r3, ror #0x1e
    add r3, r2, r1, lsl #0x2
    add r2, r2, #0x1
    ldr r5, [r6, #0x814]
    add ip, ip, lr, lsl #0x2
    str ip, [r5, r3, lsl #0x2]
    cmp r2, #0x4
    blt .L_0220e5bc
    add r1, r1, #0x1
    cmp r1, #0x4
    blt .L_0220e5ac
    mov r1, #0x0
    add r0, sp, #0x2c
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r6, #0x4
    add r1, sp, #0x2c
    add r0, r0, #0x800
    bl VecFx32Object_Assign
    add r0, sp, #0x2c
    bl VecFx32Object_Destroy
    mov r0, r6
    bl func_ov056_0220e9a0
    cmp r4, #0x0
    beq .L_0220e650
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x4
    bl func_ov056_0220e828
    mov r0, r6
    bl func_ov056_0220ee78
.L_0220e650:
    bl func_020af7e8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x8000
    bl func_020b57d4
    add r0, sp, #0x24
    bl GameString_Destroy
    add r0, sp, #0x3c
    bl GameFile_Destroy
    mov r0, r6
    add sp, sp, #0x88
    ldmia sp!, {r4, r5, r6, pc}
.L_0220e680: .word data_ov056_0220f6e4
.L_0220e684: .word data_ov056_0220f6ec
.L_0220e688: .word gHeapContext
.L_0220e68c: .word data_ov056_0220f6f4
.size func_ov056_0220e400, . - func_ov056_0220e400
