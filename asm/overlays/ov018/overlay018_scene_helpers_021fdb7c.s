    .text
/* Exact fallback; see src/overlays/ov018/overlay018_scene_helpers.c. */
    .extern data_020d4a60
    .extern data_ov018_021ffd08
    .extern func_02028388
    .extern func_02072b68
    .extern func_02092260
    .extern func_02092288
    .extern func_020ae024
    .extern func_020befec
.global func_ov018_021fdb7c
func_ov018_021fdb7c:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r1, [r0, #0x188]
    ldr r0, [r0, #0xd0]
    addne r2, r1, #0x19
    addeq r2, r1, #0xa
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    ldmeqia sp!, {r3, pc}
    and r1, r2, #0xff
    bl func_02072b68
    ldmia sp!, {r3, pc}
    .size func_ov018_021fdb7c, . - func_ov018_021fdb7c

    .global func_ov018_021fdbac
func_ov018_021fdbac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x40c]
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x4c
    bl func_02092260
    mov r0, #0x1
    str r0, [r4, #0x40c]
    ldmia sp!, {r4, pc}
    .size func_ov018_021fdbac, . - func_ov018_021fdbac

    .global func_ov018_021fdbd4
func_ov018_021fdbd4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x40c]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x4c
    bl func_02092288
    mov r0, #0x0
    str r0, [r4, #0x40c]
    ldmia sp!, {r4, pc}
    .size func_ov018_021fdbd4, . - func_ov018_021fdbd4

    .global func_ov018_021fdbfc
func_ov018_021fdbfc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x184]
    ldr lr, [r4, #0x38]
    ldr r2, [r3, #0x24]
    ldr r0, [r3, #0x1c]
    ldr ip, [r4, #0x60]
    mov r1, r0, asr #0xc
    ldr r3, [r3, #0x20]
    mov r0, r2, asr #0xc
    rsb r0, r0, r3, asr #0xc
    ldr r3, [r4, #0x34]
    ldr r2, [r4, #0x5c]
    add r0, r0, r0, lsr #0x1f
    add ip, lr, ip
    add r1, r1, r1, lsr #0x1f
    add r2, r3, r2
    rsb r0, ip, r0, asr #0x1
    rsb r1, r2, r1, asr #0x1
    bl func_020ae024
    ldr r1, L_021fdc60
    mov r0, r0, asr #0xc
    ldrsb r0, [r1, r0]
    str r0, [r4, #0x188]
    ldmia sp!, {r4, pc}
L_021fdc60: .word data_ov018_021ffd08
    .size func_ov018_021fdbfc, . - func_ov018_021fdbfc

    .global func_ov018_021fdc64
func_ov018_021fdc64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x38]
    ldr r0, [r4, #0x1a4]
    mov r1, #0x180
    mla r2, r0, r1, r2
    ldr r0, [r4, #0x60]
    add r0, r0, r2
    bl func_020befec
    ldr r2, [r4, #0x34]
    ldr r1, [r4, #0x1a0]
    ldr r3, [r4, #0x5c]
    add r1, r2, r1, lsl #0x9
    add r2, r3, r1
    mov r1, r2, asr #0x8
    add r1, r2, r1, lsr #0x17
    mov r2, r0, lsl #0x4
    ldr r0, L_021fdce0
    add r1, r2, r1, asr #0x9
    ldr r0, [r0, r1, lsl #0x2]
    mvn r1, #0x0
    cmp r0, #0x0
    beq L_021fdccc
    sub r0, r0, #0x1
    bl func_02028388
    ldrsb r1, [r0, #0x4d]
L_021fdccc:
    ldr r0, [r4, #0x19c]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdce0: .word data_020d4a60
    .size func_ov018_021fdc64, . - func_ov018_021fdc64
