.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern GX_DispOn
.extern Scene_Init
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov068_0221077c
.extern func_02071b94
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov068_02210070

.global func_ov068_0220fd20
func_ov068_0220fd20:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r7, r0
    bl Scene_Init
    ldr r1, .L_02210018
    mov r0, #0x0
    str r1, [r7, #0x0]
    str r0, [r7, #0x28]
    str r0, [r7, #0x2c]
    strh r0, [r7, #0x58]
    strh r0, [r7, #0x5a]
    strh r0, [r7, #0x5c]
    mov r1, #0x1000
    str r0, [r7, #0x54]
    add r0, r7, #0x30
    str r0, [sp, #0x0]
    add r0, r7, #0x3c
    str r0, [sp, #0x4]
    add r2, r7, #0x48
    ldr r0, .L_0221001c
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02071b94
    mov r1, #0x1000
    add r0, r7, #0x34
    str r0, [sp, #0x0]
    add r0, r7, #0x40
    str r0, [sp, #0x4]
    add r2, r7, #0x4c
    ldr r0, .L_0221001c
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02071b94
    mov r1, #0x1000
    add r0, r7, #0x38
    str r0, [sp, #0x0]
    add r0, r7, #0x44
    str r0, [sp, #0x4]
    add r0, r7, #0x50
    str r0, [sp, #0x8]
    ldr r0, .L_0221001c
    add r2, r1, #0x1
    ldr r0, [r0, #0x0]
    add r3, r1, #0x2
    bl func_02071b94
    ldr r0, .L_02210020
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r7, #0x24]
    add r0, r7, #0x28
    mov r1, #0x9
    bl func_ov068_02210070
    ldr r4, [r7, #0x28]
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x24]
    ldr r1, [r7, #0x30]
    ldr r2, [r7, #0x3c]
    ldr r3, [r7, #0x48]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x0]
    ldr r0, [r7, #0x28]
    mov r1, #0x8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, #0xc8
    ldr r0, [r7, #0x28]
    ldr r0, [r0, #0x0]
    strh r1, [r0, #0x28]
    ldr r0, [r7, #0x28]
    ldr r1, [r0, #0x0]
    mov r0, #0x80
    strh r0, [r1, #0x2c]
    mov r0, #0x60
    strh r0, [r1, #0x2e]
    ldr r1, [r7, #0x28]
    mov r0, #0x2
    ldr r2, [r1, #0x0]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r4, [r7, #0x28]
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x24]
    ldr r1, [r7, #0x38]
    ldr r2, [r7, #0x44]
    ldr r3, [r7, #0x50]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x20]
    ldr r0, [r7, #0x28]
    mov r1, #0x10
    ldr r0, [r0, #0x20]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r7, #0x28]
    mov r1, #0xca
    ldr r0, [r0, #0x20]
    mov r2, #0xc0
    strh r1, [r0, #0x28]
    ldr r0, [r7, #0x28]
    mov r1, #0xa0
    ldr r3, [r0, #0x20]
    mov r0, #0x200
    strh r2, [r3, #0x2c]
    strh r1, [r3, #0x2e]
    ldr r1, [r7, #0x28]
    mov r2, #0x0
    ldr r1, [r1, #0x20]
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldr r0, [r7, #0x28]
    ldr r1, [r0, #0x20]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    mov r1, r2
.L_0220fefc:
    add r0, r7, r2, lsl #0x2
    add r0, r0, #0x100
    strh r1, [r0, #0x5e]
    add r2, r2, #0x1
    strh r1, [r0, #0x60]
    cmp r2, #0x9
    blt .L_0220fefc
    mov r6, #0x1
    mov r5, #0x2
    mov r4, #0x0
.L_0220ff24:
    ldr r8, [r7, #0x28]
    str r5, [sp, #0x0]
    ldr r0, [r7, #0x24]
    ldr r1, [r7, #0x34]
    ldr r2, [r7, #0x40]
    ldr r3, [r7, #0x4c]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r8, r6, lsl #0x2]
    ldr r0, [r7, #0x28]
    mov r1, r4
    ldr r0, [r0, r6, lsl #0x2]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r7, #0x28]
    ldr r0, [r1, #0x0]
    ldr r1, [r1, r6, lsl #0x2]
    ldrsh r2, [r0, #0x2e]
    ldrsh r0, [r0, #0x2c]
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r0, [r7, #0x28]
    ldr r1, [r0, r6, lsl #0x2]
    add r6, r6, #0x1
    ldrh r0, [r1, #0x24]
    cmp r6, #0x8
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    blt .L_0220ff24
    ldr r0, [r7, #0x28]
    mov r1, #0xcc
    ldr r2, [r0, #0x14]
    mov r0, #0xc9
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r1, [r7, #0x28]
    mov r2, #0x80
    ldr r3, [r1, #0x14]
    mov r1, #0x4c
    strh r0, [r3, #0x28]
    ldr r3, [r7, #0x28]
    ldr r3, [r3, #0x18]
    strh r2, [r3, #0x32]
    strh r2, [r3, #0x34]
    ldr r2, [r7, #0x28]
    ldr r2, [r2, #0x18]
    strh r0, [r2, #0x28]
    ldr r2, [r7, #0x28]
    ldr r2, [r2, #0x1c]
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r1, [r7, #0x28]
    ldr r1, [r1, #0x1c]
    strh r0, [r1, #0x28]
    bl GX_DispOn
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, r7
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02210018: .word data_ov068_0221077c
.L_0221001c: .word data_020f4e18
.L_02210020: .word data_020f4e14
.size func_ov068_0220fd20, . - func_ov068_0220fd20
