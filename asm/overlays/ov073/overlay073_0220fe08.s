.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern VecFx32Object_Add
.extern func_0201e3b8

.global func_ov073_0220fe08
func_ov073_0220fe08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x3c]
    add r0, r0, #0x400
    strh r0, [r4, #0x3c]
    ldrsh r0, [r4, #0x3e]
    sub r0, r0, #0x2
    strh r0, [r4, #0x3e]
    ldrsh r0, [r4, #0x3e]
    cmp r0, #0x1
    movlt r0, #0x1
    strlth r0, [r4, #0x3e]
    ldrsh r0, [r4, #0x42]
    cmp r0, #0x0
    ble .L_0220fe64
    sub r0, r0, #0x1
    strh r0, [r4, #0x42]
    ldrsh r0, [r4, #0x42]
    cmp r0, #0x0
    bne .L_0220fe64
    mov r0, r4
    mov r1, #0x1
    bl func_0201e3b8
.L_0220fe64:
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_0220fe9c
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x2c
    ldr r2, [r2, #0xc]
    blx r2
    add r0, r4, #0x8
    add r1, r4, #0x18
    bl VecFx32Object_Add
.L_0220fe9c:
    ldr r0, [r4, #0x28]
    subs r0, r0, #0x1
    str r0, [r4, #0x28]
    mov r0, #0x0
    strmi r0, [r4, #0x28]
    movmi r0, #0x1
    ldmia sp!, {r4, pc}
.size func_ov073_0220fe08, . - func_ov073_0220fe08
