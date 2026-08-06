; Matching retail form; see src/game/timed_sprite_orbit_variant.c.
.text
.extern Heap_Free
.extern data_020c9670
.extern data_020d6118
.extern func_020050c8
.extern func_02005a54
.extern func_020188fc
.extern func_0201e380
.extern func_0201e3b8
.extern func_0201e6e4
.extern genrand_int32

.global func_0201e9d8
.type func_0201e9d8, @function
func_0201e9d8: ; 0x0201e9d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e6e4
    ldr r0, .L_0201ea1c
    ldrsh r1, [sp, #0x8]
    str r0, [r4, #0x0]
    ldrsh r0, [sp, #0xc]
    strh r1, [r4, #0x3c]
    strh r0, [r4, #0x3e]
    bl genrand_int32
    mov r1, #0x800
    tst r0, #0x1
    strh r0, [r4, #0x38]
    rsbeq r1, r1, #0x0
    mov r0, r4
    strh r1, [r4, #0x3a]
    ldmia sp!, {r4, pc}
.L_0201ea1c: .word data_020d6118
    .size func_0201e9d8, .-func_0201e9d8

.global func_0201ea20
.type func_0201ea20, @function
func_0201ea20: ; 0x0201ea20
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e6e4
    ldr r0, .L_0201ea64
    ldrsh r1, [sp, #0x8]
    str r0, [r4, #0x0]
    ldrsh r0, [sp, #0xc]
    strh r1, [r4, #0x3c]
    strh r0, [r4, #0x3e]
    bl genrand_int32
    mov r1, #0x800
    tst r0, #0x1
    strh r0, [r4, #0x38]
    rsbeq r1, r1, #0x0
    mov r0, r4
    strh r1, [r4, #0x3a]
    ldmia sp!, {r4, pc}
.L_0201ea64: .word data_020d6118
    .size func_0201ea20, .-func_0201ea20

.global func_0201ea68
.type func_0201ea68, @function
func_0201ea68: ; 0x0201ea68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ea68, .-func_0201ea68

.global func_0201ea7c
.type func_0201ea7c, @function
func_0201ea7c: ; 0x0201ea7c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ea7c, .-func_0201ea7c

.global func_0201ea98
.type func_0201ea98, @function
func_0201ea98: ; 0x0201ea98
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x28]
    subs r1, r1, #0x1
    str r1, [r4, #0x28]
    bpl .L_0201eac4
    mov r1, #0x0
    bl func_0201e3b8
    mov r0, #0x1
    b .L_0201eb10
.L_0201eac4:
    ldr r1, [r4, #0x2c]
    add r0, sp, #0x0
    add r1, r1, #0x68
    bl func_020188fc
    mov r0, r4
    ldr r3, [r0, #0x0]
    ldr r1, [r4, #0x2c]
    ldr r3, [r3, #0x14]
    add r2, sp, #0x0
    add r1, r1, #0x18
    blx r3
    add r0, r4, #0x8
    add r1, r4, #0x18
    bl func_020050c8
    ldrh r2, [r4, #0x38]
    ldrsh r1, [r4, #0x3a]
    mov r0, #0x0
    add r1, r2, r1
    strh r1, [r4, #0x38]
.L_0201eb10:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    .size func_0201ea98, .-func_0201ea98

.global func_0201eb18
.type func_0201eb18, @function
func_0201eb18: ; 0x0201eb18
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r3, [r4, #0x38]
    ldr r2, [r4, #0x14]
    ldr r0, [r4, #0x30]
    mov r3, r3, asr #0x4
    mov lr, r3, lsl #0x1
    add ip, r2, r0
    add r0, lr, #0x1
    str ip, [sp, #0x0]
    mov ip, #0x8
    str ip, [sp, #0x4]
    mov r2, lr, lsl #0x1
    ldr r3, .L_0201eba8
    mov r0, r0, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r3, [r3, r0]
    ldr lr, [r4, #0xc]
    mov r0, #0x14
    ldr ip, [r4, #0x10]
    smlabb r2, r2, r0, lr
    smlabb r3, r3, r0, ip
    ldr r0, [r4, #0x4]
    bl func_02005a54
    ldr r2, [r4, #0x4]
    ldrsh r1, [r4, #0x3c]
    ldrh r0, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
    ldrsh r1, [r4, #0x3e]
    cmp r1, #0x0
    ldrge r0, [r4, #0x4]
    strgeb r1, [r0, #0x3a]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0201eba8: .word data_020c9670
    .size func_0201eb18, .-func_0201eb18
