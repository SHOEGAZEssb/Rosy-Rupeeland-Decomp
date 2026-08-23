.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern data_020f4e14
.extern GraphicsBgMapResource_UploadToMainBg
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteCanvas_FillRect
.extern TitleScreenResourceCollection_Get


    .global func_ov025_02200398
func_ov025_02200398:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    add r0, r4, #0x530
    mov r5, r2
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, [r4, #0xb0]
    add r1, r4, #0x68
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r5
    str r0, [r4, #0xb8]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xb8]
    mov r2, #0x39
    mov r3, #0x3c
    bl func_02073e48
    mov r0, #0x80
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, L_02200434
    mov r1, #0x30
    ldr r0, [r0, #0x0]
    mov r2, #0x38
    mov r3, #0xd0
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r4, #0x48]
    orr r0, r0, #0x2
    str r0, [r4, #0x48]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_02200434: .word data_020f4e14
.size func_ov025_02200398, .-func_ov025_02200398

