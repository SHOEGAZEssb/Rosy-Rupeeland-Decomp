; Matching retail form; see src/game/overlay60_object_spawn.c.
.text
.extern func_02012704
.extern func_020be328
.extern func_02072b68
.extern func_020791e0
.extern func_020337d4
.extern func_02078e98
.extern func_0201d9e4
.extern func_0201da34
.extern func_020022dc
.extern func_0200222c
.extern Heap_Alloc
.extern func_ov060_022100e4
.extern data_021f3ecc
.extern data_021f4090
.extern data_020d5e00
.extern gHeapContext
.global func_0201da9c
func_0201da9c: ; 0x0201da9c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    bl func_02012704
    mov r5, r0
    mov r0, r10
    bl func_02012704
    mov r6, r0
    mov r0, r10
    bl func_02012704
    str r0, [sp, #0x20]
    mov r0, r10
    bl func_02012704
    mov r11, r0
    mov r0, r10
    bl func_02012704
    mov r4, r0
    mov r0, r10
    bl func_0201da34
    cmp r5, #0x0
    beq L_0201db10
    mov r1, r4, lsl #0x10
    ldr r0, L_0201dbb4
    mov r1, r1, lsr #0x10
    bl func_020791e0
    b L_0201db24
L_0201db10:
    ldr r0, [r10, #0x84]
    bl func_020337d4
    ldr r0, L_0201dbb8
    mov r1, r4
    bl func_02078e98
L_0201db24:
    mov r4, r0
    mov r0, r11
    bl func_0201d9e4
    mov r5, r0
    bl func_020022dc
    ldr r2, L_0201dbbc
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_0201dbc0
    ldr r3, L_0201dbc4
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201dbac
    str r6, [sp, #0x0]
    ldr r1, [r10, #0x84]
    ldr r2, [sp, #0x48]
    ldr r1, [r1, #0x54]
    ldr r6, [sp, #0x4c]
    str r1, [sp, #0x4]
    ldr r3, [r10, #0x8c]
    mov r1, r5
    mov r3, r3, lsl #0x1e
    mov r3, r3, asr #0x1f
    str r3, [sp, #0x8]
    str r9, [sp, #0xc]
    str r8, [sp, #0x10]
    str r7, [sp, #0x14]
    str r2, [sp, #0x18]
    ldr r3, [sp, #0x20]
    mov r2, r4
    str r6, [sp, #0x1c]
    bl func_ov060_022100e4 ; func_ov061_022100e4
L_0201dbac:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_0201dbb4: .word data_021f3ecc
L_0201dbb8: .word data_021f4090
L_0201dbbc: .word 0x3c
L_0201dbc0: .word data_020d5e00
L_0201dbc4: .word gHeapContext


.size func_0201da9c, . - func_0201da9c
