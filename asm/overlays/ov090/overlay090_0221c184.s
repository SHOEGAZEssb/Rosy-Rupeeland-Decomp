.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_chain_curve_update.c.
.extern data_020c9670
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_ov090_0221a460
.extern func_ov090_0221a498
.extern func_ov090_0221bc0c
.extern func_ov090_0221c138

.global func_ov090_0221c184
func_ov090_0221c184:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x80
    mov r10, r0
    add r0, sp, #0x70
    mov r9, r1
    mov r8, r2
    ldr r7, [sp, #0xa8]
    bl VecFx32Object_Init
    add r0, sp, #0x60
    bl VecFx32Object_Init
    mov r5, #0x0
    ldr r4, .L_0221c310
    add r11, sp, #0x50
    b .L_0221c2b4
.L_0221c1bc:
    ldrh r2, [r10, #0xa]
    mov r0, r11
    mov r1, r8
    mul r3, r2, r5
    mov r2, r3, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r6, [r4, r2]
    mov r2, r9
    bl func_ov090_0221c138
    mov r2, r6
    add r0, sp, #0x40
    mov r1, r11
    bl func_ov090_0221a498
    add r0, sp, #0x30
    mov r1, r9
    add r2, sp, #0x40
    bl func_ov090_0221a460
    add r0, sp, #0x60
    add r1, sp, #0x30
    bl VecFx32Object_Assign
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    mov r0, r11
    bl VecFx32Object_Destroy
    ldr r2, [r10, #0x4]
    add r0, sp, #0x20
    ldr r2, [r2, r5, lsl #0x2]
    add r1, sp, #0x60
    add r2, r2, #0x8
    bl func_ov090_0221c138
    ldr r2, .L_0221c314
    add r0, sp, #0x10
    add r1, sp, #0x20
    bl func_ov090_0221a498
    ldr r1, [r10, #0x4]
    add r0, sp, #0x0
    ldr r1, [r1, r5, lsl #0x2]
    add r2, sp, #0x10
    add r1, r1, #0x8
    bl func_ov090_0221a460
    ldr r0, [r10, #0x4]
    add r1, sp, #0x0
    ldr r0, [r0, r5, lsl #0x2]
    add r0, r0, #0x8
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    cmp r7, #0x0
    beq .L_0221c2b0
    ldr r0, [r10, #0x4]
    ldr r1, [r10, #0x14]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_ov090_0221bc0c
.L_0221c2b0:
    add r5, r5, #0x1
.L_0221c2b4:
    ldrsh r0, [r10, #0x8]
    sub r2, r0, #0x1
    cmp r5, r2
    blt .L_0221c1bc
    ldr r0, [r10, #0x4]
    mov r1, r8
    ldr r0, [r0, r2, lsl #0x2]
    add r0, r0, #0x8
    bl VecFx32Object_Assign
    cmp r7, #0x0
    beq .L_0221c2f8
    ldrsh r0, [r10, #0x8]
    ldr r2, [r10, #0x4]
    ldr r1, [r10, #0x14]
    sub r0, r0, #0x1
    ldr r0, [r2, r0, lsl #0x2]
    bl func_ov090_0221bc0c
.L_0221c2f8:
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    add r0, sp, #0x70
    bl VecFx32Object_Destroy
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221c310: .word data_020c9670
.L_0221c314: .word 0x19a
.size func_ov090_0221c184, . - func_ov090_0221c184
