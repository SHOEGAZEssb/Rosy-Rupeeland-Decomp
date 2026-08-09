.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov050_0220e3c0
.extern data_ov050_0220e3e8
.extern func_02005030
.extern func_0201e250
.extern func_02071ea4
.extern func_02071ee0
.extern func_020742cc
.extern func_ov050_0220d824
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global func_ov050_0220db84
func_ov050_0220db84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0201e250
    ldr r1, .L_0220dc94
    add r0, r10, #0x8
    str r1, [r10, #0x0]
    bl func_02071ea4
    mov r1, r5
    add r0, r10, #0x30
    str r6, [r10, #0x2c]
    bl func_02005030
    mov r0, #0x0
    str r0, [r10, #0x40]
    str r0, [r10, #0x44]
    str r0, [r10, #0x48]
    str r0, [r10, #0x54]
    ldr r3, .L_0220dc98
    str r4, [r10, #0x58]
    ldr r1, .L_0220dc9c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x8
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, .L_0220dca0
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r10, #0x14]
    ldr r0, .L_0220dca4
    ldr r0, [r0, #0x0]
    bl func_020742cc
    mov r9, #0x0
    ldr r7, .L_0220dca8
    ldr r11, .L_0220dcac
    str r0, [r10, #0x18]
    add r5, r10, #0x30
    mov r4, r9
    mov r8, #0x38
    mov r6, #0x4
.L_0220dc30:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220dc60
    str r5, [sp, #0x0]
    ldr r1, [r10, #0x14]
    ldr r2, [r10, #0x18]
    add r3, r10, #0x8
    bl func_ov050_0220d824
.L_0220dc60:
    add r1, r10, r9, lsl #0x2
    add r9, r9, #0x1
    str r0, [r1, #0x1c]
    str r4, [r0, #0x30]
    cmp r9, #0x4
    blt .L_0220dc30
    ldr r0, .L_0220dcb0
    str r4, [r10, #0x44]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0220dcb4
    bl GameWork_ClearFlag
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220dc94: .word data_ov050_0220e3c0
.L_0220dc98: .word 0x1616
.L_0220dc9c: .word data_020f4e18
.L_0220dca0: .word data_020f4e14
.L_0220dca4: .word gDebugFont
.L_0220dca8: .word data_ov050_0220e3e8
.L_0220dcac: .word gHeapContext
.L_0220dcb0: .word gGameWork
.L_0220dcb4: .word 0x21b
.size func_ov050_0220db84, . - func_ov050_0220db84
