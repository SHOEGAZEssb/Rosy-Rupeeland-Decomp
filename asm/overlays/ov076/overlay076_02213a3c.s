.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern gFx32CosSinTable
.extern data_ov076_0221480c
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern Actor_GetCachedTerrainHeight
.extern Fx32Vector2_Magnitude
.extern func_020befec
.extern func_ov076_022135d0
.extern func_ov076_02213628
.extern gGameWork
.extern gSystemState

.global func_ov076_02213a3c
func_ov076_02213a3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x34
    mov r6, r0
    ldr r1, [r6, #0x1c]
    ldr r0, [r6, #0x2c]
    sub r0, r1, r0
    cmp r0, #0x0
    ble .L_02213a80
    add r0, r6, #0x200
    ldrsh r1, [r0, #0xcc]
    add r1, r1, #0x80
    strh r1, [r0, #0xcc]
    ldrsh r1, [r0, #0xcc]
    cmp r1, #0x1000
    movgt r1, #0x1000
    strgth r1, [r0, #0xcc]
    b .L_02213ac8
.L_02213a80:
    cmp r0, #0x0
    add r0, r6, #0x200
    ldrsh r2, [r0, #0xcc]
    bge .L_02213ab0
    sub r2, r2, #0x80
    strh r2, [r0, #0xcc]
    mov r1, #0x1000
    ldrsh r2, [r0, #0xcc]
    rsb r1, r1, #0x0
    cmp r2, r1
    strlth r1, [r0, #0xcc]
    b .L_02213ac8
.L_02213ab0:
    mov r0, #0x13
    smulbb r0, r2, r0
    mov r1, #0x14
    bl func_020befec
    add r1, r6, #0x200
    strh r0, [r1, #0xcc]
.L_02213ac8:
    ldr r0, [r6, #0x29c]
    tst r0, #0x1
    beq .L_02213c2c
    ldr r4, [r6, #0x298]
    ldr r2, [r6, #0x1c]
    ldr r3, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    ldr r0, [r6, #0x20]
    sub r5, r3, r2
    sub r8, r1, r0
    ldr r2, [r4, #0x24]
    mov r0, r5
    mov r1, r8
    add r4, r2, #0xf000
    bl Fx32Vector2_Magnitude
    mov r7, r0
    add r0, sp, #0x24
    bl VecFx32Object_Init
    cmp r7, #0x1
    ble .L_02213ba4
    add r0, sp, #0x24
    mov r1, r5, lsl #0x1
    mov r2, r8, lsl #0x1
    mov r3, #0x0
    bl func_ov076_022135d0
    add r0, sp, #0x24
    mov r1, r7
    bl func_ov076_02213628
    cmp r7, #0x2000
    ble .L_02213ba4
    ldr r1, [sp, #0x28]
    ldr r5, [r6, #0x298]
    mov r0, r1, asr #0x1f
    mov r2, r0, lsl #0xd
    mov r0, #0x800
    adds r3, r0, r1, lsl #0xd
    orr r2, r2, r1, lsr #0x13
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    ldr r3, [r5, #0x1c]
    orr r2, r2, r1, lsl #0x14
    sub r1, r3, r2
    str r1, [r6, #0x1c]
    ldr r2, [sp, #0x2c]
    ldr r5, [r6, #0x298]
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xd
    adds r3, r0, r2, lsl #0xd
    orr r1, r1, r2, lsr #0x13
    adc r0, r1, #0x0
    mov r1, r3, lsr #0xc
    ldr r2, [r5, #0x20]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r6, #0x20]
.L_02213ba4:
    ldr r0, [sp, #0x28]
    str r0, [r6, #0x3c]
    ldr r0, [sp, #0x2c]
    str r0, [r6, #0x40]
    ldrb r0, [r6, #0x2ce]
    cmp r0, #0xa
    bls .L_02213c04
    ldr ip, .L_02213e3c
    add r5, sp, #0x10
    ldmia ip!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldr r0, [ip, #0x0]
    add r1, sp, #0x10
    str r0, [r5, #0x0]
    ldr r0, [r6, #0x298]
    ldrsh r2, [r0, #0xda]
    ldr r0, [r6, #0x24]
    cmp r2, #0x4
    movgt r2, #0x4
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x5
    sub r0, r2, r0
    bl func_020befec
    b .L_02213c1c
.L_02213c04:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r6, #0x44]
    sub r0, r1, r0, lsl #0x1
.L_02213c1c:
    str r0, [r6, #0x44]
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    b .L_02213c54
.L_02213c2c:
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    mov r4, r0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r6, #0x44]
    sub r0, r1, r0
    str r0, [r6, #0x44]
.L_02213c54:
    add r0, r6, #0x28
    add r1, r6, #0x18
    bl VecFx32Object_Assign
    add r0, r6, #0x18
    add r1, r6, #0x38
    bl VecFx32Object_Add
    ldr r0, [r6, #0x24]
    cmp r0, r4
    bge .L_02213c90
    str r4, [r6, #0x24]
    ldr r0, [r6, #0x44]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [r6, #0x44]
.L_02213c90:
    ldrb r0, [r6, #0x2ce]
    cmp r0, #0x0
    beq .L_02213cf0
    sub r0, r0, #0x1
    strb r0, [r6, #0x2ce]
    tst r0, #0xff
    movne r0, #0x0
    strne r0, [r6, #0x44]
    ldrb r2, [r6, #0x2ce]
    mov r0, r2, lsl #0x1c
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    cmp r2, #0x10
    movhi r2, #0x10
    ldr r0, .L_02213e40
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r2, r2, lsl #0x1
    ldr r1, [r6, #0x54]
    mul r3, r2, r0
    mov r0, r3, asr #0x5
    add r0, r3, r0, lsr #0x1a
    mov r0, r0, asr #0x6
    strh r0, [r1, #0x30]
.L_02213cf0:
    ldrb r0, [r6, #0x2cf]
    cmp r0, #0x0
    beq .L_02213d44
    sub r1, r0, #0x1
    and r2, r1, #0xff
    mov r0, r2, lsl #0x1b
    mov r0, r0, lsr #0x10
    strb r1, [r6, #0x2cf]
    mov r1, r0, asr #0x4
    ldr r0, .L_02213e40
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    cmp r2, #0x10
    movhi r2, #0x10
    mov r2, r2, lsl #0x1
    mul r0, r2, r0
    mvn r1, #0x2f
    bl func_020befec
    add r1, r6, #0x200
    strh r0, [r1, #0xca]
    b .L_02213d50
.L_02213d44:
    add r0, r6, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xca]
.L_02213d50:
    ldr r1, [r6, #0x1c]
    mov r0, r6
    str r1, [r6, #0x2ac]
    ldr r1, [r6, #0x20]
    str r1, [r6, #0x2b0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    rsb r1, r0, r0, lsl #0x5
    mov r0, r1, asr #0x3
    ldr r2, [r6, #0x2c4]
    add r0, r1, r0, lsr #0x1c
    sub r1, r2, r0, asr #0x4
    str r1, [r6, #0x2c4]
    ldr r0, [r6, #0x2b4]
    add r1, r0, r1
    str r1, [r6, #0x2b4]
    ldr r0, [r6, #0x24]
    add r0, r0, #0x1b000
    cmp r1, r0
    bge .L_02213db8
    str r0, [r6, #0x2b4]
    ldr r0, [r6, #0x2c4]
    mvn r1, #0x2
    bl func_020befec
    str r0, [r6, #0x2c4]
.L_02213db8:
    ldrb r1, [r6, #0x2d2]
    ldrsh r0, [r6, #0xda]
    cmp r0, r1
    ldr r0, .L_02213e44
    strneh r1, [r6, #0xda]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x3e4]
    cmp r0, #0x0
    beq .L_02213e34
    ldr r0, .L_02213e48
    ldrh r0, [r0, #0x6]
    tst r0, #0x100
    beq .L_02213e34
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, [r6, #0x298]
    add r1, sp, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x1
    ldr r3, [r3, #0xb8]
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [r6, #0x298]
    mov r1, #0x64
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1bc]
    blx r2
.L_02213e34:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02213e3c: .word data_ov076_0221480c
.L_02213e40: .word gFx32CosSinTable
.L_02213e44: .word gGameWork
.L_02213e48: .word gSystemState
.size func_ov076_02213a3c, . - func_ov076_02213a3c
