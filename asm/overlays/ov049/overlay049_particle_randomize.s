.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern genrand_int32

.global func_ov049_0220c67c
func_ov049_0220c67c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0xa
    mov r5, r0
    sub r4, r1, #0x1
.L_0220c68c:
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220c6c0
    bl genrand_int32
    and r1, r0, #0x7
    add r0, r5, r4, lsl #0x1
    add r1, r1, #0x1
    add r0, r0, #0x600
    strh r1, [r0, #0x6c]
.L_0220c6c0:
    subs r4, r4, #0x1
    bpl .L_0220c68c
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov049_0220c67c, . - func_ov049_0220c67c
