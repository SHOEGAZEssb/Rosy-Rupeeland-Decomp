.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220f40c
func_ov056_0220f40c:
    cmp r1, #0x0
    blt .L_0220f420
    ldr ip, [r0, #0x8]
    cmp r1, ip
    blt .L_0220f428
.L_0220f420:
    mvn r0, #0x0
    bx lr
.L_0220f428:
    cmp r2, #0x0
    blt .L_0220f43c
    ldr r3, [r0, #0xc]
    cmp r2, r3
    blt .L_0220f444
.L_0220f43c:
    mvn r0, #0x0
    bx lr
.L_0220f444:
    mla r1, r2, ip, r1
    ldr r2, [r0, #0x0]
    mov r0, r1, lsl #0x1
    ldrh r0, [r2, r0]
    bx lr
.size func_ov056_0220f40c, . - func_ov056_0220f40c
