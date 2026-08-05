; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern func_020a1f80
.extern func_020a20d4
.extern func_020a214c
.extern func_02009d78
.extern func_0201dc18
.extern func_0201dc58
.extern func_0201dde4
.extern func_0201dee0
.extern func_0201df64
.extern data_020d5e20
.extern data_020d5e08
.extern data_020d5e40
.extern data_021052fc
.extern gHeapContext
.global func_0201df64
func_0201df64: ; 0x0201df64
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x4]
    b L_0201df9c
L_0201df74:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0201df8c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201df8c:
    mov r0, r5
    mov r1, r4
    bl func_0201dde4
    ldr r4, [r4, #0x0]
L_0201df9c:
    cmp r4, #0x0
    bne L_0201df74
    mov r0, r5
    bl func_0201dc58
    ldr r4, [r5, #0x14]
    b L_0201dfdc
L_0201dfb4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0201dfcc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201dfcc:
    mov r1, r4
    add r0, r5, #0x10
    bl func_0201dde4
    ldr r4, [r4, #0x0]
L_0201dfdc:
    cmp r4, #0x0
    bne L_0201dfb4
    add r0, r5, #0x10
    bl func_0201dc58
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201df64, . - func_0201df64
