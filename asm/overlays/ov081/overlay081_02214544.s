.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_UpdatePresentation
.extern func_ov081_02214524

.global func_ov081_02214544
func_ov081_02214544:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r4, r2
    bl Actor_UpdatePresentation
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022145b0
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x8]
    add r0, r5, #0x244
    sub r1, r1, #0x18000
    str r1, [sp, #0x8]
    ldr ip, [r0, #0x0]
    add r2, sp, #0x0
    ldr ip, [ip, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx ip
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_022145bc
.L_022145b0:
    add r0, r5, #0x244
    mov r1, #0x0
    bl func_ov081_02214524
.L_022145bc:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov081_02214544, . - func_ov081_02214544
