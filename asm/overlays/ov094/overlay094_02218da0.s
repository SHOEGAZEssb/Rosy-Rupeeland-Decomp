.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern func_0209189c

.global func_ov094_02218da0
func_ov094_02218da0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, [r7, #0xb8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r7, #0xb8]
    bgt .L_02218ecc
    add r0, r7, #0xa0
    mov r1, #0xa
    mov r2, #0x14
    bl func_0209189c
    str r0, [r7, #0xb8]
    ldr r0, [r7, #0x9c]
    add r1, r7, #0xa4
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r9, r0
    add r0, r7, #0xa0
    mvn r1, #0x17
    mov r2, #0x18
    ldr r5, [r7, #0x20]
    ldr r6, [r7, #0x10]
    bl func_0209189c
    mov r4, r0
    add r0, r7, #0xa0
    mvn r1, #0x17
    mov r2, #0x18
    bl func_0209189c
    mov r8, r0
    mov r0, r9
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r2, #0x100
    str r2, [sp, #0x8]
    mov r2, r6, asr #0xb
    add r2, r6, r2, lsr #0x14
    add r2, r4, r2, asr #0xc
    mov r3, r5, asr #0xb
    add r3, r5, r3, lsr #0x14
    add r3, r8, r3, asr #0xc
    bl func_02073e48
    ldr r0, [r7, #0xb4]
    add r1, r7, #0xa4
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r8, r0
    ldr r5, [r7, #0x20]
    ldr r6, [r7, #0x10]
    add r0, r7, #0xa0
    mvn r1, #0x17
    mov r2, #0x18
    bl func_0209189c
    mov r4, r0
    add r0, r7, #0xa0
    mvn r1, #0x17
    mov r2, #0x18
    bl func_0209189c
    mov r7, r0
    mov r0, r8
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r2, #0x100
    str r2, [sp, #0x8]
    mov r2, r6, asr #0xb
    add r2, r6, r2, lsr #0x14
    add r2, r4, r2, asr #0xc
    mov r3, r5, asr #0xb
    add r3, r5, r3, lsr #0x14
    add r3, r7, r3, asr #0xc
    bl func_02073e48
.L_02218ecc:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.size func_ov094_02218da0, . - func_ov094_02218da0
