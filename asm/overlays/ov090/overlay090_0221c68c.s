.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_effect_orientation.c.
.extern func_020ae024
.extern func_ov090_0221c728

.global func_ov090_0221c68c
func_ov090_0221c68c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r3, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    subs r1, r3, r1
    sub r0, r0, r2
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, pc}
    rsb r0, r0, #0x0
    bl func_020ae024
    add r1, r0, #0xc000
    ldr r0, [r4, #0x4]
    mov r2, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    rsb r1, r2, r1, lsl #0x10
    ldrsh r3, [r3, #0x30]
    add r1, r2, r1, ror #0x10
    cmp r1, r3
    addlt r1, r1, #0x10000
    sub r2, r1, r3
    cmp r2, #0x8000
    bge .L_0221c6f4
    cmp r2, #0x400
    movgt r2, #0x400
    b .L_0221c70c
.L_0221c6f4:
    rsb r2, r2, #0x10000
    cmp r2, #0x400
    movgt r2, #0x400
    mvn r1, #0x0
    mul r1, r2, r1
    mov r2, r1
.L_0221c70c:
    add r1, r3, r2
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    bl func_ov090_0221c728
    ldmia sp!, {r4, pc}
.size func_ov090_0221c68c, . - func_ov090_0221c68c
