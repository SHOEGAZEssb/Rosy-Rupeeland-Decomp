.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern GameWork_ClearFlag
.extern Sound_Play
.extern data_021052fc
.extern func_0202d494
.extern Actor_GetCollection
.extern func_020390c8
.extern func_020393f4
.extern func_02072b68
.extern func_ov090_0221ad64
.extern gGameWork
.extern gSoundContext

.global func_ov090_0221a784
func_ov090_0221a784:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, .L_0221a8b0
    mov r6, r0
    ldr r0, [r2, #0x0]
    mov r5, r1
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    mov r0, r4
    beq .L_0221a7dc
    bl func_020393f4
    sub r0, r0, #0x78
    cmp r0, #0x2
    ldrls r1, [r4, #0x278]
    ldrls r0, [r1, #0x1f0]
    orrls r0, r0, #0x8
    strls r0, [r1, #0x1f0]
    bls .L_0221a7e0
    mov r0, r4
    bl func_020390c8
    b .L_0221a7e0
.L_0221a7dc:
    bl func_020390c8
.L_0221a7e0:
    ldr r1, [r4, #0x230]
    mov r0, r4
    bic r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r4, #0x14]
    ldr r0, .L_0221a8b4
    orr r1, r1, #0x2
    str r1, [r4, #0x14]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_ClearFlag
    mov r0, #0xc
    strb r0, [r6, #0x1ec]
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r0, #0x29
    str r0, [r6, #0x21c]
    ldr r3, [r5, #0x54]
    mov r0, r6
    ldr r1, [r3, #0x14]
    ldr r2, [r3, #0x18]
    ldr r1, [r1, #0x10]
    ldr r2, [r2, #0x10]
    ldr r3, [r3, #0x1c]
    ldr r3, [r3, #0x10]
    bl func_ov090_0221ad64
    ldr r0, [r6, #0x200]
    mov r1, #0x8
    bl func_02072b68
    ldr r2, [r5, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    bl Actor_GetCollection
    mov r1, r5
    bl func_0202d494
    ldr r4, [r6, #0x200]
    ldr r0, .L_0221a8b8
    ldrh r3, [r4, #0x24]
    mov r1, #0x0
    mov r2, #0x43
    bic r3, r3, #0x2
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    ldmia sp!, {r4, r5, r6, pc}
.L_0221a8b0: .word data_021052fc
.L_0221a8b4: .word gGameWork
.L_0221a8b8: .word gSoundContext
.size func_ov090_0221a784, . - func_ov090_0221a784
