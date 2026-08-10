; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text
.extern func_020b4554
.extern func_020b581c

    .global AnimatedTileStagingBuffer_CopyFrom
    .type AnimatedTileStagingBuffer_CopyFrom, @function
AnimatedTileStagingBuffer_CopyFrom: ; 0x0202b854
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r1
    add r1, r5, #0x1000
    mov r6, r0
    ldr r2, [r1, #0x80c]
    add r0, r6, #0x1000
    str r2, [r0, #0x80c]
    ldr r2, [r1, #0x810]
    mov r8, #0x800
    str r2, [r0, #0x810]
    ldr r2, [r1, #0x814]
    mov r4, #0x0
    str r2, [r0, #0x814]
    ldr r1, [r1, #0x818]
    mov r7, r8
    str r1, [r0, #0x818]
.L_0202b894:
    add r9, r6, r4, lsl #0xb
    mov r0, r9
    mov r1, r8
    bl func_020b4554
    mov r1, r9
    mov r2, r7
    add r0, r5, r4, lsl #0xb
    bl func_020b581c
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0202b894
    add r0, r5, #0x4
    add r2, r6, #0x4
    add r1, r0, #0x1800
    ldr r4, .L_0202b92c
    mov r3, #0x0
    add r0, r2, #0x1800
.L_0202b8d8:
    mov r2, r3, lsl #0x1
    ldrsh r5, [r1, r2]
    ldrsh r6, [r0, r2]
    add r3, r3, #0x1
    mov r5, r5, lsl #0x1c
    mov r5, r5, asr #0x1c
    bic r6, r6, #0xf
    and r5, r5, #0xf
    orr r5, r6, r5
    strh r5, [r0, r2]
    ldrsh r5, [r1, r2]
    ldrsh r6, [r0, r2]
    cmp r3, #0x4
    mov r5, r5, lsl #0x10
    mov r5, r5, asr #0x14
    and r6, r6, r4
    mov r5, r5, lsl #0x14
    orr r5, r6, r5, lsr #0x10
    strh r5, [r0, r2]
    blt .L_0202b8d8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0202b92c: .word 0xffff000f
    .size AnimatedTileStagingBuffer_CopyFrom, . - AnimatedTileStagingBuffer_CopyFrom
