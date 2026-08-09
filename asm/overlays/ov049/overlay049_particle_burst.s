.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern Sound_Play
.extern gSoundContext
.extern genrand_int32

.global func_ov049_0220c2dc
func_ov049_0220c2dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r6, #0x28000
    mov r10, r0
    cmp r2, #0x1
    moveq r6, #0x10000
    mov r0, #0xa
    mov r9, r1
    mov r5, #0x0
    sub r7, r0, #0x1
    rsb r8, r6, #0x0
    mov r11, #0x1
    mov r4, #0x3c
.L_0220c30c:
    add r0, r10, r7, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220c380
    mla r0, r7, r4, r10
    ldr r3, [r9, #0x4]
    ldr r2, [r0, #0x20]
    ldr r1, [r9, #0x8]
    ldr r0, [r0, #0x24]
    sub r2, r3, r2
    cmp r2, r6
    sub r0, r1, r0
    bge .L_0220c380
    cmp r2, r8
    ble .L_0220c380
    cmp r0, r6
    bge .L_0220c380
    cmp r0, r8
    ble .L_0220c380
    bl genrand_int32
    and r1, r0, #0x7
    add r0, r10, r7, lsl #0x1
    add r1, r1, #0x1
    add r0, r0, #0x600
    mov r5, r11
    strh r1, [r0, #0x6c]
.L_0220c380:
    subs r7, r7, #0x1
    bpl .L_0220c30c
    cmp r5, #0x0
    beq .L_0220c3c8
    ldr r0, [r10, #0x0]
    cmp r0, #0x0
    bne .L_0220c3b4
    ldr r0, .L_0220c3d0
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    b .L_0220c3c8
.L_0220c3b4:
    ldr r0, .L_0220c3d0
    ldr r1, .L_0220c3d4
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
.L_0220c3c8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c3d0: .word gSoundContext
.L_0220c3d4: .word 0x1c5
.size func_ov049_0220c2dc, . - func_ov049_0220c2dc
