    .text
/* Exact fallback; see overlay041_base_construct.c for portable C. */
    .extern GraphicsResourceSet_Destroy
    .extern GraphicsResourceSet_Init
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_ov041_022058ec
    .extern func_02003e14
    .extern func_02004fe0
    .extern func_020742cc
    .extern func_0209a748
    .extern func_020a6940
    .extern func_ov041_021fd000
    .extern func_ov041_021fd01c
    .extern func_ov041_021ff20c
    .extern func_ov041_02200660
    .extern func_ov041_0220106c
    .extern func_ov070_0220fd60
    .extern gHeapContext
    .extern __construct_array

    .global func_ov041_021fce04
func_ov041_021fce04: ; 0x021fce04
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r0, r5, #0x1c
    mov r4, r1
    mov r6, r2
    bl func_020a6940
    ldr r2, .L_021fcfe8
    ldr r3, .L_021fcfec
    str r2, [sp, #0x0]
    add r0, r5, #0x48
    mov r1, #0x6
    mov r2, #0xc
    bl __construct_array
    ldr r1, .L_021fcfe8
    ldr r3, .L_021fcfec
    str r1, [sp, #0x0]
    add r0, r5, #0x90
    mov r1, #0x8
    mov r2, #0xc
    bl __construct_array
    ldr r1, .L_021fcfe8
    ldr r3, .L_021fcfec
    str r1, [sp, #0x0]
    add r0, r5, #0xf0
    mov r1, #0xa
    mov r2, #0xc
    bl __construct_array
    add r0, r5, #0x18c
    bl func_02004fe0
    add r0, r5, #0x19c
    bl func_02004fe0
    add r0, r5, #0x1b8
    bl func_ov041_021fd000
    str r4, [r5, #0x40]
    str r6, [r5, #0x18]
    mov r0, #0x1
    str r0, [r5, #0x1ec]
    mov r0, #0x0
    str r0, [r5, #0x1f0]
    ldr r0, [r5, #0x18]
    mov r1, #0x4
    bl func_0209a748
    cmp r4, #0x2
    moveq r0, #0x2
    movne r0, #0x0
    str r0, [r5, #0x1f4]
    mov r1, #0x0
    str r1, [r5, #0x1fc]
    str r1, [r5, #0x1f8]
    str r1, [r5, #0x1d4]
    str r1, [r5, #0x1d0]
    str r1, [r5, #0x1cc]
    str r1, [r5, #0x1d8]
    str r1, [r5, #0x1dc]
    str r1, [r5, #0x1e4]
    str r1, [r5, #0x1e8]
    str r1, [r5, #0x170]
    ldr r0, .L_021fcff0
    str r1, [r5, #0x16c]
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r5, #0x0]
    ldr r1, .L_021fcff4
    ldr r3, .L_021fcff8
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021fcf28
    ldr r2, [r5, #0x0]
    mov r1, r5
    bl func_ov070_0220fd60 ; func_ov071_0220fd60
.L_021fcf28:
    str r0, [r5, #0x8]
    cmp r4, #0x2
    beq .L_021fcf6c
    ldr r0, .L_021fcffc
    ldr r1, .L_021fcff4
    ldr r3, .L_021fcff8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021fcf5c
    ldr r2, [r5, #0x0]
    mov r1, r5
    bl func_ov041_0220106c
.L_021fcf5c:
    str r0, [r5, #0xc]
    mov r0, #0x1
    str r0, [r5, #0x1cc]
    b .L_021fcf74
.L_021fcf6c:
    mov r0, #0x0
    str r0, [r5, #0xc]
.L_021fcf74:
    ldr r1, .L_021fcff4
    ldr r3, .L_021fcff8
    mov r0, #0x1c0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021fcf9c
    ldr r2, [r5, #0x0]
    mov r1, r5
    bl func_ov041_021ff20c
.L_021fcf9c:
    ldr r1, .L_021fcff4
    str r0, [r5, #0x10]
    ldr r3, .L_021fcff8
    mov r0, #0x160
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021fcfc8
    ldr r2, [r5, #0x0]
    mov r1, r5
    bl func_ov041_02200660
.L_021fcfc8:
    str r0, [r5, #0x14]
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x1c4]
    bl func_ov041_021fd01c
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021fcfe8: .word GraphicsResourceSet_Destroy
.L_021fcfec: .word GraphicsResourceSet_Init
.L_021fcff0: .word data_020f4e14
.L_021fcff4: .word data_ov041_022058ec
.L_021fcff8: .word gHeapContext
.L_021fcffc: .word 0x95c
    .size func_ov041_021fce04, . - func_ov041_021fce04
