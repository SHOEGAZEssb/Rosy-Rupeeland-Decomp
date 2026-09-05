.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern GraphicsSpriteGroup_CreateState
.extern data_020f4e18
.extern func_02071b94
.extern func_0209a07c

.global func_0209a120
func_0209a120:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    add r5, sp, #0x14
    str r5, [sp, #0x0]
    add r4, sp, #0x10
    str r4, [sp, #0x4]
    add r5, sp, #0xc
    str r5, [sp, #0x8]
    ldr r4, .L_0209a1b0
    mov r5, r0
    ldr r0, [r4, #0x0]
    bl func_02071b94
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0xc]
    bl GraphicsSpriteGroup_CreateState
    mov r4, r0
    mov r0, r5
    bl func_0209a07c
    ldr r0, [sp, #0x14]
    str r0, [r5, #0x10]
    ldr r1, [sp, #0x10]
    mov r0, #0x0
    str r1, [r5, #0x14]
    ldr r1, [sp, #0xc]
    str r1, [r5, #0x18]
    str r4, [r5, #0xc]
    ldrh r1, [r4, #0x24]
    orr r1, r1, #0x8
    strh r1, [r4, #0x24]
    strh r0, [r5, #0x42]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_0209a1b0: .word data_020f4e18
.size func_0209a120, . - func_0209a120
