; Matching retail form; see src/game/sprite_number_motion_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d6658
.extern data_020d6678
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_020066a4
.extern func_0201e250
.extern func_0201e28c
.extern func_0202293c
.extern func_02022b70
.extern func_02022c30
.extern func_02022c80
.extern func_02030acc
.extern Actor_GetCollection
.extern func_02056f00
.extern gHeapContext

.global func_02022cb0
    .type func_02022cb0, @function
func_02022cb0: ; 0x02022cb0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x60
    mov r4, r0
    mov r5, r1
    mov r7, r2
    mov r6, r3
    bl func_0201e250
    ldr r1, .L_02022e64
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    add r1, r7, #0x18
    str r5, [r4, #0x8]
    bl func_02005030
    add r0, r4, #0x1c
    bl func_02004fe0
    add r0, r4, #0x2c
    bl func_02004fe0
    ldr r1, [r4, #0x18]
    ldr r3, .L_02022e68
    add r1, r1, #0x10000
    str r1, [r4, #0x18]
    ldr r1, .L_02022e6c
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02022d3c
    mov r0, r7
    bl Actor_GetCollection
    bl func_02030acc
    mov r1, r0
    mov r0, r5
    mov r2, r6
    bl func_0202293c
    mov r5, r0
.L_02022d3c:
    str r5, [r4, #0x3c]
    cmp r6, #0x0
    bne .L_02022d54
    ldr r0, [r4, #0x3c]
    mov r1, #0x0
    bl func_02022c80
.L_02022d54:
    ldr r2, [r4, #0x8]
    add r0, sp, #0x40
    add r1, r4, #0xc
    bl func_020066a4
    add r0, sp, #0x50
    add r1, sp, #0x40
    bl func_02056f00
    add r0, sp, #0x40
    bl func_02005058
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, [r4, #0x3c]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_02022c30
    ldr r0, [sp, #0x58]
    mov r1, #0x0
    mov r0, r0, asr #0xc
    cmp r0, #0x40
    ble .L_02022df4
    ldr r3, [sp, #0x78]
    add r0, sp, #0x30
    mov r2, r1
    bl func_0200500c
    add r1, sp, #0x30
    add r0, r4, #0x1c
    bl func_020050a4
    add r0, sp, #0x30
    bl func_02005058
    mov r1, #0x0
    ldr r3, [sp, #0x7c]
    add r0, sp, #0x20
    mov r2, r1
    bl func_0200500c
    add r0, r4, #0x2c
    add r1, sp, #0x20
    bl func_020050a4
    add r0, sp, #0x20
    bl func_02005058
    b .L_02022e48
.L_02022df4:
    ldr r3, [sp, #0x78]
    add r0, sp, #0x10
    mov r2, r1
    rsb r3, r3, #0x0
    bl func_0200500c
    add r1, sp, #0x10
    add r0, r4, #0x1c
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    ldr r1, [sp, #0x7c]
    add r0, sp, #0x0
    rsb r3, r1, #0x0
    mov r1, #0x0
    mov r2, r1
    bl func_0200500c
    add r0, r4, #0x2c
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
.L_02022e48:
    mov r1, #0x0
    add r0, sp, #0x50
    str r1, [r4, #0x40]
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02022e64: .word data_020d6658
.L_02022e68: .word gHeapContext
.L_02022e6c: .word data_020d6678
    .size func_02022cb0, .-func_02022cb0

