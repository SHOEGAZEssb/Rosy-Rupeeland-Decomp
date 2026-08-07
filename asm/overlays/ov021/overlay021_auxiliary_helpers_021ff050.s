    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern func_02095820

.global func_ov021_021ff050
func_ov021_021ff050:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    str r1, [r5, #0x2c4]
    add r0, r5, r1, lsl #0x2
    ldr r0, [r0, #0x2a4]
    mov r4, #0x0
    str r0, [r5, #0x2c0]
    add r9, r5, #0x14c
    mvn r8, #0x3f
    mov r6, #0xac
    mov r7, #0x30
L_021ff07c:
    ldr r0, [r5, #0x2c4]
    cmp r4, r0
    beq L_021ff09c
    mul r2, r4, r7
    mla r0, r4, r6, r9
    mov r1, r8
    add r2, r2, #0x40
    bl func_02095820
L_021ff09c:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_021ff07c
    ldr r1, [r5, #0x2c4]
    add r2, r5, #0x14c
    mov r0, #0xac
    mla r0, r1, r0, r2
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov021_021ff050, . - func_ov021_021ff050

