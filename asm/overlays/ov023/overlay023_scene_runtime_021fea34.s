.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern SpriteMotionController_BeginHitResponse


    .global func_ov023_021fea34
func_ov023_021fea34:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r8, #0x0
    add r7, r9, #0x228
    mov r6, r8
    mov r5, #0x2
    mov r4, #0xac
    b L_021fea78
L_021fea54:
    mla r0, r8, r4, r7
    mov r2, r6
    mov r3, r5
    add r1, r9, #0x30
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    movne r0, r8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r8, r8, #0x1
L_021fea78:
    cmp r8, #0x2
    blt L_021fea54
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov023_021fea34, .-func_ov023_021fea34

