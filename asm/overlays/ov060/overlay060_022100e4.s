.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Heap_Alloc
.extern Scene_GetEmbedded10
.extern Scene_Init
.extern Scene_SetFlags03
.extern TouchRegionManager_NotifyAll
.extern TouchRegionManager_SetEnabled
.extern data_ov060_02210620
.extern data_ov060_02210654
.extern DebugHud_GetCurrentRectangle
.extern DebugHudState_Open
.extern DebugHudState_SetRectangle
.extern DebugHudState_GetGlobal
.extern func_ov060_0220ff1c
.extern func_ov060_022101fc
.extern gHeapContext

.global func_ov060_022100e4
func_ov060_022100e4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl Scene_Init
    ldr r1, .L_022101f0
    mvn r0, #0x0
    str r1, [r7, #0x0]
    str r0, [r7, #0x28]
    mov r1, #0x0
    str r1, [r7, #0x2c]
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    str r0, [r7, #0x30]
    str r1, [r7, #0x34]
    ldr r0, [sp, #0x48]
    ldr r1, [sp, #0x4c]
    str r0, [r7, #0x38]
    mov r0, r7
    str r1, [r7, #0x3c]
    bl Scene_SetFlags03
    add r0, sp, #0xc
    bl DebugHud_GetCurrentRectangle
    mov r1, #0x0
    add r0, sp, #0xc
    mov r2, r1
    bl func_ov060_022101fc
    bl DebugHudState_GetGlobal
    add r1, sp, #0xc
    bl DebugHudState_SetRectangle
    bl DebugHudState_GetGlobal
    mov r1, r6
    mov r2, r5
    mov r3, #0x1
    bl DebugHudState_Open
    ldr r1, .L_022101f4
    ldr r3, .L_022101f8
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022101c0
    ldrh r2, [sp, #0x3c]
    ldrh r1, [sp, #0x40]
    ldr r3, [sp, #0x30]
    str r2, [sp, #0x0]
    ldrh r5, [sp, #0x44]
    str r1, [sp, #0x4]
    mov r1, r7
    add r2, r4, #0x80
    add r3, r3, #0x90
    str r5, [sp, #0x8]
    bl func_ov060_0220ff1c
.L_022101c0:
    str r0, [r7, #0x24]
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, #0x0
    bl TouchRegionManager_SetEnabled
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, #0x0
    bl TouchRegionManager_NotifyAll
    mov r0, r7
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_022101f0: .word data_ov060_02210620
.L_022101f4: .word data_ov060_02210654
.L_022101f8: .word gHeapContext
.size func_ov060_022100e4, . - func_ov060_022100e4
