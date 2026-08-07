    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern func_02095820

.global func_ov021_021fefcc
func_ov021_021fefcc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    mov r9, #0x0
    add r8, r4, #0x14c
    mov r7, #0x80
    mov r5, #0xac
    mov r6, #0x30
L_021fefe8:
    mul r2, r9, r6
    mla r0, r9, r5, r8
    mov r1, r7
    add r2, r2, #0x40
    bl func_02095820
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fefe8
    ldr r1, [r4, #0x54]
    cmp r1, #0x9
    beq L_021ff020
    sub r0, r1, #0xc
    cmp r0, #0x1
    bhi L_021ff034
L_021ff020:
    add r0, r4, #0x1f8
    mov r1, #0x80
    mov r2, #0x60
    bl func_02095820
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021ff034:
    cmp r1, #0x11
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r0, r4, #0x14c
    mov r1, #0x80
    mov r2, #0x60
    bl func_02095820
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov021_021fefcc, . - func_ov021_021fefcc

