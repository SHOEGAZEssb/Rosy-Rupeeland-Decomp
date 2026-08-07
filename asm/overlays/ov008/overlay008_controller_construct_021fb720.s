    .text
    .extern __construct_array
    .extern data_ov008_021fc2e4
    .extern func_02004fe0
    .extern func_02005058
    .extern func_02072b68
    .extern func_0209a208
    .extern func_ov008_021fb6e0

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov008/overlay008_controller_construct.c. */
    .global func_ov008_021fb720
func_ov008_021fb720:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r5, r1
    mov r9, r2
    bl func_ov008_021fb6e0
    ldr r0, L_021fb804
    ldr r4, L_021fb808
    str r0, [r10, #0x0]
    ldr r3, L_021fb80c
    add r0, r10, #0x13c
    mov r1, #0x3c
    mov r2, #0x10
    str r4, [sp, #0x0]
    bl __construct_array
    mov r0, #0x3c
    str r5, [r10, #0x48]
    ldr r6, L_021fb810
    sub r8, r0, #0x1
    mov r7, #0x2
    mov r5, #0x0
    mov r11, #0x40000
    mvn r4, #0x0
L_021fb77c:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    ldr ip, [ip, #0x0]
    mov r2, r11
    mov r3, #0x64000
    blx ip
    add r3, r10, r8, lsl #0x2
    ldr r2, [r3, #0x4c]
    mov r1, #0x3
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r3, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r10, r8, lsl #0x2
    str r4, [r0, #0x754]
    subs r8, r8, #0x1
    bpl L_021fb77c
    mov r0, r10
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fb804: .word data_ov008_021fc2e4
L_021fb808: .word func_02005058
L_021fb80c: .word func_02004fe0
L_021fb810: .word 0x12d8
    .size func_ov008_021fb720, . - func_ov008_021fb720
