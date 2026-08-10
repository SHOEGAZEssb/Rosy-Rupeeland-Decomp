    .text
/* Exact fallback; see src/overlays/ov021/overlay021_scene_widgets.c. */
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940

.global func_ov021_021fe6b0
func_ov021_021fe6b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r8, #0x0
    add r7, r10, #0x14c
    mov r5, r8
    mvn r4, #0x3f
    mov r11, #0x30
L_021fe6d0:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x2a4]
    mov r2, #0x1
    cmp r0, #0x0
    mov r0, r8, lsl #0x1
    addne r9, r0, #0x16
    addeq r9, r0, #0x17
    mov r0, #0xac
    mul r6, r8, r0
    ldr r0, [r10, #0x94]
    add r1, r10, #0x7c
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r2, r9
    add r0, r7, r6
    mov r3, #0x1
    str r5, [sp, #0x0]
    bl func_020957f0
    mul r2, r8, r11
    add r0, r7, r6
    mov r1, r4
    add r2, r2, #0x40
    bl func_02095820
    add r8, r8, #0x1
    cmp r8, #0x2
    blt L_021fe6d0
    ldr r1, [r10, #0x54]
    cmp r1, #0x9
    beq L_021fe750
    sub r0, r1, #0xc
    cmp r0, #0x1
    bhi L_021fe76c
L_021fe750:
    add r0, r10, #0x14c
    bl func_02095940
    add r0, r10, #0x1f8
    mvn r1, #0x3f
    mov r2, #0x60
    bl func_02095820
    b L_021fe78c
L_021fe76c:
    cmp r1, #0x11
    bne L_021fe78c
    add r0, r10, #0x1f8
    bl func_02095940
    add r0, r10, #0x14c
    mvn r1, #0x3f
    mov r2, #0x60
    bl func_02095820
L_021fe78c:
    ldr r0, [r10, #0x94]
    add r1, r10, #0x7c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x98]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x98]
    mov r1, #0x14
    mov r2, #0x86
    mov r3, #0x1c
    bl func_02073e48
    ldr r0, [r10, #0x94]
    add r1, r10, #0x7c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0xa0
    mov r2, #0x2
    mov r3, #0x1
    bl func_020957f0
    add r0, r10, #0xa0
    mov r1, #0xe4
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r10, #0x94]
    add r1, r10, #0x88
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x9c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x9c]
    mov r2, #0x54
    mov r3, #0xe
    bl func_02073e48
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov021_021fe6b0, . - func_ov021_021fe6b0

