.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern genrand_int32

.global func_ov049_0220c254
func_ov049_0220c254:
    stmdb sp!, {r3, r4, r5, lr}
    mov r2, #0xa
    mov r5, r0
    sub r4, r2, #0x1
.L_0220c264:
    add r0, r5, r4, lsl #0x1
    add r2, r0, #0x600
    ldrsh r0, [r2, #0x44]
    cmp r0, #0x0
    ldreqsh r0, [r2, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220c2cc
    ldrsh r0, [r2, #0x94]
    cmp r0, #0x3c
    ble .L_0220c2cc
    mov r0, #0x3c
    mla ip, r4, r0, r5
    ldr r0, [ip, #0x20]
    mov r3, #0x1
    str r0, [r1, #0x4]
    ldr ip, [ip, #0x24]
    mov r0, #0x0
    str ip, [r1, #0x8]
    strh r3, [r2, #0x44]
    strh r0, [r2, #0x6c]
    bl genrand_int32
    add r1, r5, r4, lsl #0x1
    add r1, r1, #0x600
    strh r0, [r1, #0x94]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0220c2cc:
    subs r4, r4, #0x1
    bpl .L_0220c264
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov049_0220c254, . - func_ov049_0220c254
