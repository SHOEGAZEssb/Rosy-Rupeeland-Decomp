.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_ov056_0220e890
.extern func_ov056_0220ea40
.extern func_ov056_0220f01c
.extern func_ov056_0220f4b0

.global func_ov056_0220ef34
func_ov056_0220ef34:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x4
    add r0, r0, #0x800
    bl VecFx32Object_Assign
    add r1, r4, #0x4
    add r2, r4, #0x98
    add r0, sp, #0x0
    add r1, r1, #0x800
    add r2, r2, #0x800
    bl func_ov056_0220f01c
    ldr r0, [sp, #0x4]
    movs r1, r0, asr #0xc
    mov r0, r1, asr #0x5
    addmi r0, r1, r0, lsr #0x1a
    movmi r0, r0, asr #0x6
    submi r1, r0, #0x1
    addpl r0, r1, r0, lsr #0x1a
    movpl r1, r0, asr #0x6
    ldr r0, [sp, #0x8]
    movs r2, r0, asr #0xc
    mov r0, r2, asr #0x5
    addmi r0, r2, r0, lsr #0x1a
    movmi r0, r0, asr #0x6
    submi r2, r0, #0x1
    addpl r0, r2, r0, lsr #0x1a
    movpl r2, r0, asr #0x6
    mov r0, r4
    bl func_ov056_0220ea40
    ldr r0, [r4, #0x848]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0220f00c
    ldr r5, [r4, #0x840]
    add r4, r4, #0x3c
    b .L_0220f004
.L_0220efd0:
    ldr r6, [r5, #0x8]
    mov r0, r6
    bl func_ov056_0220f4b0
    cmp r0, #0x0
    beq .L_0220f000
    cmp r6, #0x0
    beq .L_0220eff4
    mov r0, r6
    bl Heap_Free
.L_0220eff4:
    mov r1, r5
    add r0, r4, #0x800
    bl func_ov056_0220e890
.L_0220f000:
    ldr r5, [r5, #0x0]
.L_0220f004:
    cmp r5, #0x0
    bne .L_0220efd0
.L_0220f00c:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov056_0220ef34, . - func_ov056_0220ef34
