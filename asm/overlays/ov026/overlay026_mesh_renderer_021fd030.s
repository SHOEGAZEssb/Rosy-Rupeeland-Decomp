.text

/* Exact fallback; see src/overlays/ov026/overlay026_mesh_renderer.c. */
.extern data_020c9670
.extern data_020f4e18
.extern data_ov026_022042fc
.extern data_ov026_022042fe
.extern data_ov026_02204928
.extern data_ov026_02204a40
.extern data_ov026_02204a48
.extern Heap_AllocCore
.extern Graphics3DResourceBinding_Init
.extern Graphics3DResourceBinding_GetTextureFormat
.extern Graphics3DResourceBinding_GetTextureWidthClass
.extern Graphics3DResourceBinding_GetTextureHeightClass
.extern func_020949ec
.extern func_020afddc
.extern func_020afe00
.extern func_020afe28
.extern func_020afe64
.extern func_020afebc
.extern func_020aff38
.extern func_020aff78
.extern func_020b241c
.extern func_020b24cc
.extern func_020b4554
.extern func_ov026_021fd018
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fd030
func_ov026_021fd030:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    mov r4, r1
    mov r6, r2
    bl func_020949ec
    ldr r0, L_021fd248
    ldr r1, L_021fd24c
    ldr r3, L_021fd250
    str r0, [r10, #0x0]
    mov r5, #0x1000
    mov r0, #0x18
    mov r2, #0x4
    str r5, [r10, #0xb8]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd09c
    ldr r1, L_021fd254
    mov r5, r6, lsl #0x3
    ldrh r3, [r1, r5]
    ldr r2, L_021fd258
    ldr r1, L_021fd25c
    str r3, [sp, #0x0]
    ldrh r3, [r2, r5]
    ldr r1, [r1, #0x0]
    mov r2, r4
    bl Graphics3DResourceBinding_Init
L_021fd09c:
    ldr r1, L_021fd260
    str r0, [r10, #0x9c]
    ldr r3, L_021fd250
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_AllocCore
    str r0, [r10, #0xb4]
    mov r1, r0
    add r0, r10, #0xa0
    mov r2, #0x200
    bl func_020b24cc
    mov r2, #0x0
    mov r1, #0x1
    str r2, [sp, #0x0]
    mov r0, #0x1f
    stmib sp, {r0, r2}
    mov r3, r1
    add r0, r10, #0xa0
    bl func_020afebc
    ldr r6, [r10, #0x9c]
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r5, r0
    ldr r0, [r10, #0x9c]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r4, r0
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureHeightClass
    str r0, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r3, r4
    ldr r4, [r6, #0x10]
    mov r1, r5
    ldr r4, [r4, #0xc]
    add r0, r10, #0xa0
    str r4, [sp, #0x10]
    bl func_020afe64
    ldr r0, [r10, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r4, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r2, r0
    mov r1, r4
    add r0, r10, #0xa0
    bl func_020afe28
    add r0, r10, #0xa0
    mov r1, #0x2
    bl func_020afe00
    mov r4, #0x80000
    ldr r5, L_021fd264
    mov r6, #0x0
    rsb r4, r4, #0x0
    mov r11, #0x1000
L_021fd180:
    mov r1, r6, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    mov r3, r2, lsl #0x1
    mov r1, r6, lsl #0x14
    mov r0, r1, asr #0x3
    add r2, r5, r2, lsl #0x1
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    mov r7, r0, lsl #0x2
    ldrsh r9, [r2, #0x2]
    ldrsh r8, [r5, r3]
    mov r1, r7
    mov r2, r4
    add r0, r10, #0xa0
    bl func_020aff78
    add r0, r10, #0xa0
    mov r1, r8
    mov r2, r11
    mov r3, r9
    bl func_020aff38
    mov r1, r7
    add r0, r10, #0xa0
    mov r2, #0x100000
    bl func_020aff78
    mov r1, r8
    mov r3, r9
    add r0, r10, #0xa0
    mov r2, #0x0
    bl func_020aff38
    add r6, r6, #0x1
    cmp r6, #0x10
    ble L_021fd180
    add r0, r10, #0xa0
    bl func_020afddc
    add r0, r10, #0xa0
    bl func_020b241c
    ldr r4, [r10, #0xa8]
    add r0, r10, #0xa0
    bl func_ov026_021fd018
    mov r1, r0
    mov r0, r4
    bl func_020b4554
    mov r0, r10
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd248: .word data_ov026_02204928
L_021fd24c: .word data_ov026_02204a40
L_021fd250: .word gHeapContext
L_021fd254: .word data_ov026_022042fe
L_021fd258: .word data_ov026_022042fc
L_021fd25c: .word data_020f4e18
L_021fd260: .word data_ov026_02204a48
L_021fd264: .word data_020c9670
.size func_ov026_021fd030, .-func_ov026_021fd030

