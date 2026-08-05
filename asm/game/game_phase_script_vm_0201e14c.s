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
.global func_0201e14c
func_0201e14c: ; 0x0201e14c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    ldr r4, [r6, #0x4]
    b L_0201e178
L_0201e160:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e178:
    cmp r4, #0x0
    bne L_0201e160
    ldr r4, [r6, #0x14]
    b L_0201e1a0
L_0201e188:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e1a0:
    cmp r4, #0x0
    bne L_0201e188
    ldmia sp!, {r4, r5, r6, pc}


.size func_0201e14c, . - func_0201e14c
