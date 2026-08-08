.text

/* Exact fallback; see src/overlays/ov028/overlay028_list_sprites.c. */
.extern func_02074110
.extern func_02073e48
.extern func_02073ef8
.extern func_02073ffc
.extern func_ov028_021fd390
.extern func_ov028_021fd420

.global func_ov028_021fd2c4
func_ov028_021fd2c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x50]
    bl func_02074110
    ldr r0, [r4, #0x4]
    bl func_02074110
    ldmia sp!, {r4, pc}
.size func_ov028_021fd2c4, .-func_ov028_021fd2c4

.global func_ov028_021fd2ec
func_ov028_021fd2ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x44]
    mov r0, #0x18
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x4]
    mul r0, r2, r0
    rsb r0, r0, #0x1c
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x44]
    ldr r5, [r0, #0xc]
    b L_021fd32c
L_021fd31c:
    mov r0, r4
    mov r1, r5
    bl func_ov028_021fd390
    add r5, r5, #0x1
L_021fd32c:
    ldr r0, [r4, #0x44]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd31c
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov028_021fd2ec, .-func_ov028_021fd2ec

.global func_ov028_021fd34c
func_ov028_021fd34c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x44]
    ldr r5, [r0, #0xc]
    b L_021fd370
L_021fd360:
    mov r0, r4
    mov r1, r5
    bl func_ov028_021fd420
    add r5, r5, #0x1
L_021fd370:
    ldr r0, [r4, #0x44]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd360
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov028_021fd34c, .-func_ov028_021fd34c

.global func_ov028_021fd390
func_ov028_021fd390:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr r0, [r6, #0x40]
    mov r5, r1
    cmp r5, r0
    bge L_021fd418
    mov r0, #0xc
    mul r4, r5, r0
    ldr r1, [r6, #0x38]
    add r0, r1, r4
    ldr r0, [r0, #0x4]
    ldr r7, [r1, r4]
    cmp r0, #0x0
    bne L_021fd418
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl func_02073ffc
    ldr r1, [r6, #0x38]
    cmp r7, #0x0
    add r1, r1, r4
    str r0, [r1, #0x4]
    ldr r2, [r6, #0x38]
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r1, r2, r4
    ldrsh r2, [r1, #0x8]
    ldrsh r3, [r1, #0xa]
    addne r5, r5, #0x32
    mov r1, r5
    bl func_02073e48
L_021fd418:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.size func_ov028_021fd390, .-func_ov028_021fd390

.global func_ov028_021fd420
func_ov028_021fd420:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x40]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0xc
    mul r4, r1, r0
    ldr r0, [r5, #0x38]
    add r0, r0, r4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02073ef8
    ldr r0, [r5, #0x38]
    mov r1, #0x0
    add r0, r0, r4
    str r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov028_021fd420, .-func_ov028_021fd420
