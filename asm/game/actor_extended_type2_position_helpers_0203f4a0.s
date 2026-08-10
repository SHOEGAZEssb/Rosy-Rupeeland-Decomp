; Matching retail form; see src/game/actor_extended_type2_position_helpers.c.
.text
.extern func_020050a4
.extern Actor_RefreshTerrainHeight
.extern func_02045364
.extern func_0204539c
.extern func_020453b0
.extern genrand_int32
    .global func_0203f4a0
    .type func_0203f4a0, @function
func_0203f4a0: ; 0x0203f4a0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r0, [r0, #0x6a]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x26c]
    bl func_02045364
    ldr r0, [r4, #0x26c]
    bl func_0204539c
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x230]
    ldr r0, [r4, #0x26c]
    bl func_020453b0
    ldr r1, [r0, #0x0]
    add r0, r4, #0x200
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x234]
    mov r1, #0x0
    strh r1, [r0, #0x5a]
    ldmia sp!, {r4, pc}
    .size func_0203f4a0, . - func_0203f4a0

    .global func_0203f4f8
    .type func_0203f4f8, @function

func_0203f4f8: ; 0x0203f4f8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x18
    add r1, r4, #0x22c
    bl func_020050a4
    add r0, r4, #0x200
    ldrh r0, [r0, #0x72]
    tst r0, #0x1c
    beq .L_0203f594
    tst r0, #0x4
    beq .L_0203f540
    bl genrand_int32
    and r0, r0, #0x3f
    rsb r5, r0, #0x20
    bl genrand_int32
    and r0, r0, #0x3f
    rsb r1, r0, #0x20
    b .L_0203f57c
.L_0203f540:
    tst r0, #0x8
    beq .L_0203f564
    bl genrand_int32
    and r0, r0, #0x7f
    rsb r5, r0, #0x40
    bl genrand_int32
    and r0, r0, #0x7f
    rsb r1, r0, #0x40
    b .L_0203f57c
.L_0203f564:
    bl genrand_int32
    and r0, r0, #0xff
    rsb r5, r0, #0x80
    bl genrand_int32
    and r0, r0, #0xff
    rsb r1, r0, #0x80
.L_0203f57c:
    ldr r0, [r4, #0x1c]
    add r0, r0, r5, lsl #0xc
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x20]
    add r0, r0, r1, lsl #0xc
    str r0, [r4, #0x20]
.L_0203f594:
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    ldr r2, [r4, #0x1dc]
    add r0, r4, #0x28
    add r1, r4, #0x18
    str r2, [r4, #0x24]
    bl func_020050a4
    mov r0, #0x0
    str r0, [r4, #0x44]
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0203f4f8, . - func_0203f4f8
