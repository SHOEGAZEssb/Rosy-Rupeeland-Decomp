.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_separation.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32Object_Normalize
.extern VecFx32Object_Add
.extern func_020adc90
.extern func_020befec
.extern func_ov090_0221b3d0

.global func_ov090_0221b280
func_ov090_0221b280:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    mov r5, #0x0
.L_0221b290:
    add r11, r10, r5, lsl #0x2
    ldr r0, [r11, #0x1f4]
    mov r8, #0x1
    ldrsh r6, [r0, #0xda]
    mov r0, r6, lsl #0x3
    add r0, r0, #0x32
    mul r7, r0, r0
.L_0221b2ac:
    mov r1, #0x3
    add r0, r5, r8
    bl func_020befec
    mov r9, r1
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x1f4]
    ldrsh r0, [r1, #0xda]
    cmp r6, r0
    ble .L_0221b3b0
    ldr r0, [r11, #0x1f4]
    ldr r3, [r1, #0x1c]
    ldr r2, [r1, #0x20]
    ldr r1, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r3, asr #0xc
    mov r0, r0, asr #0xc
    rsb r2, r0, r2, asr #0xc
    mul r0, r2, r2
    mla r0, r1, r1, r0
    cmp r0, #0x0
    ble .L_0221b3b0
    cmp r0, r7
    bge .L_0221b3b0
    add r0, sp, #0x4
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x4
    bl VecFx32Object_Normalize
    add r0, sp, #0x4
    mov r1, #0x2000
    bl func_ov090_0221b3d0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f4]
    add r1, sp, #0x4
    add r0, r0, #0x88
    bl VecFx32Object_Add
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f4]
    add r0, r0, #0x88
    bl VecFx32Object_GetMagnitude
    str r0, [sp, #0x0]
    cmp r0, #0x3000
    ble .L_0221b3a8
    add r0, r10, r9, lsl #0x2
    ldr r4, [r0, #0x1f4]
    ldr r1, [sp, #0x0]
    ldr r0, [r4, #0x8c]
    bl func_020adc90
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x90]
    ldr r1, [sp, #0x0]
    bl func_020adc90
    str r0, [r4, #0x90]
    ldr r1, [sp, #0x0]
    ldr r0, [r4, #0x94]
    bl func_020adc90
    str r0, [r4, #0x94]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x1f4]
    mov r1, #0x3000
    add r0, r0, #0x88
    bl func_ov090_0221b3d0
.L_0221b3a8:
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
.L_0221b3b0:
    add r8, r8, #0x1
    cmp r8, #0x2
    ble .L_0221b2ac
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0221b290
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov090_0221b280, . - func_ov090_0221b280
