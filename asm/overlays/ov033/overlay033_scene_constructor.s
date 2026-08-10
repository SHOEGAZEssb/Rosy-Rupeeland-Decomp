.text

/* Exact fallback; see src/overlays/ov033/overlay033_scene_constructor.c for documented portable C. */

    .extern func_02004fe0
    .extern func_02091b6c
    .extern func_02092798
    .extern Type7Actor_EnterFlag40000State
    .extern func_020742cc
    .extern Heap_Alloc
    .extern func_ov033_021fce1c
    .extern func_02092814
    .extern func_02092cc0
    .extern func_ov033_021fd034
    .extern func_ov033_021fd04c
    .extern data_021052fc
    .extern data_020f4e14
    .extern data_ov033_021fdeb0
    .extern data_ov033_021fdeb8
    .extern data_ov033_021fdd08
    .extern gHeapContext

    .global func_ov033_021fd070
func_ov033_021fd070:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x14
    bl func_02004fe0
    add r0, r4, #0x24
    bl func_02004fe0
    add r0, r4, #0x4c
    bl func_02091b6c
    add r0, r4, #0x68
    bl func_02091b6c
    add r0, r4, #0x84
    bl func_02091b6c
    add r0, r4, #0xa0
    bl func_02092798
    mov r1, #0x0
    ldr r2, L_021fd244
    str r1, [r4, #0x10]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x4]
    ldr r3, [r0, #0x54]
    ldrh r0, [r3, #0x24]
    orr r0, r0, #0x10
    strh r0, [r3, #0x24]
    ldr r0, [r4, #0x4]
    ldr r3, [r0, #0xa8]
    ldrh r0, [r3, #0x24]
    orr r0, r0, #0x10
    strh r0, [r3, #0x24]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    str r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_021fd148
    ldrsh r2, [r0, #0xd6]
    cmp r2, #0x5
    cmpne r2, #0xc
    moveq r0, #0x0
    streq r0, [r4, #0x8]
    beq L_021fd148
    ldr r2, [r0, #0x268]
    tst r2, #0x40000
    movne r1, #0x1
    cmp r1, #0x0
    bne L_021fd148
    bl Type7Actor_EnterFlag40000State
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
L_021fd148:
    mov r0, #0x0
    str r0, [r4, #0x38]
    str r0, [r4, #0x3c]
    str r0, [r4, #0x40]
    sub r1, r0, #0x18
    ldr r0, L_021fd248
    str r1, [r4, #0x44]
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r4, #0x0]
    ldr r1, L_021fd24c
    ldr r3, L_021fd250
    mov r0, #0x134
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd194
    ldr r1, [r4, #0x0]
    bl func_ov033_021fce1c
L_021fd194:
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x4]
    mov r1, #0x2b0000
    str r1, [r0, #0x1c]
    ldr r2, [r4, #0x4]
    mov r3, #0x100000
    ldr r1, L_021fd254
    add r0, r4, #0xa0
    str r3, [r2, #0x20]
    bl func_02092814
    ldr r1, L_021fd258
    ldr r3, L_021fd250
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd1e8
    ldr r1, L_021fd248
    ldr r2, [r4, #0xa0]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_021fd1e8:
    str r0, [r4, #0xc4]
    mov r0, #0x40
    str r0, [sp, #0x0]
    ldr r0, [r4, #0xc4]
    mov r1, #0x10
    mov r2, #0x60
    mov r3, #0xe0
    bl func_ov033_021fd034
    ldr r0, [r4, #0xc4]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r2, [r4, #0xc4]
    mov r0, #0xd
    str r0, [r2, #0xd0]
    mov r0, #0x0
    ldr r1, L_021fd25c
    str r0, [r2, #0xd4]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov033_021fd04c
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd244: .word data_021052fc
L_021fd248: .word data_020f4e14
L_021fd24c: .word data_ov033_021fdeb0
L_021fd250: .word gHeapContext
L_021fd254: .word 0x7007
L_021fd258: .word data_ov033_021fdeb8
L_021fd25c: .word data_ov033_021fdd08
.size func_ov033_021fd070, .-func_ov033_021fd070
