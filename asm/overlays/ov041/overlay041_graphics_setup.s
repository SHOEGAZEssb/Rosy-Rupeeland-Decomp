.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_graphics_lifecycle.c. */
.extern GX_DispOn
.extern GX_SetBankForBG
.extern GX_SetGraphicsMode
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern data_ov041_022058f4
.extern data_ov041_02205918
.extern data_ov041_0220593c
.extern data_ov041_02205960
.extern func_020050a4
.extern func_0207043c
.extern func_02070874
.extern func_02070888
.extern func_02070f80
.extern func_02072000
.extern GraphicsSpriteRenderer_HideAllSprites
.extern func_02075238
.extern func_020ae6dc
.extern func_020ae90c
.extern func_020ae9a4
.extern func_020b1924
.extern func_020b2058
.extern func_020b44e8
.extern func_ov041_021fdd04
.extern func_ov041_021fdd38
.extern func_ov041_021fe088
.extern func_ov041_021fe498
.extern func_ov041_02200970
.extern func_ov070_022102e0
.extern gDebugFont

    .global func_ov041_021fd01c
func_ov041_021fd01c: ; 0x021fd01c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_020ae9a4
    bl func_020ae90c
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    mov r0, #0x10
    bl GX_SetBankForBG
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1c
    mov r3, r0
    str r0, [sp, #0x0]
    bl func_ov041_021fdd04
    ldr ip, .L_021fdc28
    mov r1, #0x0
    ldrh r3, [ip, #0x0]
    mov r0, #0x1
    mov r2, #0x1e
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [ip, #0x0]
    str r1, [ip, #0xa]
    ldrh r5, [ip, #0x2]
    mov r3, r1
    and r5, r5, #0x43
    orr r5, r5, #0x1d00
    strh r5, [ip, #0x2]
    ldrh r5, [ip, #0x2]
    bic r5, r5, #0x3
    orr r5, r5, #0x1
    strh r5, [ip, #0x2]
    str r1, [ip, #0xe]
    bl func_ov041_021fdd38
    ldr r5, .L_021fdc2c
    mov r1, #0x5000000
    ldrh r3, [r5, #0x0]
    mov r2, #0x0
    add r0, r1, #0x400
    bic r3, r3, #0x3
    strh r3, [r5, #0x0]
    str r2, [r5, #0xe]
    strh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    ldr r0, .L_021fdc30
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, .L_021fdc30
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae6dc
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    mov r0, #0x1f
    str r0, [r4, #0x44]
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    bne .L_021fd2a8
    ldr r3, .L_021fdc34
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x48
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x48]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x4c]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    ldr r3, .L_021fdc3c
    add r0, r4, #0x60
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r3, .L_021fdc40
    add r0, r4, #0x78
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r3, .L_021fdc44
    add r0, r4, #0x54
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x54]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x8000
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x58]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x100
    bl func_020b2058
    bl func_020b44e8
    ldr r0, [r4, #0x5c]
    mov r1, #0x8
    bl func_02070f80
    ldr r3, .L_021fdc48
    add r0, r4, #0x6c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x74]
    mov r1, #0x8
    bl func_02070f80
    ldr r3, .L_021fdc4c
    add r0, r4, #0x84
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x8c]
    mov r1, #0x8
    bl func_02070f80
    b .L_021fd48c
.L_021fd2a8:
    cmp r0, #0x1
    bne .L_021fd3a0
    ldr r3, .L_021fdc50
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x48
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x48]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x4c]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    ldr r3, .L_021fdc54
    add r0, r4, #0x54
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x54]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x8000
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x58]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x100
    bl func_020b2058
    bl func_020b44e8
    ldr r0, [r4, #0x5c]
    mov r1, #0x8
    bl func_02070f80
    b .L_021fd48c
.L_021fd3a0:
    ldr r3, .L_021fdc58
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x48
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x48]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x4c]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    ldr r3, .L_021fdc5c
    add r0, r4, #0x54
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0x54]
    ldr r5, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    mov r0, r5
    mov r1, #0x8000
    bl func_020b1924
    bl func_020b44e8
    ldr r6, [r4, #0x58]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x100
    bl func_020b2058
    bl func_020b44e8
    ldr r0, [r4, #0x5c]
    mov r1, #0x8
    bl func_02070f80
.L_021fd48c:
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    bne .L_021fd524
    ldr r0, [r4, #0x48]
    ldr r2, .L_021fdc60
    ldr r1, [r0, #0x24]
    mov r0, r4
    sub r3, r1, #0x24
    mov r1, #0x1
    str r3, [r4, #0x168]
    bl func_ov041_021fe088
    ldr r2, .L_021fdc64
    mov r0, r4
    mov r1, #0x2
    bl func_ov041_021fe088
    ldr r3, .L_021fdc34
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r6, [sp, #0x8]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    add r0, sp, #0x4
    bl func_02072000
    b .L_021fd5b4
.L_021fd524:
    cmp r0, #0x2
    bne .L_021fd5b4
    ldr r0, [r4, #0x48]
    ldr r2, .L_021fdc68
    ldr r1, [r0, #0x24]
    mov r0, r4
    sub r3, r1, #0x24
    mov r1, #0x1
    str r3, [r4, #0x168]
    bl func_ov041_021fe088
    ldr r2, .L_021fdc6c
    mov r0, r4
    mov r1, #0x2
    bl func_ov041_021fe088
    ldr r3, .L_021fdc58
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r6, [sp, #0x8]
    mov r0, r6
    bl func_02070874
    mov r5, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b2058
    bl func_020b44e8
    add r0, sp, #0x4
    bl func_02072000
.L_021fd5b4:
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    bne .L_021fd78c
    ldr r3, .L_021fdc70
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xfc
    sub r2, r3, #0x14
    sub r3, r3, #0x13
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc74
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x108
    sub r2, r3, #0x15
    sub r3, r3, #0x14
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc78
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x114
    sub r2, r3, #0x16
    sub r3, r3, #0x15
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc7c
    add r0, r4, #0x120
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x17
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x16
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc80
    add r0, r4, #0x12c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x18
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x17
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc84
    add r0, r4, #0x138
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x19
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x18
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc88
    add r0, r4, #0x144
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x1a
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x19
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r3, .L_021fdc8c
    add r0, r4, #0x9c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x1c
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1b
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc90
    add r0, r4, #0xa8
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x1d
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1c
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc94
    add r0, r4, #0xb4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x1e
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1d
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc98
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xc0
    sub r2, r3, #0x1f
    sub r3, r3, #0x1e
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdc9c
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xcc
    sub r2, r3, #0x20
    sub r3, r3, #0x1f
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdca0
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xd8
    sub r2, r3, #0x21
    sub r3, r3, #0x20
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdca4
    add r0, r4, #0xe4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x22
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x21
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    b .L_021fdb28
.L_021fd78c:
    cmp r0, #0x1
    bne .L_021fd960
    ldr r3, .L_021fdca8
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xfc
    sub r2, r3, #0x7
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcac
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x108
    sub r2, r3, #0x8
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcb0
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x114
    sub r2, r3, #0x9
    sub r3, r3, #0x8
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcb4
    add r0, r4, #0x120
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xa
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x9
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdca8
    add r0, r4, #0x12c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x7
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcac
    add r0, r4, #0x138
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x8
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcb0
    add r0, r4, #0x144
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x9
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x8
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r3, .L_021fdcb8
    add r0, r4, #0x9c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xc
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xb
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcbc
    add r0, r4, #0xa8
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xd
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xc
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcc0
    add r0, r4, #0xb4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xe
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xd
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcc4
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xc0
    sub r2, r3, #0xf
    sub r3, r3, #0xe
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcb8
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xcc
    sub r2, r3, #0xc
    sub r3, r3, #0xb
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcbc
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xd8
    sub r2, r3, #0xd
    sub r3, r3, #0xc
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcc0
    add r0, r4, #0xe4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xe
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xd
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    b .L_021fdb28
.L_021fd960:
    ldr r3, .L_021fdcc8
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xfc
    sub r2, r3, #0x7
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdccc
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x108
    sub r2, r3, #0x8
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcd0
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x114
    sub r2, r3, #0x9
    sub r3, r3, #0x8
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcd4
    add r0, r4, #0x120
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xa
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x9
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcc8
    add r0, r4, #0x12c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x7
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x6
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdccc
    add r0, r4, #0x138
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x8
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcd0
    add r0, r4, #0x144
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x9
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x8
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r3, .L_021fdcd8
    add r0, r4, #0x9c
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0xf
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xe
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcdc
    add r0, r4, #0xa8
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x10
    ldr r1, [r1, #0x0]
    sub r3, r3, #0xf
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdce0
    add r0, r4, #0xb4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x11
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x10
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdce4
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xc0
    sub r2, r3, #0x12
    sub r3, r3, #0x11
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdce8
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xcc
    sub r2, r3, #0x13
    sub r3, r3, #0x12
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcec
    ldr r0, .L_021fdc38
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xd8
    sub r2, r3, #0x14
    sub r3, r3, #0x13
    bl GraphicsResourceSet_Load
    ldr r3, .L_021fdcf0
    add r0, r4, #0xe4
    str r3, [sp, #0x0]
    ldr r1, .L_021fdc38
    sub r2, r3, #0x15
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x14
    bl GraphicsResourceSet_Load
    bl func_020b44e8
.L_021fdb28:
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x2
    moveq r0, #0x1e
    movne r0, #0x5a
    str r0, [r4, #0x174]
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021fdb7c
    ldr r2, [r4, #0x174]
    ldr r1, .L_021fdcf4
    mov r0, #0x60
    mla r5, r2, r0, r1
    ldr r0, [r4, #0x8]
    mov r1, r5
    mov r2, r5
    bl func_ov070_022102e0
    ldr r0, [r4, #0x14]
    mov r1, r5
    bl func_ov041_02200970
    b .L_021fdb90
.L_021fdb7c:
    ldr r5, .L_021fdcf8
    ldr r0, [r4, #0x8]
    mov r2, r5
    mov r1, #0xf0
    bl func_ov070_022102e0
.L_021fdb90:
    mov r0, r5, asr #0x4
    str r0, [r4, #0x178]
    ldr r0, [r4, #0xc]
    mov r2, r5, lsl #0xc
    cmp r0, #0x0
    movne r0, #0x4e000
    rsbne r0, r0, #0x0
    moveq r0, #0x0
    str r0, [r4, #0x190]
    add r0, r4, #0x19c
    add r1, r4, #0x18c
    str r2, [r4, #0x194]
    bl func_020050a4
    ldr r0, .L_021fdcfc
    mov r3, #0x0
    str r0, [r4, #0x1ac]
    ldr r0, [r4, #0x194]
    ldr r2, .L_021fdc28
    str r0, [r4, #0x1b0]
    str r3, [r4, #0x1b4]
    str r3, [r4, #0x180]
    str r3, [r4, #0x184]
    str r3, [r4, #0x188]
    ldrh r1, [r2, #0x0]
    mov r0, r4
    bic r1, r1, #0x40
    strh r1, [r2, #0x0]
    strh r3, [r2, #0x46]
    bl func_ov041_021fe498
    bl GX_DispOn
    ldr r2, .L_021fdd00
    add r0, sp, #0x4
    ldr r1, [r2, #0x0]
    orr r1, r1, #0x10000
    str r1, [r2, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_021fdc28: .word 0x400000a
.L_021fdc2c: .word 0x400000e
.L_021fdc30: .word gDebugFont
.L_021fdc34: .word 0xa086
.L_021fdc38: .word data_020f4e18
.L_021fdc3c: .word 0xa08c
.L_021fdc40: .word 0xa092
.L_021fdc44: .word 0xa089
.L_021fdc48: .word 0xa08f
.L_021fdc4c: .word 0xa095
.L_021fdc50: .word 0xa0a9
.L_021fdc54: .word 0xa0ac
.L_021fdc58: .word 0xa0b9
.L_021fdc5c: .word 0xa0bc
.L_021fdc60: .word data_ov041_022058f4
.L_021fdc64: .word data_ov041_02205918
.L_021fdc68: .word data_ov041_0220593c
.L_021fdc6c: .word data_ov041_02205960
.L_021fdc70: .word 0xa098
.L_021fdc74: .word 0xa099
.L_021fdc78: .word 0xa09a
.L_021fdc7c: .word 0xa09b
.L_021fdc80: .word 0xa09c
.L_021fdc84: .word 0xa09d
.L_021fdc88: .word 0xa09e
.L_021fdc8c: .word 0xa0a0
.L_021fdc90: .word 0xa0a1
.L_021fdc94: .word 0xa0a2
.L_021fdc98: .word 0xa0a3
.L_021fdc9c: .word 0xa0a4
.L_021fdca0: .word 0xa0a5
.L_021fdca4: .word 0xa0a6
.L_021fdca8: .word 0xa0ae
.L_021fdcac: .word 0xa0af
.L_021fdcb0: .word 0xa0b0
.L_021fdcb4: .word 0xa0b1
.L_021fdcb8: .word 0xa0b3
.L_021fdcbc: .word 0xa0b4
.L_021fdcc0: .word 0xa0b5
.L_021fdcc4: .word 0xa0b6
.L_021fdcc8: .word 0xa0be
.L_021fdccc: .word 0xa0bf
.L_021fdcd0: .word 0xa0c0
.L_021fdcd4: .word 0xa0c1
.L_021fdcd8: .word 0xa0c6
.L_021fdcdc: .word 0xa0c7
.L_021fdce0: .word 0xa0c8
.L_021fdce4: .word 0xa0c9
.L_021fdce8: .word 0xa0ca
.L_021fdcec: .word 0xa0cb
.L_021fdcf0: .word 0xa0cc
.L_021fdcf4: .word 0xfffffea2
.L_021fdcf8: .word 0x5dc
.L_021fdcfc: .word 0x19a
.L_021fdd00: .word 0x4001000
    .size func_ov041_021fd01c, . - func_ov041_021fd01c

