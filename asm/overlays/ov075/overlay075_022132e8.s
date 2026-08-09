.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_020ae024

.global func_ov075_022132e8
func_ov075_022132e8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r3, [r5, #0x20]
    ldr r0, [r1, #0x8]
    ldr lr, [r5, #0x1c]
    ldr ip, [r1, #0x4]
    mov r4, r2
    sub r0, r3, r0
    subs r1, lr, ip
    cmpeq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    rsb r0, r0, #0x0
    bl func_020ae024
    ldr r3, [r5, #0x54]
    ldrsh r1, [r3, #0x30]
    cmp r0, r1
    addlt r0, r0, #0x10000
    sub r2, r0, r1
    cmp r2, #0x8000
    bge .L_02213344
    cmp r2, r4
    movgt r2, r4
    b .L_0221335c
.L_02213344:
    rsb r2, r2, #0x10000
    cmp r2, r4
    movgt r2, r4
    mvn r0, #0x0
    mul r0, r2, r0
    mov r2, r0
.L_0221335c:
    add r0, r1, r2
    strh r0, [r3, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov075_022132e8, . - func_ov075_022132e8
