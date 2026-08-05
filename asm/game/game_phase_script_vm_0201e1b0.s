; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern func_0201dc58
.extern func_0201dde4
.extern func_020a2324
.extern func_020a2348
.extern func_020a23a8
.extern GX_SetGraphicsMode
.extern data_020d5e20
.extern data_021052fc
.global func_0201e1b0
func_0201e1b0: ; 0x0201e1b0
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    ldr r6, [r5, #0x4]
    b L_0201e1e8
L_0201e1c4:
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x16
    cmp r4, r0, asr #0x18
    bne L_0201e1e4
    mov r0, r5
    mov r1, r6
    bl func_0201dde4
L_0201e1e4:
    ldr r6, [r6, #0x0]
L_0201e1e8:
    cmp r6, #0x0
    bne L_0201e1c4
    ldr r6, [r5, #0x14]
    b L_0201e21c
L_0201e1f8:
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x16
    cmp r4, r0, asr #0x18
    bne L_0201e218
    mov r0, r5
    mov r1, r6
    bl func_0201dde4
L_0201e218:
    ldr r6, [r6, #0x0]
L_0201e21c:
    cmp r6, #0x0
    bne L_0201e1f8
    ldmia sp!, {r4, r5, r6, pc}


.size func_0201e1b0, . - func_0201e1b0
