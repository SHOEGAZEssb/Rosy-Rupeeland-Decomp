.text
.extern func_ov042_021fd66c
.extern func_ov042_021fcf80
.extern func_0209a208
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_ov042_0220b5bc
.global func_ov042_02207e04
func_ov042_02207e04:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_ov042_021fd66c
    ldr r1, .L_02207ee8
    add r0, r4, #0x50
    str r1, [r4, #0x0]
    bl func_ov042_021fcf80
    add r0, r4, #0x5c
    bl func_ov042_021fcf80
    add r0, r4, #0x68
    bl func_ov042_021fcf80
    ldr r1, .L_02207eec
    str r6, [r4, #0x48]
    str r5, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r4, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r4
    ldr ip, [r0, #0x0]
    mov r2, #0x80000
    ldr r1, [r4, #0x4c]
    ldr ip, [ip, #0x0]
    sub r3, r2, #0xd0000
    blx ip
    ldr r2, [r4, #0x4c]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, #0x0
    str r1, [r4, #0x58]
    str r1, [r4, #0x54]
    mov r0, #0x65
    str r0, [r4, #0x74]
    str r1, [r4, #0x78]
    str r1, [r4, #0x7c]
    strb r1, [r4, #0x8b]
    str r1, [r4, #0x80]
    str r1, [r4, #0x84]
    strh r1, [r4, #0x88]
    str r1, [r4, #0x8c]
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02207ee8: .word data_ov042_0220b5bc
.L_02207eec: .word 0x12db
.size func_ov042_02207e04, . - func_ov042_02207e04
