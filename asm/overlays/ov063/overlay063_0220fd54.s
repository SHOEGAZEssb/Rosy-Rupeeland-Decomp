.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern GXS_SetGraphicsMode
.extern GX_HBlankIntr
.extern GX_VBlankIntr
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_ov063_022105dc
.extern data_ov063_02210608
.extern func_020a6320
.extern func_020a68dc
.extern func_020a6940
.extern func_ov063_0220fd20
.extern gGameWork
.extern gHeapContext

.global func_ov063_0220fd54
func_ov063_0220fd54:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r6, r1
    mov r4, r2
    bl Scene_Init
    ldr r1, .L_0220fea4
    add r0, r5, #0x28
    str r1, [r5, #0x0]
    bl func_020a6940
    str r6, [r5, #0x4c]
    ldr r2, [r5, #0x50]
    ldr r0, .L_0220fea8
    ldr r1, .L_0220feac
    and r2, r2, r0
    orr r0, r2, #0x8000
    and r0, r0, r1
    str r0, [r5, #0x50]
    ldrb r2, [r5, #0x54]
    mov r1, #0x16
    mov r0, #0x0
    bic r3, r2, #0x1
    and r2, r3, #0xff
    bic r2, r2, #0x2
    strb r2, [r5, #0x54]
    str r1, [r5, #0x4]
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    ldr r0, [r5, #0x50]
    cmp r4, #0x0
    bic r0, r0, #0x1
    str r0, [r5, #0x50]
    beq .L_0220fe5c
    ldr r0, .L_0220feb0
    ldr r1, .L_0220feb4
    ldr r3, .L_0220feb8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fdfc
    bl func_020a6320
.L_0220fdfc:
    str r0, [r5, #0x24]
    bl func_020a68dc
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r4, .L_0220febc
    mov r0, #0x0
    ldr r3, [r4, #0x0]
    mov r2, #0x1
    bic r3, r3, #0x1f00
    orr r3, r3, #0x1100
    str r3, [r4, #0x0]
    str r2, [sp, #0x0]
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    bl func_ov063_0220fd20
    add r2, r4, #0x8
    ldrh r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2, #0x0]
    str r0, [r2, #0x8]
    b .L_0220fe64
.L_0220fe5c:
    mov r0, #0x0
    str r0, [r5, #0x24]
.L_0220fe64:
    ldr r0, .L_0220fec0
    mov r3, #0x0
    ldr r2, [r0, #0x0]
    ldr r1, .L_0220fec4
    strh r3, [r2, #0xf6]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    mov r0, r5
    bl Scene_SetFlags03
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0220fea4: .word data_ov063_022105dc
.L_0220fea8: .word 0xffff8001
.L_0220feac: .word 0xc000ffff
.L_0220feb0: .word 0x4bc
.L_0220feb4: .word data_ov063_02210608
.L_0220feb8: .word gHeapContext
.L_0220febc: .word 0x4001000
.L_0220fec0: .word gGameWork
.L_0220fec4: .word 0x3f5
.size func_ov063_0220fd54, . - func_ov063_0220fd54
