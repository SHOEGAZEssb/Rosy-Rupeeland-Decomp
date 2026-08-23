.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern GraphicsBgMapResource_UploadToMainBg
.extern TitleScreenResourceCollection_Get
.extern func_02095988
.extern func_ov023_021fe640


    .global func_ov023_021fe994
func_ov023_021fe994:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x388]
    cmp r1, #0x0
    beq L_021fe9b4
    cmp r1, #0x1
    beq L_021fe9f4
    ldmia sp!, {r4, pc}
L_021fe9b4:
    add r0, r4, #0x228
    mov r1, #0xc
    bl func_02095988
    add r0, r4, #0x2d4
    mov r1, #0x10
    bl func_02095988
    add r0, r4, #0x78
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    mov r0, r4
    mov r1, #0x0
    bl func_ov023_021fe640
    ldmia sp!, {r4, pc}
L_021fe9f4:
    add r0, r4, #0x228
    mov r1, #0xe
    bl func_02095988
    add r0, r4, #0x2d4
    mov r1, #0xd
    bl func_02095988
    add r0, r4, #0x78
    mov r1, #0x1
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    mov r0, r4
    mov r1, #0x1
    bl func_ov023_021fe640
    ldmia sp!, {r4, pc}
.size func_ov023_021fe994, .-func_ov023_021fe994

