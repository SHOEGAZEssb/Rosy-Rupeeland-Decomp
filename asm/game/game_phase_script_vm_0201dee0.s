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
.global func_0201dee0
func_0201dee0: ; 0x0201dee0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, L_0201df3c
    ldr r3, L_0201df40
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r5, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r5, #0x4]
    str r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
L_0201df3c: .word data_020d5e08
L_0201df40: .word gHeapContext


.size func_0201dee0, . - func_0201dee0
