.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern GraphicsSpriteGroup_CreateState
.extern data_020f4e18
.extern func_02071b94

.global func_0209a00c
func_0209a00c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    add r0, r4, #0x10
    str r0, [sp, #0x0]
    add r0, r4, #0x14
    str r0, [sp, #0x4]
    add ip, r4, #0x18
    ldr r0, .L_0209a078
    str ip, [sp, #0x8]
    ldr r0, [r0, #0x0]
    bl func_02071b94
    ldrb r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x14]
    ldr r3, [r4, #0x18]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0xc]
    ldrh r2, [r0, #0x24]
    mov r1, #0x0
    orr r2, r2, #0x8
    strh r2, [r0, #0x24]
    strh r1, [r4, #0x42]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0209a078: .word data_020f4e18
.size func_0209a00c, . - func_0209a00c
