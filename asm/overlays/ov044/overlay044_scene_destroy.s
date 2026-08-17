.text
.extern func_ov044_0220b8e4
.extern Heap_Free
.extern func_ov001_021fb7d4
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_ov044_0220be34
.extern AnimationResourceState_Destroy
.extern func_020926f8
.extern func_020927b8
.extern data_ov044_0220d31c
.extern data_020f4e14
.extern gDebugFont

    .global func_ov044_0220bfd4
func_ov044_0220bfd4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220c0a8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x228]
    cmp r5, #0x0
    beq .L_0220c00c
    mov r0, r5
    bl func_ov044_0220b8e4
    mov r0, r5
    bl Heap_Free
.L_0220c00c:
    ldr r5, [r4, #0x22c]
    cmp r5, #0x0
    beq .L_0220c028
    mov r0, r5
    bl func_ov001_021fb7d4
    mov r0, r5
    bl Heap_Free
.L_0220c028:
    ldr r0, [r4, #0x238]
    cmp r0, #0x0
    beq .L_0220c040
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220c040:
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_0220c058
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220c058:
    ldr r0, [r4, #0xbc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, .L_0220c0ac
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220c0b0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x17c
    bl func_ov044_0220be34
    add r0, r4, #0xd0
    bl func_ov044_0220be34
    add r0, r4, #0xc0
    bl AnimationResourceState_Destroy
    add r0, r4, #0x78
    bl func_020926f8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0220c0a8: .word data_ov044_0220d31c
.L_0220c0ac: .word data_020f4e14
.L_0220c0b0: .word gDebugFont
.size func_ov044_0220bfd4, . - func_ov044_0220bfd4

    .global func_ov044_0220c0b4
func_ov044_0220c0b4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220c190
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x228]
    cmp r5, #0x0
    beq .L_0220c0ec
    mov r0, r5
    bl func_ov044_0220b8e4
    mov r0, r5
    bl Heap_Free
.L_0220c0ec:
    ldr r5, [r4, #0x22c]
    cmp r5, #0x0
    beq .L_0220c108
    mov r0, r5
    bl func_ov001_021fb7d4
    mov r0, r5
    bl Heap_Free
.L_0220c108:
    ldr r0, [r4, #0x238]
    cmp r0, #0x0
    beq .L_0220c120
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220c120:
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_0220c138
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220c138:
    ldr r0, [r4, #0xbc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, .L_0220c194
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220c198
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x17c
    bl func_ov044_0220be34
    add r0, r4, #0xd0
    bl func_ov044_0220be34
    add r0, r4, #0xc0
    bl AnimationResourceState_Destroy
    add r0, r4, #0x78
    bl func_020926f8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0220c190: .word data_ov044_0220d31c
.L_0220c194: .word data_020f4e14
.L_0220c198: .word gDebugFont
.size func_ov044_0220c0b4, . - func_ov044_0220c0b4
