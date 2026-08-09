.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern GXx_SetMasterBrightness_

.global func_ov063_0221028c
func_ov063_0221028c:
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x24]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r2, #0x20]
    ldr r1, .L_0221030c
    eor lr, r0, #0x1
    ldrh r4, [r1, #0x0]
    add r3, r2, #0x24
    mov r0, #0x180
    add r2, r2, #0x324
    mov r1, #0xc0
    mla ip, lr, r0, r3
    mla r3, lr, r1, r2
    cmp r4, #0xc0
    bge .L_02210304
    mov r1, r4, lsl #0x1
    ldrsh r1, [ip, r1]
    add r0, r0, #0x7f
    ldr r2, .L_02210310
    and r0, r1, r0
    str r0, [r2, #0x0]
    ldrsb r1, [r3, r4]
    add r0, r2, #0x58
    bl GXx_SetMasterBrightness_
.L_02210304:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0221030c: .word 0x4000006
.L_02210310: .word 0x4001014
.size func_ov063_0221028c, . - func_ov063_0221028c
