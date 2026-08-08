.text

/* Exact fallback; see src/overlays/ov032/overlay032_unlock_effect.c for documented portable C. */
.extern func_020bf1f8
.extern func_ov032_02201450
.extern genrand_int32

    .global func_ov032_022001c0
func_ov032_022001c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, [r7, #0xc1c]
    cmp r0, #0x1
    beq L_022001e0
    cmp r0, #0x2
    beq L_022001f4
    b L_02200208
L_022001e0:
    mov r0, #0xaf
    mov r1, #0x64
    mov r2, #0xd7
    mov r3, #0x90
    b L_02200218
L_022001f4:
    mov r0, #0xaa
    mov r1, #0x50
    mov r2, #0xd7
    mov r3, #0x90
    b L_02200218
L_02200208:
    mov r0, #0xa0
    mov r1, #0x28
    mov r2, #0xdc
    mov r3, #0x90
L_02200218:
    str r0, [r7, #0xeb4]
    str r1, [r7, #0xeb8]
    str r2, [r7, #0xebc]
    str r3, [r7, #0xec0]
    mov r5, #0x0
    add r4, r7, #0x334
    mov r9, #0x28
    mov r8, #0x30
L_02200238:
    mul r6, r5, r8
    ldr r1, [r7, #0x0]
    add r0, r4, r6
    add r2, r7, #0x4c
    bl func_ov032_02201450
    add r6, r7, r6
    ldr r1, [r6, #0x334]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bl genrand_int32
    mov r1, r9
    bl func_020bf1f8
    add r0, r1, #0x1
    add r5, r5, #0x1
    str r0, [r6, #0x35c]
    cmp r5, #0x28
    blt L_02200238
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov032_022001c0, .-func_ov032_022001c0

