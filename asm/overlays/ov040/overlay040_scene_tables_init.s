    .text
/* Exact fallback; see overlay040_scene_tables_init.c for portable C. */
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Destroy
    .extern VecFx32Object_Assign
    .extern func_ov040_021fe18c
    .extern func_ov040_02202244
    .global func_ov040_021fd8ac
func_ov040_021fd8ac: ; 0x021fd8ac
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1e0
    mov r1, #0x1d
    mov r10, r0
    sub r9, r1, #0x1
    add r8, r10, #0x84
    add r11, sp, #0x1d0
    mov r7, #0x0
    mvn r6, #0x0
    mov r5, #0x1
    mov r4, #0xc
.L_021fd8d8:
    mov r1, #0x0
    mov r0, r11
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, r11
    add r0, r8, r9, lsl #0x4
    bl VecFx32Object_Assign
    mov r0, r11
    bl VecFx32Object_Destroy
    add r0, r10, r9, lsl #0x2
    str r7, [r0, #0x264]
    mla r1, r9, r4, r10
    str r7, [r1, #0x2dc]
    add r0, r10, r9
    str r7, [r1, #0x2e0]
    strb r6, [r0, #0x624]
    strb r5, [r0, #0x642]
    subs r9, r9, #0x1
    bpl .L_021fd8d8
    mov r0, #0x5000
    str r0, [r10, #0x26c]
    mov r0, #0x78000
    str r0, [r10, #0x270]
    mov r3, #0x10000
    str r3, [r10, #0x274]
    str r3, [r10, #0x278]
    str r3, [r10, #0x27c]
    mov r1, #0x14000
    str r1, [r10, #0x280]
    str r3, [r10, #0x284]
    str r3, [r10, #0x288]
    mov r0, #0x26000
    str r0, [r10, #0x28c]
    mov r0, #0x32000
    str r0, [r10, #0x268]
    str r1, [r10, #0x290]
    str r3, [r10, #0x294]
    mov r2, #0x20000
    str r2, [r10, #0x298]
    mov r0, #0x18000
    str r0, [r10, #0x29c]
    str r3, [r10, #0x2a0]
    str r2, [r10, #0x2a4]
    str r0, [r10, #0x2a8]
    str r0, [r10, #0x2ac]
    str r0, [r10, #0x2b0]
    str r1, [r10, #0x2b4]
    str r1, [r10, #0x2b8]
    str r1, [r10, #0x2bc]
    str r1, [r10, #0x2c0]
    mov r0, #0xa000
    str r0, [r10, #0x2c4]
    str r2, [r10, #0x2c8]
    mov r0, #0x4000
    ldr r4, .L_021fe184
    str r0, [r10, #0x2cc]
    str r0, [r10, #0x2d0]
    mov r0, #0xc000
    str r0, [r10, #0x2d4]
    str r7, [r10, #0x2f4]
    str r7, [r10, #0x300]
    str r7, [r10, #0x30c]
    str r7, [r10, #0x318]
    str r7, [r10, #0x324]
    str r7, [r10, #0x330]
    str r7, [r10, #0x33c]
    str r7, [r10, #0x348]
    str r4, [r10, #0x354]
    mov r0, #0x2b8
    str r7, [r10, #0x2e8]
    mov r3, #0x800
    str r3, [r10, #0x360]
    str r7, [r10, #0x36c]
    str r7, [r10, #0x378]
    sub r1, r4, #0x7a
    str r1, [r10, #0x384]
    str r7, [r10, #0x390]
    str r7, [r10, #0x39c]
    str r1, [r10, #0x3a8]
    add r1, r4, #0xf6
    str r1, [r10, #0x3b4]
    str r1, [r10, #0x3c0]
    str r0, [r10, #0x3cc]
    sub r0, r0, #0x52
    str r0, [r10, #0x3d8]
    add r0, r4, #0xa90
    str r0, [r10, #0x3e4]
    add r1, r4, #0x290
    str r1, [r10, #0x3f0]
    str r1, [r10, #0x3fc]
    sub r0, r3, #0x1800
    str r0, [r10, #0x408]
    str r7, [r10, #0x414]
    str r7, [r10, #0x420]
    str r7, [r10, #0x42c]
    str r7, [r10, #0x2f8]
    str r7, [r10, #0x304]
    str r1, [r10, #0x310]
    str r1, [r10, #0x31c]
    str r7, [r10, #0x328]
    str r7, [r10, #0x334]
    str r7, [r10, #0x340]
    str r7, [r10, #0x34c]
    str r7, [r10, #0x358]
    str r7, [r10, #0x2ec]
    str r7, [r10, #0x364]
    str r3, [r10, #0x370]
    str r7, [r10, #0x37c]
    mov r1, #0xcd
    str r1, [r10, #0x388]
    mov r0, #0x1800
    str r0, [r10, #0x394]
    str r7, [r10, #0x3a0]
    str r1, [r10, #0x3ac]
    str r7, [r10, #0x3b8]
    mov r1, #0xc00
    str r7, [r10, #0x3c4]
    str r1, [r10, #0x3d0]
    sub r0, r1, #0xcd
    str r0, [r10, #0x3dc]
    ldr r0, .L_021fe188
    str r7, [r10, #0x3e8]
    str r0, [r10, #0x3f4]
    str r0, [r10, #0x400]
    str r7, [r10, #0x40c]
    str r7, [r10, #0x418]
    str r7, [r10, #0x424]
    mov r0, #0x35c
    str r0, [r10, #0x430]
    str r7, [r10, #0x2fc]
    str r7, [r10, #0x308]
    str r7, [r10, #0x314]
    str r7, [r10, #0x320]
    str r7, [r10, #0x32c]
    str r7, [r10, #0x338]
    str r7, [r10, #0x344]
    str r7, [r10, #0x350]
    str r7, [r10, #0x35c]
    str r7, [r10, #0x2f0]
    str r7, [r10, #0x368]
    str r7, [r10, #0x374]
    str r7, [r10, #0x380]
    str r7, [r10, #0x38c]
    str r7, [r10, #0x398]
    str r7, [r10, #0x3a4]
    str r7, [r10, #0x3b0]
    str r7, [r10, #0x3bc]
    str r7, [r10, #0x3c8]
    str r7, [r10, #0x3d4]
    sub r0, r1, #0x7c00
    str r7, [r10, #0x3e0]
    str r0, [r10, #0x3ec]
    str r7, [r10, #0x3f8]
    str r7, [r10, #0x404]
    mov r0, #0x7000
    str r0, [r10, #0x410]
    str r7, [r10, #0x41c]
    str r7, [r10, #0x428]
    str r7, [r10, #0x434]
    add r0, r10, #0x44
    mov r3, #0x8000
    add r1, sp, #0x1c0
    add r0, r0, #0x400
    str r7, [sp, #0x1c0]
    str r7, [sp, #0x1c4]
    str r3, [sp, #0x1c8]
    str r2, [sp, #0x1cc]
    bl func_ov040_021fe18c
    add r0, r10, #0x64
    mov r5, #0x0
    mov r4, #0xb0000
    mov r3, #0x8000
    mov r2, #0x20000
    add r1, sp, #0x1b0
    add r0, r0, #0x400
    str r5, [sp, #0x1b0]
    str r4, [sp, #0x1b4]
    str r3, [sp, #0x1b8]
    str r2, [sp, #0x1bc]
    bl func_ov040_021fe18c
    mov r4, #0x58000
    add r0, r10, #0x74
    sub r3, r4, #0xf0000
    sub r2, r4, #0xb0000
    mov r5, #0x98000
    add r1, sp, #0x1a0
    add r0, r0, #0x400
    str r5, [sp, #0x1a0]
    str r4, [sp, #0x1a4]
    str r3, [sp, #0x1a8]
    str r2, [sp, #0x1ac]
    bl func_ov040_021fe18c
    add r0, r10, #0x84
    mov r5, #0x20000
    mov r4, #0x78000
    mov r3, #0x10000
    mov r2, #0x30000
    add r1, sp, #0x190
    add r0, r0, #0x400
    str r5, [sp, #0x190]
    str r4, [sp, #0x194]
    str r3, [sp, #0x198]
    str r2, [sp, #0x19c]
    bl func_ov040_021fe18c
    add r0, r10, #0x94
    mov r1, r5
    mov r3, #0x10000
    mov r2, #0x30000
    str r1, [sp, #0x180]
    add r1, sp, #0x180
    add r0, r0, #0x400
    str r4, [sp, #0x184]
    str r3, [sp, #0x188]
    str r2, [sp, #0x18c]
    bl func_ov040_021fe18c
    mov r1, r5
    add r0, r10, #0xa4
    mov r2, r4
    str r1, [sp, #0x170]
    mov r1, #0x10000
    str r2, [sp, #0x174]
    mov r2, #0x30000
    str r1, [sp, #0x178]
    add r1, sp, #0x170
    add r0, r0, #0x400
    str r2, [sp, #0x17c]
    bl func_ov040_021fe18c
    add r0, r10, #0xb4
    mov r4, #0x50000
    mov r3, #0x58000
    mov r2, #0x18000
    add r1, sp, #0x160
    add r0, r0, #0x400
    str r4, [sp, #0x160]
    str r3, [sp, #0x164]
    str r2, [sp, #0x168]
    str r4, [sp, #0x16c]
    bl func_ov040_021fe18c
    add r0, r10, #0xc4
    mov r4, #0x78000
    mov r3, #0x10000
    mov r2, #0x30000
    add r1, sp, #0x150
    add r0, r0, #0x400
    str r5, [sp, #0x150]
    str r4, [sp, #0x154]
    str r3, [sp, #0x158]
    str r2, [sp, #0x15c]
    bl func_ov040_021fe18c
    add r0, r10, #0xd4
    mov r3, #0x10000
    mov r2, #0x30000
    add r1, sp, #0x140
    add r0, r0, #0x400
    str r5, [sp, #0x140]
    str r4, [sp, #0x144]
    str r3, [sp, #0x148]
    str r2, [sp, #0x14c]
    bl func_ov040_021fe18c
    mov r4, #0xb8000
    add r0, r10, #0xe4
    sub r3, r4, #0xd8000
    sub r2, r4, #0x118000
    add r1, sp, #0x130
    add r0, r0, #0x400
    str r5, [sp, #0x130]
    str r4, [sp, #0x134]
    str r3, [sp, #0x138]
    str r2, [sp, #0x13c]
    bl func_ov040_021fe18c
    mov r3, #0x40000
    add r0, r10, #0x54
    mov r1, #0xa8000
    sub r2, r3, #0x88000
    mov r4, #0x48000
    str r1, [sp, #0x120]
    add r1, sp, #0x120
    add r0, r0, #0x400
    str r4, [sp, #0x124]
    str r3, [sp, #0x128]
    str r2, [sp, #0x12c]
    bl func_ov040_021fe18c
    mov r2, #0x4c000
    add r0, r10, #0xf4
    sub r1, r2, #0x64000
    str r2, [sp, #0x114]
    mov r2, #0x100000
    str r2, [sp, #0x110]
    mov r2, #0x30000
    str r1, [sp, #0x118]
    add r1, sp, #0x110
    add r0, r0, #0x400
    str r2, [sp, #0x11c]
    bl func_ov040_021fe18c
    mov r1, r5
    str r1, [sp, #0x100]
    mov r1, #0x78000
    str r1, [sp, #0x104]
    mov r1, #0x10000
    add r0, r10, #0x104
    str r1, [sp, #0x108]
    mov r1, #0x30000
    str r1, [sp, #0x10c]
    add r0, r0, #0x400
    add r1, sp, #0x100
    bl func_ov040_021fe18c
    mov r0, #0x30000
    str r0, [sp, #0xf0]
    mov r0, #0x58000
    str r0, [sp, #0xf4]
    add r0, r10, #0x114
    mov r3, r5
    mov r2, #0x38000
    add r1, sp, #0xf0
    add r0, r0, #0x400
    str r3, [sp, #0xf8]
    str r2, [sp, #0xfc]
    bl func_ov040_021fe18c
    mov r4, #0xd8000
    add r0, r10, #0x124
    sub r3, r4, #0xf0000
    sub r2, r4, #0x108000
    mov r5, #0x100000
    add r1, sp, #0xe0
    add r0, r0, #0x400
    str r5, [sp, #0xe0]
    str r4, [sp, #0xe4]
    str r3, [sp, #0xe8]
    str r2, [sp, #0xec]
    bl func_ov040_021fe18c
    add r0, r10, #0x134
    mov r5, #0x20000
    mov r4, #0x78000
    mov r3, #0x10000
    mov r2, #0x30000
    add r1, sp, #0xd0
    add r0, r0, #0x400
    str r5, [sp, #0xd0]
    str r4, [sp, #0xd4]
    str r3, [sp, #0xd8]
    str r2, [sp, #0xdc]
    bl func_ov040_021fe18c
    add r0, r10, #0x144
    mov r5, #0x30000
    mov r4, #0x58000
    mov r3, #0x20000
    mov r2, #0x38000
    add r1, sp, #0xc0
    add r0, r0, #0x400
    str r5, [sp, #0xc0]
    str r4, [sp, #0xc4]
    str r3, [sp, #0xc8]
    str r2, [sp, #0xcc]
    bl func_ov040_021fe18c
    mov r3, #0x18000
    add r0, r10, #0x154
    mov r1, #0xe8000
    sub r2, r3, #0x48000
    mov r4, #0xd8000
    str r1, [sp, #0xb0]
    add r1, sp, #0xb0
    add r0, r0, #0x400
    str r4, [sp, #0xb4]
    str r3, [sp, #0xb8]
    str r2, [sp, #0xbc]
    bl func_ov040_021fe18c
    mov r1, #0xc8000
    add r0, r10, #0x164
    mov r2, #0x48000
    str r1, [sp, #0xa0]
    mov r1, #0x18000
    str r2, [sp, #0xa4]
    mov r2, #0x38000
    str r1, [sp, #0xa8]
    add r1, sp, #0xa0
    add r0, r0, #0x400
    str r2, [sp, #0xac]
    bl func_ov040_021fe18c
    mov r1, #0xb0000
    str r1, [sp, #0x90]
    mov r1, #0x48000
    str r1, [sp, #0x94]
    mov r1, #0x18000
    add r0, r10, #0x174
    str r1, [sp, #0x98]
    mov r1, #0x38000
    str r1, [sp, #0x9c]
    add r0, r0, #0x400
    add r1, sp, #0x90
    bl func_ov040_021fe18c
    mov r0, #0xe0000
    str r0, [sp, #0x80]
    mov r0, #0x80000
    str r0, [sp, #0x84]
    mov r0, #0x20000
    str r0, [sp, #0x88]
    mov r0, #0x28000
    str r0, [sp, #0x8c]
    add r0, r10, #0x184
    add r1, sp, #0x80
    add r0, r0, #0x400
    bl func_ov040_021fe18c
    add r0, r10, #0x194
    mov r5, #0xc0000
    mov r4, #0x80000
    mov r3, #0x20000
    mov r2, #0x28000
    add r1, sp, #0x70
    add r0, r0, #0x400
    str r5, [sp, #0x70]
    str r4, [sp, #0x74]
    str r3, [sp, #0x78]
    str r2, [sp, #0x7c]
    bl func_ov040_021fe18c
    add r0, r10, #0x1a4
    mov r5, #0x30000
    mov r4, #0x90000
    mov r3, #0x20000
    mov r2, #0x18000
    add r1, sp, #0x60
    add r0, r0, #0x400
    str r5, [sp, #0x60]
    str r4, [sp, #0x64]
    str r3, [sp, #0x68]
    str r2, [sp, #0x6c]
    bl func_ov040_021fe18c
    add r0, r10, #0x1b4
    mov r4, #0xb8000
    mov r3, #0x20000
    mov r2, #0x28000
    add r1, sp, #0x50
    add r0, r0, #0x400
    str r5, [sp, #0x50]
    str r4, [sp, #0x54]
    str r3, [sp, #0x58]
    str r2, [sp, #0x5c]
    bl func_ov040_021fe18c
    mov r2, #0x10000
    add r0, r10, #0x1c4
    mov r4, #0x38000
    mov r3, #0xa8000
    add r1, sp, #0x40
    add r0, r0, #0x400
    str r4, [sp, #0x40]
    str r3, [sp, #0x44]
    str r2, [sp, #0x48]
    str r2, [sp, #0x4c]
    bl func_ov040_021fe18c
    mov r3, #0xe8000
    sub r1, r3, #0x110000
    add r0, r10, #0x1d4
    str r1, [sp, #0x38]
    mov r1, #0x28000
    sub r2, r3, #0xf8000
    str r1, [sp, #0x30]
    add r1, sp, #0x30
    add r0, r0, #0x400
    str r3, [sp, #0x34]
    str r2, [sp, #0x3c]
    bl func_ov040_021fe18c
    mov r0, #0x8000
    mov r1, #0x20000
    str r1, [sp, #0x20]
    mov r1, #0xa8000
    str r1, [sp, #0x24]
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    add r0, r10, #0x1e4
    add r0, r0, #0x400
    add r1, sp, #0x20
    bl func_ov040_021fe18c
    mov r0, #0x20000
    str r0, [sp, #0x10]
    mov r0, #0xa8000
    str r0, [sp, #0x14]
    mov r0, #0x8000
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, r10, #0x1f4
    add r0, r0, #0x400
    add r1, sp, #0x10
    bl func_ov040_021fe18c
    mov r3, #0x17000
    add r0, r10, #0x204
    sub r2, r3, #0x4e000
    mov r5, #0xe8000
    add r1, sp, #0x0
    add r0, r0, #0x400
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_ov040_021fe18c
    mvn r0, #0x0
    strb r0, [r10, #0x624]
    mov r2, #0x1
    strb r2, [r10, #0x626]
    mov r1, #0x2
    strb r1, [r10, #0x627]
    mov r5, #0x0
    strb r5, [r10, #0x625]
    strb r2, [r10, #0x628]
    strb r2, [r10, #0x629]
    mov r0, #0x4
    strb r0, [r10, #0x62a]
    mov r3, #0x6
    strb r3, [r10, #0x62b]
    mov r7, #0x5
    strb r7, [r10, #0x62c]
    mov r4, #0x8
    strb r4, [r10, #0x62d]
    mov r6, #0x9
    strb r6, [r10, #0x62e]
    strb r5, [r10, #0x62f]
    mov r5, #0xb
    strb r5, [r10, #0x630]
    mov r4, #0xc
    strb r4, [r10, #0x631]
    mov r4, #0xd
    strb r4, [r10, #0x632]
    strb r5, [r10, #0x633]
    mov r4, #0xf
    strb r4, [r10, #0x634]
    mov r4, #0x10
    strb r4, [r10, #0x635]
    strb r0, [r10, #0x636]
    strb r7, [r10, #0x637]
    mov r0, #0x7
    strb r0, [r10, #0x638]
    strb r6, [r10, #0x639]
    strb r1, [r10, #0x63a]
    strb r2, [r10, #0x63b]
    mov r0, #0x17
    strb r0, [r10, #0x63c]
    strb r1, [r10, #0x63d]
    mov r0, #0x19
    strb r0, [r10, #0x63e]
    strb r0, [r10, #0x63f]
    mov r3, #0x3
    strb r3, [r10, #0x640]
    sub r3, r3, #0x1
    mov r1, #0x0
    mov r0, #0xc
.L_021fe158:
    mla r2, r3, r0, r10
    str r1, [r2, #0x86c]
    str r1, [r2, #0x868]
    str r1, [r2, #0x89c]
    str r1, [r2, #0x898]
    subs r3, r3, #0x1
    bpl .L_021fe158
    mov r0, r10
    bl func_ov040_02202244
    add sp, sp, #0x1e0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fe184: .word 0x23d
.L_021fe188: .word 0x452
    .size func_ov040_021fd8ac, . - func_ov040_021fd8ac

