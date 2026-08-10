.text
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern func_02073e48
.extern func_020957f0
.extern func_02095820
.extern func_02095940
.extern GraphicsSpriteGroup_Clear

    .global func_ov044_0220c610
func_ov044_0220c610:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xcc]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xcc]
    mov r2, #0x84
    mov r3, #0x20
    bl func_02073e48
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0xd0
    mov r2, #0x9
    mov r3, #0x2
    bl func_020957f0
    add r0, r4, #0xd0
    mov r1, #0xe8
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x17c
    mov r2, #0x7
    mov r3, #0x2
    bl func_020957f0
    add r0, r4, #0x17c
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    add r0, r4, #0x17c
    bl func_02095940
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov044_0220c610, . - func_ov044_0220c610

    .global func_ov044_0220c6dc
func_ov044_0220c6dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xbc]
    bl GraphicsSpriteGroup_Clear
    mov r0, #0x0
    str r0, [r4, #0xcc]
    str r0, [r4, #0x218]
    str r0, [r4, #0x16c]
    ldmia sp!, {r4, pc}
.size func_ov044_0220c6dc, . - func_ov044_0220c6dc
