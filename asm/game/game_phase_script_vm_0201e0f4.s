; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern func_0201dc58
.extern func_0201dde4
.extern func_020a2324
.extern func_020a2348
.extern func_020a23a8
.extern GX_SetGraphicsMode
.extern gRuntimePresentationListVTable
.extern data_021052fc
.global func_0201e0f4
func_0201e0f4: ; 0x0201e0f4
    stmdb sp!, {r4, lr}
    ldr r1, L_0201e148
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x8
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x20]
    bl func_020a2324
    ldr r0, [r4, #0x20]
    mov r1, #0x1
    mov r2, #0x0
    bl func_020a2348
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x6
    bl GX_SetGraphicsMode
    ldmia sp!, {r4, pc}
L_0201e148: .word data_021052fc


.size func_0201e0f4, . - func_0201e0f4
