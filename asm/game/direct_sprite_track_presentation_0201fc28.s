; Matching retail form; see src/game/direct_sprite_track_presentation.c.
.text
.extern data_020d6158
.extern data_020f4e18
.extern data_021052fc
.extern func_0200500c
.extern func_02007f0c
.extern func_0201e250
.extern ActorCollection_GetSpriteOwner
.extern func_02071ea4
.extern func_02071ee0
.extern func_02072b68
.extern func_02073fc4

.global func_0201fc28
    .type func_0201fc28, @function
func_0201fc28: ; 0x0201fc28
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0201e250
    ldr r1, .L_0201fd58
    add r0, r7, #0x8
    str r1, [r7, #0x0]
    bl func_02071ea4
    ldr r1, [sp, #0x34]
    add r0, r7, #0x1c
    str r1, [r7, #0x18]
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x24]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl func_0200500c
    mov r2, r5
    mov r3, r4
    ldr r1, [sp, #0x18]
    add r0, r7, #0x8
    str r1, [sp, #0x0]
    ldr r1, .L_0201fd5c
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    cmp r6, #0x0
    bne .L_0201fccc
    ldr r0, .L_0201fd60
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x8]
    ldr r2, [r7, #0xc]
    ldr r3, [r7, #0x10]
    bl func_02073fc4
    b .L_0201fcf8
.L_0201fccc:
    ldr r0, .L_0201fd60
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x8]
    ldr r2, [r7, #0xc]
    ldr r3, [r7, #0x10]
    bl func_02073fc4
.L_0201fcf8:
    ldr r1, [sp, #0x1c]
    str r0, [r7, #0x14]
    ldr r0, [r7, #0x14]
    and r1, r1, #0xff
    bl func_02072b68
    ldr r2, [r7, #0x14]
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x24]
    strh r1, [r2, #0x2c]
    strh r0, [r2, #0x2e]
    ldr r0, [sp, #0x28]
    ldr r2, [sp, #0x30]
    ldr r1, [r7, #0x14]
    ldr r3, [sp, #0x2c]
    strb r2, [r1, #0x3a]
    ldr r2, [r7, #0x14]
    mov r0, r0, lsl #0x10
    strh r3, [r2, #0x28]
    mov r1, r0, asr #0x10
    ldr r2, [r7, #0x14]
    mov r0, r7
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0201fd58: .word data_020d6158
.L_0201fd5c: .word data_020f4e18
.L_0201fd60: .word data_021052fc
    .size func_0201fc28, .-func_0201fc28
