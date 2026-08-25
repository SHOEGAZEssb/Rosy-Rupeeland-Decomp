    .text

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scroll_apply.c. */
    .global Overlay009_ApplyScroll
Overlay009_ApplyScroll: ; 0x021fea4c
    stmdb sp!, {r3, lr}
    ldr r2, L_021feaa8
    ldr r3, [r0, #0xf0]
    ldr r1, [r0, #0xf4]
    rsb ip, r3, #0x0
    rsb r3, r1, #0x0
    mov r1, r2, lsl #0x10
    and lr, ip, r2
    and r1, r1, r3, lsl #0x10
    ldr ip, L_021feaac
    orr r1, lr, r1
    str r1, [ip, #0x0]
    ldr r1, [r0, #0xf0]
    ldr r0, [r0, #0xf4]
    rsb r3, r1, #0x0
    rsb r1, r0, #0x0
    mov r0, r2, lsl #0x10
    and r2, r3, r2
    and r0, r0, r1, lsl #0x10
    orr r0, r2, r0
    str r0, [ip, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021feaa8: .word 0x1ff
L_021feaac: .word 0x4000018

    .size Overlay009_ApplyScroll, . - Overlay009_ApplyScroll
