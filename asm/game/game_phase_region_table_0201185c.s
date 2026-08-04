; Matching retail form; see src/game/game_phase_region_table_load.c.
.text
.extern GameFile_Destroy
.extern GameFile_Init
.extern GameFile_Open
.extern GameFile_Read
.extern GameFile_Seek
.extern MI_CpuCopy8
.extern MI_UncompressLZ8
.extern OS_Halt
.extern data_020d5640
.extern data_020d5654
.extern data_020d565c
.extern func_02003e20
.extern func_02003e38
.extern func_02011584
.extern func_0201166c
.extern gHeapContext

    .global func_0201185c
func_0201185c: ; 0x0201185c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4c
    mov r5, r1
    ldr r1, [r5, #0x30]
    mov r7, r0
    cmp r1, #0x0
    bne L_02011888
    mov r1, #0x0
    bl func_02011584
    mov r0, #0x0
    b L_020119b0
L_02011888:
    add r0, sp, #0x0
    bl GameFile_Init
    ldr r1, L_020119b8
    add r0, sp, #0x0
    bl GameFile_Open
    cmp r0, #0x0
    bne L_020118a8
    bl OS_Halt
L_020118a8:
    ldr r0, [r5, #0x34]
    ldr r1, L_020119bc
    ldr r3, L_020119c0
    mvn r2, #0x3
    bl func_02003e20
    mov r4, r0
    ldr r1, [r5, #0x30]
    add r0, sp, #0x0
    mov r2, #0x0
    bl GameFile_Seek
    ldr r2, [r5, #0x34]
    add r0, sp, #0x0
    mov r1, r4
    bl GameFile_Read
    ldr r0, [r4, #0x0]
    ldr r1, L_020119c4
    mov r6, r0, lsr #0x8
    add r0, r6, r6, lsr #0x1f
    mov r0, r0, asr #0x1
    ldr r3, L_020119c0
    mov r0, r0, lsl #0x1
    mvn r2, #0x3
    bl func_02003e20
    mov r5, r0
    mov r0, r4
    mov r1, r5
    bl MI_UncompressLZ8
    add r0, r5, #0x4
    mov r1, r5
    sub r2, r6, #0x4
    bl MI_CpuCopy8
    mov r6, r6, lsr #0x3
    mov r0, r7
    mov r1, r6
    bl func_0201166c
    mov r0, #0x0
    b L_0201198c
L_0201193c:
    mov r3, r0, lsl #0x2
    mov r1, r3, lsl #0x1
    ldrsh r2, [r5, r1]
    ldr r1, [r7, #0x0]
    mov ip, r0, lsl #0x3
    strh r2, [r1, ip]
    add r3, r5, r3, lsl #0x1
    ldr r1, [r7, #0x0]
    ldrsh r2, [r3, #0x2]
    add r1, r1, r0, lsl #0x3
    strh r2, [r1, #0x2]
    ldr r1, [r7, #0x0]
    ldrsh r2, [r3, #0x4]
    add r1, r1, r0, lsl #0x3
    strh r2, [r1, #0x4]
    ldr r1, [r7, #0x0]
    ldrsh r2, [r3, #0x6]
    add r1, r1, r0, lsl #0x3
    add r0, r0, #0x1
    strh r2, [r1, #0x6]
L_0201198c:
    cmp r0, r6
    blt L_0201193c
    mov r0, r4
    bl func_02003e38
    mov r0, r5
    bl func_02003e38
    add r0, sp, #0x0
    bl GameFile_Destroy
    mov r0, #0x1
L_020119b0:
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, pc}
L_020119b8: .word data_020d5640
L_020119bc: .word data_020d5654
L_020119c0: .word gHeapContext
L_020119c4: .word data_020d565c
    .size func_0201185c, . - func_0201185c

