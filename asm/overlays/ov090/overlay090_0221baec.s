.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_presentation.c.
.extern func_020ae024

.global func_ov090_0221baec
func_ov090_0221baec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x10]
    ldr r0, [r1, #0x8]
    ldr ip, [r4, #0xc]
    ldr r3, [r1, #0x4]
    sub r0, r2, r0
    subs r1, ip, r3
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, pc}
    rsb r0, r0, #0x0
    bl func_020ae024
    ldr r3, [r4, #0x4]
    ldr ip, [r3, #0x4]
    ldrsh r1, [ip, #0x30]
    cmp r0, r1
    addlt r0, r0, #0x10000
    sub r2, r0, r1
    cmp r2, #0x8000
    bge .L_0221bb48
    cmp r2, #0x300
    movgt r2, #0x300
    b .L_0221bb60
.L_0221bb48:
    rsb r2, r2, #0x10000
    cmp r2, #0x300
    movgt r2, #0x300
    mvn r0, #0x0
    mul r0, r2, r0
    mov r2, r0
.L_0221bb60:
    add r0, r1, r2
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    strh r1, [ip, #0x30]
    ldr r0, [r3, #0x8]
    strh r1, [r0, #0x30]
    ldmia sp!, {r4, pc}
.size func_ov090_0221baec, . - func_ov090_0221baec
