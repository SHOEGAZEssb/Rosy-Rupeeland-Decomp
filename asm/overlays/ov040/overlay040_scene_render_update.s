    .text
/* Exact fallback; see overlay040_scene_render_update.c for portable C. */
    .extern __construct_array
    .extern __destroy_arr
    .extern data_020c9670
    .extern data_ov040_02203810
    .extern data_ov040_02203854
    .extern data_ov040_0220385e
    .extern data_ov040_022038a0
    .extern VecFx32Object_Init
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_InitCopy
    .extern VecFx32Object_Destroy
    .extern VecFx32Object_Assign
    .extern VecFx32Object_Add
    .extern VecFx32Object_Subtract
    .extern func_0209a2ac
    .extern Graphics3dPresentation_BeginFrame
    .extern func_0209b7ec
    .extern func_0209bd14
    .extern func_0209c1bc
    .extern func_0209c9d4
    .extern func_0209ca90
    .extern func_020adc40
    .extern func_020adc90
    .extern func_020b1784
    .extern func_020befec
    .extern func_ov040_021ff3f4
    .extern func_ov040_02200108
    .extern func_ov040_022021dc
    .extern func_ov040_0220332c
    .global func_ov040_022013e0
func_ov040_022013e0: ; 0x022013e0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x33c
    sub sp, sp, #0x400
    mov r7, r1
    mov r6, r2
    mov r1, #0x0
    mov r2, #0x1
    mov r10, r0
    bl func_0209a2ac
    add r0, sp, #0x19c
    mov r1, r6
    bl VecFx32Object_InitCopy
    add r0, sp, #0x19c
    mov r1, r7
    bl VecFx32Object_Add
    ldr r0, [r10, #0xb44]
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xb48]
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xb4c]
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xb50]
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
    add r0, sp, #0x19c
    mov r1, r6
    bl VecFx32Object_Assign
    ldr r1, [r10, #0xb44]
    add r0, sp, #0x18c
    bl func_ov040_02200108
    ldr r0, [sp, #0x190]
    ldr r1, [sp, #0x1a0]
    sub r0, r0, #0x80000
    mov r2, r0, asr #0xc
    mov r0, r2, asr #0x2
    add r0, r2, r0, lsr #0x1d
    mov r5, r0, asr #0x3
    add r0, r1, r5, lsl #0xc
    str r0, [sp, #0x1a0]
    ldr r0, [r7, #0x8]
    mov r1, #0x3
    mov r0, r0, asr #0xc
    bl func_020befec
    ldr r2, [sp, #0x1a4]
    add r1, sp, #0x19c
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x1a4]
    ldr r0, [r10, #0xac0]
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xac4]
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xb10]
    cmp r0, #0x0
    beq .L_022014ec
    add r1, sp, #0x19c
    mov r2, #0x1
    bl func_0209a2ac
.L_022014ec:
    mov r0, #0x4
    sub r8, r0, #0x1
    mov r4, #0x1
.L_022014f8:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0xae8]
    mov r1, r7
    mov r2, r4
    bl func_0209a2ac
    subs r8, r8, #0x1
    bpl .L_022014f8
    mov r1, #0x0
    add r0, sp, #0x17c
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, [r10, #0xba0]
    add r1, sp, #0x17c
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0x3
    sub r4, r0, #0x1
    add r9, sp, #0x17c
    mov r8, #0x1
.L_02201548:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0xbc4]
    mov r1, r9
    mov r2, r8
    bl func_0209a2ac
    subs r4, r4, #0x1
    bpl .L_02201548
    ldr r0, [r7, #0x8]
    ldr r1, [r6, #0x8]
    mov r2, r0, asr #0xc
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r1, r1, asr #0xc
    add r1, r1, r0, asr #0x2
    add r2, r1, #0x18
    ldr r0, .L_022021a4
    ldr r1, .L_022021a8
    and r0, r0, r2, lsl #0x10
    str r0, [r1, #0x0]
    ldr r0, [r7, #0x8]
    mov r1, #0x3
    mov r0, r0, asr #0xc
    bl func_020befec
    ldr r2, [r6, #0x8]
    ldr r1, .L_022021ac
    add r0, r0, r2, asr #0xc
    ldr r2, [r6, #0x4]
    add r3, r5, #0x40
    add r3, r3, r2, asr #0xc
    add r2, r0, #0x8
    mov r0, r1, lsl #0x10
    and r3, r3, r1
    and r1, r0, r2, lsl #0x10
    ldr r0, .L_022021b0
    orr r1, r3, r1
    str r1, [r0, #0x0]
    ldr r1, [r10, #0x48]
    ldr r0, [r7, #0x8]
    ldr r8, [r1, #0x10]
    mov r0, r0, asr #0xc
    mov r1, #0x3
    bl func_020befec
    add r0, r0, #0x8
    mov r2, r0, lsl #0xc
    add r1, sp, #0x19c
    mov r0, r8
    str r2, [sp, #0x1a4]
    bl Graphics3dPresentation_BeginFrame
    mov r0, r8
    mov r1, #0x0
    bl func_0209b7ec
    ldr r1, .L_022021b4
    add r0, sp, #0x600
    ldrh r4, [r1, #0x0]
    ldrh r3, [r1, #0x2]
    ldr r2, [r1, #0x2c]
    ldr r1, [r1, #0x30]
    add r0, r0, #0xec
    strh r4, [sp, #0x30]
    strh r3, [sp, #0x32]
    str r2, [sp, #0x28]
    str r1, [sp, #0x2c]
    bl VecFx32Object_Init
    add r0, sp, #0x600
    add r0, r0, #0xfc
    bl VecFx32Object_Init
    add r0, sp, #0x700
    add r0, r0, #0xc
    bl VecFx32Object_Init
    add r0, sp, #0x700
    add r0, r0, #0x1c
    bl VecFx32Object_Init
    add r0, sp, #0x700
    add r0, r0, #0x2c
    bl VecFx32Object_Init
    ldr r0, [r10, #0xb3c]
    mov r6, #0x1000
    cmp r0, #0x1
    bgt .L_022016dc
    ldr r2, [r10, #0xb40]
    cmp r0, #0x0
    moveq r2, #0x0
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r3, r0, asr #0x2
    mov r0, #0x12
    mul r1, r2, r0
    cmp r3, #0x6
    movlt r3, #0x6
    ldr r0, .L_022021b8
    cmp r3, #0x1f
    movgt r3, #0x1f
    sub r1, r0, r1
    orr r2, r3, r3, lsl #0x5
    orr r2, r2, r3, lsl #0xa
    cmp r1, #0x1000
    movlt r1, #0x1000
    mov r0, #0x1000
    strh r2, [sp, #0x30]
    bl func_020adc90
    mov r6, r0
.L_022016dc:
    ldr r4, .L_022021bc
    add r0, sp, #0x500
    ldr r3, .L_022021c0
    add r0, r0, #0x1c
    mov r1, #0x1d
    mov r2, #0x10
    str r4, [sp, #0x0]
    bl __construct_array
    ldr r3, .L_022021c0
    add r0, sp, #0x34c
    mov r1, #0x1d
    mov r2, #0x10
    str r4, [sp, #0x0]
    bl __construct_array
    mov r7, #0x0
    add r4, r10, #0x84
    mvn r11, #0x0
.L_02201720:
    add r0, r10, r7
    add r0, r0, #0x600
    ldrsb r5, [r0, #0x24]
    cmp r5, r11
    ble .L_0220184c
    add r0, sp, #0x34c
    add r9, r0, r5, lsl #0x4
    add r0, sp, #0x500
    add r0, r0, #0x1c
    add r0, r0, r7, lsl #0x4
    mov r1, r9
    str r0, [sp, #0x10]
    bl VecFx32Object_Assign
    add r0, sp, #0x64
    add r1, r4, r7, lsl #0x4
    mov r2, r9
    bl func_ov040_022021dc
    add r0, sp, #0x34c
    add r0, r0, r7, lsl #0x4
    add r1, sp, #0x64
    str r0, [sp, #0xc]
    bl VecFx32Object_Assign
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r0, sp, #0x500
    add r0, r0, #0x1c
    add r1, r0, r5, lsl #0x4
    add r0, sp, #0x16c
    bl VecFx32Object_InitCopy
    mov r1, r9
    add r0, sp, #0x15c
    bl VecFx32Object_InitCopy
    add r0, sp, #0x14c
    add r1, sp, #0x15c
    add r2, sp, #0x16c
    bl func_ov040_021ff3f4
    mov r1, #0xc
    mla r1, r7, r1, r10
    ldr r3, [sp, #0x150]
    ldr r2, [r1, #0x2e0]
    ldr r5, [sp, #0x154]
    smull ip, r9, r3, r2
    adds r3, ip, #0x800
    adc r2, r9, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [sp, #0x150]
    ldr r2, [r1, #0x2e0]
    ldr r3, [sp, #0x158]
    smull ip, r9, r5, r2
    adds r5, ip, #0x800
    adc r2, r9, #0x0
    mov r5, r5, lsr #0xc
    orr r5, r5, r2, lsl #0x14
    str r5, [sp, #0x154]
    ldr r2, [r1, #0x2e0]
    ldr r0, [sp, #0x10]
    smull r9, r5, r3, r2
    adds r3, r9, #0x800
    adc r2, r5, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r1, sp, #0x14c
    str r3, [sp, #0x158]
    bl VecFx32Object_Subtract
    ldr r0, [sp, #0xc]
    add r1, sp, #0x14c
    bl VecFx32Object_Subtract
    add r0, sp, #0x14c
    bl VecFx32Object_Destroy
    add r0, sp, #0x15c
    bl VecFx32Object_Destroy
    add r0, sp, #0x16c
    bl VecFx32Object_Destroy
    b .L_022018a4
.L_0220184c:
    add r5, r4, r7, lsl #0x4
    add r0, sp, #0x54
    mov r1, r5
    add r2, r10, #0x74
    bl func_ov040_022021dc
    add r0, sp, #0x500
    add r0, r0, #0x1c
    add r0, r0, r7, lsl #0x4
    add r1, sp, #0x54
    bl VecFx32Object_Assign
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
    mov r1, r5
    add r0, sp, #0x44
    add r2, r10, #0x74
    bl func_ov040_022021dc
    add r0, sp, #0x34c
    add r0, r0, r7, lsl #0x4
    add r1, sp, #0x44
    bl VecFx32Object_Assign
    add r0, sp, #0x44
    bl VecFx32Object_Destroy
.L_022018a4:
    add r7, r7, #0x1
    cmp r7, #0x1d
    blt .L_02201720
    add r0, r10, #0x660
    str r0, [sp, #0x18]
    ldrh r0, [sp, #0x30]
    mov r7, #0x0
    str r0, [sp, #0x14]
    mvn r0, #0x0
    str r0, [sp, #0x1c]
.L_022018cc:
    add r0, r10, r7, lsl #0x4
    ldr r1, [r0, #0x444]
    add r2, r10, r7, lsl #0x2
    str r1, [sp, #0x12c]
    ldr r1, [r0, #0x448]
    add r5, r10, r7
    str r1, [sp, #0x130]
    ldr r4, [r0, #0x444]
    ldr r3, [r0, #0x44c]
    add r1, r5, #0x600
    add r3, r4, r3
    str r3, [sp, #0x134]
    ldr r3, [r0, #0x448]
    str r3, [sp, #0x138]
    ldr r3, [r0, #0x444]
    str r3, [sp, #0x13c]
    ldr r4, [r0, #0x448]
    ldr r3, [r0, #0x450]
    add r3, r4, r3
    str r3, [sp, #0x140]
    ldr r4, [r0, #0x444]
    ldr r3, [r0, #0x44c]
    add r3, r4, r3
    str r3, [sp, #0x144]
    ldr r3, [r0, #0x448]
    ldr r0, [r0, #0x450]
    add r0, r3, r0
    str r0, [sp, #0x148]
    ldr r0, [r2, #0x264]
    str r0, [sp, #0x28]
    ldr r0, [r2, #0x264]
    str r0, [sp, #0x2c]
    ldrsb r1, [r1, #0x24]
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    ble .L_02201c64
    add r0, sp, #0x10c
    bl VecFx32Object_Init
    add r0, sp, #0x11c
    bl VecFx32Object_Init
    add r1, sp, #0x500
    add r1, r1, #0x1c
    add r0, sp, #0x10c
    add r1, r1, r7, lsl #0x4
    bl VecFx32Object_Assign
    add r1, sp, #0x34c
    add r0, sp, #0x11c
    add r1, r1, r7, lsl #0x4
    bl VecFx32Object_Assign
    mov r0, #0xc
    mla r4, r7, r0, r10
    ldr r0, [r4, #0x2dc]
    cmp r0, #0x0
    beq .L_02201a98
    add r0, sp, #0xfc
    add r1, sp, #0x11c
    add r2, sp, #0x10c
    bl func_ov040_021ff3f4
    ldr r2, [sp, #0x104]
    ldr r9, [sp, #0x100]
    smull r1, r0, r2, r2
    ldr r11, [sp, #0x108]
    smull r3, r2, r9, r9
    smull ip, r9, r11, r11
    adds r11, ip, #0x800
    adc ip, r9, #0x0
    mov r9, r11, lsr #0xc
    adds r11, r3, #0x800
    adc r3, r2, #0x0
    mov r2, r11, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    adds r3, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    orr r9, r9, ip, lsl #0x14
    add r0, r2, r1
    add r0, r9, r0
    bl func_020adc40
    cmp r0, #0x0
    ble .L_02201a90
    mov r0, #0xc
    mla r0, r7, r0, r10
    ldr r2, [sp, #0x100]
    ldr r1, [r0, #0x2dc]
    ldr r3, [sp, #0x104]
    smull r11, r9, r2, r1
    adds r2, r11, #0x800
    adc r1, r9, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x100]
    ldr r1, [r0, #0x2dc]
    ldr r2, [sp, #0x108]
    smull r11, r9, r3, r1
    adds r3, r11, #0x800
    adc r1, r9, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    str r3, [sp, #0x104]
    ldr r1, [r0, #0x2dc]
    add r0, sp, #0x10c
    smull r9, r3, r2, r1
    adds r2, r9, #0x800
    adc r1, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, sp, #0xfc
    str r2, [sp, #0x108]
    bl VecFx32Object_Subtract
    add r0, sp, #0x11c
    add r1, sp, #0xfc
    bl VecFx32Object_Subtract
.L_02201a90:
    add r0, sp, #0xfc
    bl VecFx32Object_Destroy
.L_02201a98:
    ldr r0, [r4, #0x2e4]
    cmp r0, #0x0
    beq .L_02201b98
    add r0, sp, #0xec
    add r1, sp, #0x11c
    add r2, sp, #0x10c
    bl func_ov040_021ff3f4
    ldr r1, [sp, #0xf4]
    ldr r0, [sp, #0xf0]
    smull r3, r2, r1, r1
    smull r4, r1, r0, r0
    mov r0, #0x800
    adds r4, r4, r0
    mov r0, #0x0
    adc r1, r1, r0
    mov r0, r4, lsr #0xc
    adds r3, r3, #0x800
    orr r0, r0, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    mov r4, r0
    cmp r4, #0x0
    ble .L_02201b90
    ldr r0, [sp, #0xf4]
    mov r1, r4
    bl func_020adc90
    mov r1, r4
    rsb r4, r0, #0x0
    ldr r0, [sp, #0xf0]
    bl func_020adc90
    mov r1, #0xc
    mla r1, r7, r1, r10
    ldr r3, [r1, #0x2e4]
    ldr r1, [sp, #0x110]
    smull r9, r2, r4, r3
    smull r4, r3, r0, r3
    mov r0, #0x800
    adds r9, r9, r0
    mov r0, #0x0
    adc r0, r2, r0
    mov r2, r9, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r1, r1, r2
    mov r0, #0x800
    str r1, [sp, #0x110]
    ldr r1, [sp, #0x120]
    adds r4, r4, r0
    mov r0, #0x0
    adc r3, r3, r0
    mov r0, r4, lsr #0xc
    add r1, r1, r2
    orr r0, r0, r3, lsl #0x14
    ldr r3, [sp, #0x114]
    str r1, [sp, #0x120]
    add r3, r3, r0
    ldr r1, [sp, #0x124]
    str r3, [sp, #0x114]
    add r0, r1, r0
    str r0, [sp, #0x124]
.L_02201b90:
    add r0, sp, #0xec
    bl VecFx32Object_Destroy
.L_02201b98:
    cmp r7, #0x10
    bne .L_02201bb0
    add r0, sp, #0x600
    add r0, r0, #0xec
    add r1, sp, #0x10c
    bl VecFx32Object_Assign
.L_02201bb0:
    cmp r7, #0xd
    bne .L_02201bc8
    add r0, sp, #0x600
    add r0, r0, #0xfc
    add r1, sp, #0x10c
    bl VecFx32Object_Assign
.L_02201bc8:
    cmp r7, #0x3
    ldr r1, [sp, #0x14]
    cmpne r7, #0x16
    bne .L_02201c00
    ldr r0, [r10, #0x860]
    cmp r0, #0x0
    beq .L_02201c00
    mov r0, r0, asr #0x1
    rsb r1, r0, #0x1f
    mov r0, r1, lsl #0x5
    orr r0, r0, #0x1f
    orr r0, r0, r1, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
.L_02201c00:
    ldrb r0, [r5, #0x642]
    cmp r0, #0x0
    beq .L_02201c28
    mov r0, #0x2
    stmia sp, {r0, r1, r6}
    mov r0, r8
    add r1, sp, #0x10c
    add r2, sp, #0x28
    add r3, sp, #0x12c
    bl func_0209bd14
.L_02201c28:
    add r0, sp, #0x34
    mov r1, r8
    add r2, sp, #0x10c
    mov r3, #0x2
    bl func_0209c1bc
    ldr r0, [sp, #0x18]
    add r1, sp, #0x34
    add r0, r0, r7, lsl #0x4
    bl VecFx32Object_Assign
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
    add r0, sp, #0x11c
    bl VecFx32Object_Destroy
    add r0, sp, #0x10c
    bl VecFx32Object_Destroy
.L_02201c64:
    add r7, r7, #0x1
    cmp r7, #0x1d
    blt .L_022018cc
    ldrb r0, [r10, #0x643]
    cmp r0, #0x0
    beq .L_02201d44
    mov r3, #0xe8000
    mov r4, #0x28000
    add r9, sp, #0xd4
    mov r2, #0x0
    str r4, [sp, #0xcc]
    str r3, [sp, #0xd0]
    stmia r9, {r2, r3}
    add r7, sp, #0xdc
    add r5, sp, #0xe4
    mov r1, #0xd8000
    ldr r0, .L_022021b4
    str r2, [r5, #0x0]
    str r4, [r7, #0x0]
    str r1, [r7, #0x4]
    str r1, [r5, #0x4]
    ldr r1, [r0, #0x28]
    ldr r2, [r0, #0x24]
    add r0, sp, #0xac
    str r2, [sp, #0x20]
    str r1, [sp, #0x24]
    bl VecFx32Object_Init
    add r0, sp, #0xbc
    bl VecFx32Object_Init
    add r1, sp, #0x600
    add r0, sp, #0xac
    add r1, r1, #0xec
    bl VecFx32Object_Assign
    add r1, sp, #0x600
    add r0, sp, #0xbc
    add r1, r1, #0xfc
    bl VecFx32Object_Assign
    mov r0, #0xdc000
    str r0, [sp, #0xb4]
    str r0, [sp, #0xc4]
    sub r0, r0, #0xe6000
    ldrh r2, [sp, #0x30]
    str r0, [sp, #0xb8]
    str r0, [sp, #0xc8]
    mov r0, #0x2
    str r0, [sp, #0x0]
    stmib sp, {r2, r6}
    mov r0, r8
    add r1, sp, #0xac
    add r2, sp, #0x20
    add r3, sp, #0xcc
    bl func_0209bd14
    add r0, sp, #0xbc
    bl VecFx32Object_Destroy
    add r0, sp, #0xac
    bl VecFx32Object_Destroy
.L_02201d44:
    ldr r5, [r10, #0xb08]
    cmp r5, #0x0
    ble .L_02201eb0
    ldr r3, .L_022021c4
    add r2, sp, #0xa0
    mov r1, #0x5
.L_02201d5c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02201d5c
    ldr r0, [r10, #0xb0c]
    cmp r0, #0x0
    add r0, r5, r5, lsr #0x1f
    mov r0, r0, asr #0x1
    moveq r11, #0x0
    mov r4, r0, lsl #0x1
    movne r11, #0x11
    cmp r4, #0x12
    and r0, r5, #0x1
    movge r4, #0x12
    cmp r0, #0x1
    bne .L_02201ea4
    cmp r4, #0x3
    ble .L_02201ea4
    mov r9, #0x0
    ldr r3, .L_022021c8
    add r2, sp, #0x2bc
    mvn r0, #0x0
    mov lr, r9
    b .L_02201e74
.L_02201dbc:
    add r1, r11, r11, lsr #0x1f
    mov r5, r1, asr #0x1
    mov r1, #0xff0
    mul r1, r5, r1
    mov r1, r1, asr #0x4
    mov r6, r11, lsr #0x1f
    mov r5, r1, lsl #0x1
    rsb r1, r6, r11, lsl #0x1f
    add r7, r6, r1, ror #0x1f
    mov r1, r5, lsl #0x1
    add r5, r3, r5, lsl #0x1
    ldrsh ip, [r5, #0x2]
    mov r5, #0x14
    mul r5, r7, r5
    add r5, r5, #0x82
    mov r5, r5, lsl #0xc
    smull r6, r5, ip, r5
    adds ip, r6, #0x800
    adc r5, r5, #0x0
    mov r6, ip, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    mov r5, r6, asr #0xc
    add r5, r5, #0x80
    str r5, [r2, r9, lsl #0x3]
    mov r5, #0x50
    mul r5, r7, r5
    add r5, r5, #0x28
    ldrsh r1, [r3, r1]
    mov r5, r5, lsl #0xc
    smull r6, r5, r1, r5
    adds r6, r6, #0x800
    adc r1, r5, lr
    mov r5, r6, lsr #0xc
    orr r5, r5, r1, lsl #0x14
    mov r1, r5, asr #0xc
    add r5, r1, #0x6e
    mul r1, r9, r9
    sub r5, r5, r1, asr #0x3
    add r1, r2, r9, lsl #0x3
    str r5, [r1, #0x4]
    ldr r1, [r10, #0xb0c]
    add r9, r9, #0x1
    cmp r1, #0x0
    moveq r1, #0x1
    movne r1, r0
    add r11, r11, r1
.L_02201e74:
    cmp r9, r4
    blt .L_02201dbc
    mov r0, r8
    bl func_0209c9d4
    mov r0, #0x7d0
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldrh r3, [sp, #0xa0]
    add r1, sp, #0x2bc
    mov r0, r8
    mov r2, r4
    bl func_0209ca90
.L_02201ea4:
    ldr r0, [r10, #0xb08]
    sub r0, r0, #0x1
    str r0, [r10, #0xb08]
.L_02201eb0:
    ldr r0, [r10, #0xaa4]
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    cmp r1, #0x1
    bne .L_02201fdc
    mov r1, #0x9
    bl func_020befec
    mov r4, r0
    cmp r4, #0xf
    movgt r1, r4, lsr #0x1f
    rsbgt r0, r1, r4, lsl #0x1f
    addgt r0, r1, r0, ror #0x1f
    movgt r0, r0, lsl #0x1
    rsbgt r4, r0, #0xf
    mov r0, r8
    bl func_0209c9d4
    mov r0, #0x3
    sub r5, r0, #0x1
.L_02201efc:
    mov r0, #0x22
    sub r11, r0, #0x1
    add r1, sp, #0x1ac
.L_02201f08:
    mov r2, r11, lsr #0x1f
    rsb r0, r2, r11, lsl #0x1f
    add r0, r2, r0, ror #0x1f
    add r3, r11, r11, lsr #0x1f
    mov r2, r3, asr #0x1
    add r0, r5, r0
    mul r3, r4, r0
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    ldr r6, .L_022021c8
    mov r2, r2, lsl #0x1
    mov r9, r3, lsl #0xc
    mov r3, r2, lsl #0x1
    add r2, r6, r2, lsl #0x1
    ldrsh ip, [r2, #0x2]
    rsb r0, r0, #0x3
    add r0, r0, r0, lsl #0x3
    smull r7, r6, ip, r9
    adds ip, r7, #0x800
    add r0, r10, r0, lsl #0x4
    ldr r2, [r0, #0x8c8]
    adc r6, r6, #0x0
    mov r7, ip, lsr #0xc
    mov r2, r2, asr #0xc
    orr r7, r7, r6, lsl #0x14
    add r2, r2, r7, asr #0xc
    str r2, [r1, r11, lsl #0x3]
    ldr r2, .L_022021c8
    add lr, r1, r11, lsl #0x3
    ldrsh r3, [r2, r3]
    ldr r2, [r0, #0x8cc]
    mov r0, #0x800
    smull r7, r6, r3, r9
    adds r3, r7, r0
    mov r0, #0x0
    adc r0, r6, r0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    mov r0, r2, asr #0xc
    add r0, r0, r3, asr #0xc
    str r0, [lr, #0x4]
    subs r11, r11, #0x1
    bpl .L_02201f08
    mov r6, #0x7d0
    rsb r6, r6, #0x0
    ldr r3, .L_022021cc
    mov r0, r8
    mov r2, #0x22
    str r6, [sp, #0x0]
    bl func_0209ca90
    subs r5, r5, #0x1
    bpl .L_02201efc
.L_02201fdc:
    ldr r3, .L_022021bc
    add r0, sp, #0x34c
    mov r1, #0x1d
    mov r2, #0x10
    bl __destroy_arr
    add r0, sp, #0x500
    ldr r3, .L_022021bc
    add r0, r0, #0x1c
    mov r1, #0x1d
    mov r2, #0x10
    bl __destroy_arr
    add r0, sp, #0x700
    add r0, r0, #0x2c
    bl VecFx32Object_Destroy
    add r0, sp, #0x700
    add r0, r0, #0x1c
    bl VecFx32Object_Destroy
    add r0, sp, #0x700
    add r0, r0, #0xc
    bl VecFx32Object_Destroy
    add r0, sp, #0x600
    add r0, r0, #0xfc
    bl VecFx32Object_Destroy
    add r0, sp, #0x600
    add r0, r0, #0xec
    bl VecFx32Object_Destroy
    add r0, r10, #0x3d8
    add r0, r0, #0x800
    bl func_ov040_0220332c
    ldr r0, [r10, #0x70]
    cmp r0, #0x0
    ble .L_02202140
    ldr r3, .L_022021d0
    add r2, sp, #0x74
    mov r1, #0x5
.L_02202068:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02202068
    mvn r4, #0x13
    mov r3, #0x0
    mov r2, #0xd4
    mov r1, #0x114
    mov r0, r8
    str r4, [sp, #0x80]
    str r3, [sp, #0x84]
    str r4, [sp, #0x88]
    str r2, [sp, #0x8c]
    str r1, [sp, #0x90]
    str r3, [sp, #0x94]
    str r1, [sp, #0x98]
    str r2, [sp, #0x9c]
    bl func_0209c9d4
    ldr r0, [r10, #0x6c]
    cmp r0, #0x0
    bne .L_02202100
    ldr r1, [r10, #0x70]
    and r0, r1, #0x1
    cmp r0, #0x1
    bne .L_02202134
    add r0, r1, r1, lsr #0x1f
    mov r1, r0, asr #0x1
    mov r2, #0x7d0
    rsb r2, r2, #0x0
    str r2, [sp, #0x0]
    add r0, sp, #0x74
    mov r1, r1, lsl #0x1
    ldrh r3, [r0, r1]
    add r1, sp, #0x80
    mov r0, r8
    mov r2, #0x4
    bl func_0209ca90
    b .L_02202134
.L_02202100:
    ldr r0, [r10, #0x70]
    mov r0, r0, asr #0x1
    and r0, r0, #0x1
    cmp r0, #0x1
    bne .L_02202134
    mov r4, #0x7d0
    rsb r4, r4, #0x0
    ldr r3, .L_022021d4
    add r1, sp, #0x80
    mov r0, r8
    mov r2, #0x4
    str r4, [sp, #0x0]
    bl func_0209ca90
.L_02202134:
    ldr r0, [r10, #0x70]
    sub r0, r0, #0x1
    str r0, [r10, #0x70]
.L_02202140:
    ldr r2, [r10, #0xab8]
    mov r1, #0x3
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    bl func_020befec
    ldr r2, .L_022021d8
    add r0, r10, #0x1000
    ldr r3, [r2, #0x4]
    ldr r4, [r0, #0xb7c]
    mul r0, r1, r3
    ldr r1, [r4, #0x24]
    ldr r2, [r2, #0x0]
    add r0, r1, r0, lsl #0x1
    mov r1, #0x0
    bl func_020b1784
    add r0, sp, #0x17c
    bl VecFx32Object_Destroy
    add r0, sp, #0x18c
    bl VecFx32Object_Destroy
    add r0, sp, #0x19c
    bl VecFx32Object_Destroy
    add sp, sp, #0x33c
    add sp, sp, #0x400
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022021a4: .word 0x1ff0000
.L_022021a8: .word 0x4000014
.L_022021ac: .word 0x1ff
.L_022021b0: .word 0x400001c
.L_022021b4: .word data_ov040_02203810
.L_022021b8: .word 0x1770
.L_022021bc: .word VecFx32Object_Destroy
.L_022021c0: .word VecFx32Object_Init
.L_022021c4: .word data_ov040_0220385e
.L_022021c8: .word data_020c9670
.L_022021cc: .word 0x7fb8
.L_022021d0: .word data_ov040_02203854
.L_022021d4: .word 0x739c
.L_022021d8: .word data_ov040_022038a0
    .size func_ov040_022013e0, . - func_ov040_022013e0

