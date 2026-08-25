.text

/* Exact fallback; see src/overlays/ov024/overlay024_scene_runtime.c. */
.extern data_ov024_021fe250
.extern data_ov024_021fe254
.extern SpriteMotionController_Show
.extern SpriteMotionController_Hide


    .global func_ov024_021fd8f8
func_ov024_021fd8f8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, L_021fd960
    mov r4, r1
    ldr r1, [r2, r4, lsl #0x3]
    mov r5, r0
    cmp r1, #0x0
    bge L_021fd920
    add r0, r5, #0x12c
    bl SpriteMotionController_Hide
    b L_021fd93c
L_021fd920:
    ldr r0, [r5, #0x60]
    cmp r1, r0
    add r0, r5, #0x12c
    bgt L_021fd938
    bl SpriteMotionController_Show
    b L_021fd93c
L_021fd938:
    bl SpriteMotionController_Hide
L_021fd93c:
    ldr r0, L_021fd964
    ldr r0, [r0, r4, lsl #0x3]
    cmp r0, #0x0
    add r0, r5, #0x1d8
    bge L_021fd958
    bl SpriteMotionController_Hide
    ldmia sp!, {r3, r4, r5, pc}
L_021fd958:
    bl SpriteMotionController_Show
    ldmia sp!, {r3, r4, r5, pc}
L_021fd960: .word data_ov024_021fe250
L_021fd964: .word data_ov024_021fe254
.size func_ov024_021fd8f8, .-func_ov024_021fd8f8

