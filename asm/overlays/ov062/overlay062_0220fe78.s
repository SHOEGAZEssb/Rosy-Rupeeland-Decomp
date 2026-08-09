.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern Sound_Play
.extern data_021052fc
.extern data_ov062_02211b34
.extern data_ov062_02211b60
.extern data_ov062_02211b68
.extern data_ov062_02211b70
.extern func_02005058
.extern func_02005580
.extern func_02005c3c
.extern func_0201f864
.extern func_02072b68
.extern func_ov062_0220fd20
.extern func_ov062_0220fd30
.extern func_ov062_0220fd50
.extern func_ov062_0220fdbc
.extern func_ov062_0220fdf4
.extern func_ov062_0220fe38
.extern func_ov062_0220fe58
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

.global func_ov062_0220fe78
func_ov062_0220fe78:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r7, r3
    bl Scene_Init
    ldr r1, .L_02210150
    mov r0, #0x0
    str r1, [r6, #0x0]
    str r0, [r6, #0x34]
    ldr r0, [sp, #0x60]
    str r7, [r6, #0x38]
    str r0, [r6, #0x3c]
    ldr r0, [sp, #0x64]
    str r4, [r6, #0x40]
    str r0, [r6, #0x44]
    mov r1, #0xe
    str r1, [r6, #0x4]
    ldr r0, .L_02210154
    ldr r2, .L_02210158
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r6, #0x24]
    ldr r0, [r2, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r1, [r6, #0x24]
    ldrne r0, [r1, #0x230]
    bicne r0, r0, #0x4
    strne r0, [r1, #0x230]
    mov r1, #0x0
    ldr r0, [r6, #0x24]
    mov r2, r1
    mov r3, r1
    add r0, r0, #0x38
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r6, #0x24]
    mov r2, r1
    mov r3, r1
    add r0, r0, #0x88
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r6, #0x24]
    mov r2, r1
    mov r3, r1
    add r0, r0, #0x98
    bl func_ov062_0220fd20
    ldr r2, [r6, #0x24]
    mov r1, #0x0
    ldr r0, [r2, #0x230]
    orr r0, r0, #0x100
    str r0, [r2, #0x230]
    ldr r2, [r6, #0x24]
    ldr r0, [r2, #0x14]
    orr r0, r0, #0x2
    str r0, [r2, #0x14]
    ldr r0, [r6, #0x24]
    ldr r2, [r0, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x24]
    add r0, r0, #0x2a8
    bl func_ov062_0220fd30
    ldr r1, [r6, #0x24]
    ldr r2, .L_0221015c
    add r0, sp, #0x28
    add r1, r1, #0x18
    bl func_ov062_0220fd50
    ldr r2, .L_02210160
    add r0, sp, #0x18
    mov r1, r5
    bl func_ov062_0220fd50
    add r0, sp, #0x38
    add r1, sp, #0x28
    add r2, sp, #0x18
    bl func_ov062_0220fdbc
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005058
    ldr r1, .L_02210164
    ldr r3, .L_02210168
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fffc
    ldr r1, [r6, #0x24]
    add r3, sp, #0x38
    mov r2, r5
    add r1, r1, #0x18
    bl func_ov062_0220fdf4
.L_0220fffc:
    str r0, [r6, #0x30]
    ldr r1, [r6, #0x24]
    mov r0, r5
    add r1, r1, #0x18
    bl func_ov062_0220fe38
    add r0, r0, #0x5000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r4, r0, asr #0xd
    ldr r1, .L_0221016c
    ldr r3, .L_02210168
    mov r0, #0x10
    mov r2, #0x4
    add r4, r4, #0x1c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210050
    ldr r1, .L_02210170
    sub r2, r1, #0x12
    add r3, r1, #0x1
    bl func_02005580
.L_02210050:
    mov r2, #0x0
    str r0, [r6, #0x2c]
    str r2, [sp, #0x0]
    mov r0, #0x2
    stmib sp, {r0, r2}
    ldr r0, [r6, #0x24]
    ldr r1, [r6, #0x2c]
    ldr r0, [r0, #0x54]
    mov r3, r2
    ldr r0, [r0, #0x0]
    bl func_02005c3c
    str r0, [r6, #0x28]
    and r1, r4, #0xff
    bl func_02072b68
    ldr r0, [r6, #0x24]
    bl func_ov062_0220fe58
    cmp r0, #0x0
    beq .L_022100fc
    ldr r1, .L_02210174
    ldr r3, .L_02210168
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022100fc
    ldr r3, .L_02210178
    ldr r4, [r6, #0x24]
    add r2, r3, #0x1
    str r3, [sp, #0x0]
    mov r1, #0x40
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x41
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_022100fc:
    ldr r0, .L_0221017c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x61
    bl Sound_Play
    ldr r0, [sp, #0x68]
    cmp r0, #0x0
    bne .L_02210134
    ldr r0, .L_02210154
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xfec]
    orr r1, r1, #0x8
    str r1, [r0, #0xfec]
.L_02210134:
    mov r0, r6
    bl Scene_SetFlags03
    add r0, sp, #0x38
    bl func_02005058
    mov r0, r6
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02210150: .word data_ov062_02211b34
.L_02210154: .word data_021052fc
.L_02210158: .word gGameWork
.L_0221015c: .word 0x266
.L_02210160: .word 0xd9a
.L_02210164: .word data_ov062_02211b60
.L_02210168: .word gHeapContext
.L_0221016c: .word data_ov062_02211b68
.L_02210170: .word 0x1013
.L_02210174: .word data_ov062_02211b70
.L_02210178: .word 0x162c
.L_0221017c: .word gSoundContext
.size func_ov062_0220fe78, . - func_ov062_0220fe78
