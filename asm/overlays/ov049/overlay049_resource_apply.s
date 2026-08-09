.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_resource_recovery.c.
.extern func_020050c8
.extern func_0209f09c
.extern func_ov039_021fee00
.extern func_ov039_02201620

.global func_ov049_0220be28
func_ov049_0220be28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x84]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x98]
    add r1, r4, #0x8c
    sub r0, r0, #0x9a
    sub r0, r0, #0x100
    str r0, [r4, #0x98]
    ldr r0, [r4, #0x84]
    add r0, r0, #0x2c
    bl func_020050c8
    ldr r2, [r4, #0x84]
    ldr r0, [r2, #0x38]
    cmp r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r0, [r2, #0x42]
    mov r1, #0x0
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r4, #0x84]
    str r1, [r0, #0x38]
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x84]
    ldr r0, [r0, #0x10]
    add r1, r1, #0x2c
    bl func_0209f09c
    ldr r2, [r4, #0x48]
    ldr r0, [r2, #0x8]
    ldrsh r0, [r0, #0xb8]
    cmp r0, #0x1
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r2, #0x14]
    ldr r1, [r4, #0x84]
    cmp r0, #0x0
    beq .L_0220bed8
    add r1, r1, #0x2c
    bl func_ov039_021fee00
    ldmia sp!, {r4, pc}
.L_0220bed8:
    ldr r0, [r2, #0x18]
    add r1, r1, #0x2c
    bl func_ov039_02201620
    ldmia sp!, {r4, pc}
.size func_ov049_0220be28, . - func_ov049_0220be28
