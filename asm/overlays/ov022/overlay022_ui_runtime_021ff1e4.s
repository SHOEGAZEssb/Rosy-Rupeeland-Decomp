.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern SpriteMotionController_SetPosition


    .global func_ov022_021ff1e4
func_ov022_021ff1e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, #0x0
    add r7, r0, #0x154
    mov r6, #0x80
    mov r4, #0xac
    mov r5, #0x30
L_021ff1fc:
    mul r2, r8, r5
    mla r0, r8, r4, r7
    mov r1, r6
    add r2, r2, #0x40
    bl SpriteMotionController_SetPosition
    add r8, r8, #0x1
    cmp r8, #0x2
    blt L_021ff1fc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov022_021ff1e4, .-func_ov022_021ff1e4

