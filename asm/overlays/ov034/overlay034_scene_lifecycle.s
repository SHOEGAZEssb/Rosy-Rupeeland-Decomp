.text

/* Exact fallback; see src/overlays/ov034/overlay034_scene_lifecycle.c for documented portable C. */

    .extern func_02071e04
    .extern func_020597fc
    .extern func_02077ac4
    .extern func_ov034_021fce00
    .extern Heap_Free
    .extern func_02077b44
    .extern func_02077a24
    .extern func_ov034_021fd90c
    .extern func_ov034_021fd938
    .extern func_ov034_021fce50
    .extern func_ov034_021fd6f4
    .extern data_020f4e18
    .extern gSoundContext


    .global func_ov034_021fdda4
func_ov034_021fdda4: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq L_021fddc4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fddc4:
    mov r5, #0x0
    b L_021fddec
L_021fddcc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq L_021fdde8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdde8:
    add r5, r5, #0x1
L_021fddec:
    ldr r0, [r4, #0x1b0]
    cmp r5, r0
    blt L_021fddcc
    ldr r0, L_021fde3c
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr ip, L_021fde40
    ldr r0, L_021fde44
    ldrh r3, [ip, #0x0]
    ldr r2, L_021fde48
    ldr r1, L_021fde4c
    and r0, r3, r0
    strh r0, [ip, #0x0]
    ldr r0, [r2, #0x0]
    bl func_020597fc
    add r0, r4, #0x170
    bl func_02077ac4
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fde3c: .word data_020f4e18
L_021fde40: .word 0x4000060
L_021fde44: .word 0xcfef
L_021fde48: .word gSoundContext
L_021fde4c: .word 0x1cd
.size func_ov034_021fdda4, .-func_ov034_021fdda4

    .global func_ov034_021fde50
func_ov034_021fde50: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov034_021fce00
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov034_021fde50, .-func_ov034_021fde50

    .global func_ov034_021fde6c
func_ov034_021fde6c: 
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r1, L_021fdf64
    mov r2, #0x0
    str r2, [r1, #0x0]
    sub r2, r1, #0x3e4
    ldrh r1, [r2, #0x0]
    mov r4, r0
    bic r0, r1, #0x3000
    orr r0, r0, #0x10
    strh r0, [r2, #0x0]
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x1
    beq L_021fdeb0
    cmp r0, #0x2
    beq L_021fdf40
    b L_021fdf50
L_021fdeb0:
    add r0, r4, #0x48
    bl func_02077b44
    mov r6, #0x0
    add r5, r4, #0x170
L_021fdec0:
    mov r1, r6
    add r0, r5, r6, lsl #0x4
    bl func_02077a24
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_021fdec0
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r1, #0x0
    mov r0, #0x1
    mov r2, #0x2
    mov r3, #0x23
    str r1, [sp, #0x4]
    bl func_ov034_021fd90c
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov034_021fd938
    mov r5, #0x0
    b L_021fdf34
L_021fdf24:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    bl func_ov034_021fce50
    add r5, r5, #0x1
L_021fdf34:
    ldr r0, [r4, #0x1b0]
    cmp r5, r0
    blt L_021fdf24
L_021fdf40:
    add r0, r4, #0xdc
    bl func_02077b44
    ldr r0, [r4, #0x0]
    bl func_ov034_021fd6f4
L_021fdf50:
    ldr r0, L_021fdf68
    mov r1, #0x1
    str r1, [r0, #0x0]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_021fdf64: .word 0x4000444
L_021fdf68: .word 0x4000448
.size func_ov034_021fde6c, .-func_ov034_021fde6c

    .global func_ov034_021fdf6c
func_ov034_021fdf6c: 
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x1c4]
    add r2, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r1, [r2, #0x0]
    ldrne r0, [r0, #0x1c0]
    ldrne r1, [r1, r0]
    ldreq r1, [r0, #0x1c0]
    mov r0, r2
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov034_021fdf6c, .-func_ov034_021fdf6c

    .global func_ov034_021fdf98
func_ov034_021fdf98: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r4, #0x0
    b L_021fdfd0
L_021fdfb8:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r4, r4, #0x1
L_021fdfd0:
    ldr r0, [r5, #0x1b0]
    cmp r4, r0
    blt L_021fdfb8
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov034_021fdf98, .-func_ov034_021fdf98

