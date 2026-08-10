.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern data_020f4e14
.extern GraphicsSpriteCanvas_DrawLine
.extern GraphicsSpriteCanvas_FillRect
.extern func_020befec

.global func_ov090_0221a8bc
func_ov090_0221a8bc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r0, r6, #0x200
    ldrsh r3, [r0, #0x20]
    ldrsh r2, [r0, #0x38]
    add r1, r3, #0x10
    cmp r2, r1
    subge r1, r2, #0x10
    strgeh r1, [r0, #0x38]
    bge .L_0221a908
    strh r3, [r0, #0x38]
    ldrsh r3, [r0, #0x20]
    ldrsh r2, [r0, #0x3a]
    add r1, r3, #0x6
    cmp r2, r1
    subge r1, r2, #0x6
    strgeh r1, [r0, #0x3a]
    strlth r3, [r0, #0x3a]
.L_0221a908:
    add r0, r6, #0x200
    ldrsh r5, [r0, #0x38]
    mov r0, #0xb0
    mov r1, #0x7d0
    smulbb r0, r5, r0
    bl func_020befec
    add r1, r6, #0x200
    ldrsh r2, [r1, #0x3a]
    mov r1, #0xb0
    mov r4, r0
    sub r2, r2, r5
    mul r0, r2, r1
    mov r1, #0x7d0
    bl func_020befec
    mov r5, r0
    cmp r4, #0x0
    ble .L_0221a974
    mov r0, #0xf
    str r0, [sp, #0x0]
    mov r1, #0x3
    ldr r0, .L_0221aa94
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r3, r4, #0x30
    mov r1, #0x30
    mov r2, #0x9
    bl GraphicsSpriteCanvas_FillRect
.L_0221a974:
    cmp r5, #0x0
    ble .L_0221a9a4
    mov r0, #0xf
    str r0, [sp, #0x0]
    mov r2, #0x7
    add r1, r4, #0x30
    ldr r0, .L_0221aa94
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r3, r1, r5
    mov r2, #0x9
    bl GraphicsSpriteCanvas_FillRect
.L_0221a9a4:
    add r2, r4, r5
    rsb r0, r2, #0xb0
    cmp r0, #0x0
    ble .L_0221a9dc
    mov r0, #0xf
    str r0, [sp, #0x0]
    mov r1, #0x6
    ldr r0, .L_0221aa94
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r1, r2, #0x30
    mov r2, #0x9
    mov r3, #0xe0
    bl GraphicsSpriteCanvas_FillRect
.L_0221a9dc:
    mov r0, #0x9
    str r0, [sp, #0x0]
    mov r1, #0x6
    ldr r0, .L_0221aa94
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x30
    mov r2, #0x8
    mov r3, #0xe0
    bl GraphicsSpriteCanvas_FillRect
    mov r0, #0x10
    str r0, [sp, #0x0]
    mov r1, #0x6
    ldr r0, .L_0221aa94
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x30
    mov r2, #0xf
    mov r3, #0xe0
    bl GraphicsSpriteCanvas_FillRect
    mov r0, #0xf
    str r0, [sp, #0x0]
    mov r1, #0x6
    ldr r0, .L_0221aa94
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0xe0
    mov r2, #0x9
    mov r3, #0xe1
    bl GraphicsSpriteCanvas_FillRect
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x38]
    cmp r0, #0x0
    ble .L_0221aa8c
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r2, #0x3
    mov r1, #0x2f
    ldr r0, .L_0221aa94
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0xa
    bl GraphicsSpriteCanvas_DrawLine
.L_0221aa8c:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_0221aa94: .word data_020f4e14
.size func_ov090_0221a8bc, . - func_ov090_0221a8bc
