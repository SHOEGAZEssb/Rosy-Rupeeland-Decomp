; Matching retail form; see src/system/arm9_static_initializers.c.
.section .init, 4, 1, 6
.extern MainBgExtendedPaletteBuffer_Init
.extern MainBgPaletteBuffer_Init
.extern SubBgExtendedPaletteBuffer_Init
.extern SubBgPaletteBuffer_Init
.extern __construct_array
.extern __register_global_object
.extern func_02001d10
.extern func_02002068
.extern DisplayBrightnessPair_Init
.extern func_020083b0
.extern func_0200ad90
.extern func_02059a48
.extern func_020645d8
.extern func_0206f750
.extern func_0206fbb0
.extern func_0206fd78
.extern func_020787bc
.extern func_0207a064
.extern func_0207a13c
.extern func_0207a16c
.extern func_0207c38c
.extern func_02082890
.extern func_02092364
.extern func_020983c8
.extern MainBgExtendedPaletteBuffer_Destroy
.extern MainBgPaletteBuffer_Destroy
.extern SubBgExtendedPaletteBuffer_Destroy
.extern SubBgPaletteBuffer_Destroy
.extern data_020f3784
.extern data_020f37a0
.extern data_020f37ac
.extern data_020f4dbc
.extern data_020f4dc8
.extern data_020f4e20
.extern data_020f4e2c
.extern data_020f4e38
.extern data_020f4e44
.extern data_020f4e50
.extern data_020f5058
.extern data_020f5260
.extern data_020fd268
.extern data_02105304
.extern data_02105310
.extern data_021055a0
.extern data_021055ac
.extern data_021055b8
.extern data_021055c0
.extern data_021055d0
.extern data_021055dc
.extern data_02105864
.extern data_02105870
.extern data_0210587c
.extern data_0210588c
.extern data_021e9ac4
.extern data_021e9ad0
.extern data_021e9db8
.extern data_021e9ddc
.extern data_021e9de8
.extern data_021e9df4
.extern data_021e9e00
.extern data_021e9e10
.extern data_021e9e1c
.extern data_021ede74
.extern data_021edea0
.extern data_021f38f0
.extern data_021f38fc
.extern data_021f3d44
.extern data_021f3d50
.extern data_021f3d5c
.extern data_021f3d68
.extern data_021f3ecc
.extern data_021f4090
.extern data_021f512c
.extern data_021f5138
.extern data_021f5ebc
.extern data_021f5ec0
.extern data_021f5f0c
.extern data_021f5f18
.extern func_02001d30
.extern func_020020a0
.extern DisplayBrightnessPair_Destroy
.extern func_02004ac8
.extern func_0200ae10
.extern func_02022fbc
.extern func_02059a64
.extern func_02059a68
.extern func_020646cc
.extern func_0206f760
.extern func_0206fbe8
.extern func_0206fdd8
.extern func_02072aec
.extern func_020766cc
.extern func_020766d0
.extern func_020787c0
.extern func_0207a10c
.extern func_0207a14c
.extern func_0207a17c
.extern func_0207c424
.extern func_0208289c
.extern func_020923a0
.extern func_02098450
.extern gFrameTaskList
.global __sinit_020c1374
.type __sinit_020c1374, @function
.global __sinit_020c13a0
.type __sinit_020c13a0, @function
.global __sinit_020c13cc
.type __sinit_020c13cc, @function
.global __sinit_020c13f8
.type __sinit_020c13f8, @function
.global __sinit_020c1490
.type __sinit_020c1490, @function
.global __sinit_020c14bc
.type __sinit_020c14bc, @function
.global __sinit_020c152c
.type __sinit_020c152c, @function
.global __sinit_020c1558
.type __sinit_020c1558, @function
.global __sinit_020c15c0
.type __sinit_020c15c0, @function
.global __sinit_020c15ec
.type __sinit_020c15ec, @function
.global __sinit_020c1600
.type __sinit_020c1600, @function
.global __sinit_020c162c
.type __sinit_020c162c, @function
.global __sinit_020c1658
.type __sinit_020c1658, @function
.global __sinit_020c1684
.type __sinit_020c1684, @function
.global __sinit_020c16cc
.type __sinit_020c16cc, @function
.global __sinit_020c16f8
.type __sinit_020c16f8, @function
.global __sinit_020c176c
.type __sinit_020c176c, @function
.global __sinit_020c1798
.type __sinit_020c1798, @function
.global __sinit_020c17c4
.type __sinit_020c17c4, @function

__sinit_020c1374: ; 0x020c1374
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c1394
    bl func_02001d10
    ldr r0, .L_020c1394
    ldr r1, .L_020c1398
    ldr r2, .L_020c139c
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1394: .word gFrameTaskList
.L_020c1398: .word func_02001d30
.L_020c139c: .word data_020f3784

__sinit_020c13a0: ; 0x020c13a0
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c13c0
    bl func_02002068
    ldr r0, .L_020c13c0
    ldr r1, .L_020c13c4
    ldr r2, .L_020c13c8
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c13c0: .word data_020f37ac
.L_020c13c4: .word func_020020a0
.L_020c13c8: .word data_020f37a0

__sinit_020c13cc: ; 0x020c13cc
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c13ec
    bl DisplayBrightnessPair_Init
    ldr r0, .L_020c13ec
    ldr r1, .L_020c13f0
    ldr r2, .L_020c13f4
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c13ec: .word data_020f4dc8
.L_020c13f0: .word DisplayBrightnessPair_Destroy
.L_020c13f4: .word data_020f4dbc

__sinit_020c13f8: ; 0x020c13f8
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c1460
    bl MainBgPaletteBuffer_Init
    ldr r0, .L_020c1460
    ldr r1, .L_020c1464
    ldr r2, .L_020c1468
    bl __register_global_object
    ldr r0, .L_020c146c
    bl SubBgPaletteBuffer_Init
    ldr r0, .L_020c146c
    ldr r1, .L_020c1470
    ldr r2, .L_020c1474
    bl __register_global_object
    ldr r0, .L_020c1478
    bl MainBgExtendedPaletteBuffer_Init
    ldr r0, .L_020c1478
    ldr r1, .L_020c147c
    ldr r2, .L_020c1480
    bl __register_global_object
    ldr r0, .L_020c1484
    bl SubBgExtendedPaletteBuffer_Init
    ldr r0, .L_020c1484
    ldr r1, .L_020c1488
    ldr r2, .L_020c148c
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1460: .word data_020f4e50
.L_020c1464: .word MainBgPaletteBuffer_Destroy
.L_020c1468: .word data_020f4e2c
.L_020c146c: .word data_020f5058
.L_020c1470: .word SubBgPaletteBuffer_Destroy
.L_020c1474: .word data_020f4e20
.L_020c1478: .word data_020f5260
.L_020c147c: .word MainBgExtendedPaletteBuffer_Destroy
.L_020c1480: .word data_020f4e38
.L_020c1484: .word data_020fd268
.L_020c1488: .word SubBgExtendedPaletteBuffer_Destroy
.L_020c148c: .word data_020f4e44

__sinit_020c1490: ; 0x020c1490
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c14b0
    bl func_0200ad90
    ldr r0, .L_020c14b0
    ldr r1, .L_020c14b4
    ldr r2, .L_020c14b8
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c14b0: .word data_02105310
.L_020c14b4: .word func_0200ae10
.L_020c14b8: .word data_02105304

__sinit_020c14bc: ; 0x020c14bc
    stmdb sp!, {r3, lr}
    mov r1, #0x0
    mov ip, #0x300
    ldr r0, .L_020c1518
    mov r2, r1
    mov r3, #0x400
    str ip, [sp, #0x0]
    bl func_020083b0
    ldr r0, .L_020c1518
    ldr r1, .L_020c151c
    ldr r2, .L_020c1520
    bl __register_global_object
    mov r1, #0x0
    ldr r0, .L_020c1524
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl func_020083b0
    ldr r0, .L_020c1524
    ldr r1, .L_020c151c
    ldr r2, .L_020c1528
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1518: .word data_021055b8
.L_020c151c: .word func_02004ac8
.L_020c1520: .word data_021055ac
.L_020c1524: .word data_021055c0
.L_020c1528: .word data_021055a0

__sinit_020c152c: ; 0x020c152c
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c154c
    bl func_02092364
    ldr r0, .L_020c154c
    ldr r1, .L_020c1550
    ldr r2, .L_020c1554
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c154c: .word data_021055dc
.L_020c1550: .word func_020923a0
.L_020c1554: .word data_021055d0

__sinit_020c1558: ; 0x020c1558
    stmdb sp!, {r3, lr}
    ldr ip, .L_020c15a4
    ldr r0, .L_020c15a8
    ldr r3, .L_020c15ac
    mov r1, #0x20
    mov r2, #0x10
    str ip, [sp, #0x0]
    bl __construct_array
    ldr r1, .L_020c15b0
    ldr r2, .L_020c15b4
    mov r0, #0x0
    bl __register_global_object
    ldr r0, .L_020c15b8
    bl func_02059a48
    ldr r0, .L_020c15b8
    ldr r1, .L_020c15a4
    ldr r2, .L_020c15bc
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c15a4: .word func_02059a64
.L_020c15a8: .word data_0210588c
.L_020c15ac: .word func_02059a48
.L_020c15b0: .word func_02059a68
.L_020c15b4: .word data_02105864
.L_020c15b8: .word data_0210587c
.L_020c15bc: .word data_02105870

__sinit_020c15c0: ; 0x020c15c0
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c15e0
    bl func_020645d8
    ldr r0, .L_020c15e0
    ldr r1, .L_020c15e4
    ldr r2, .L_020c15e8
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c15e0: .word data_021e9ad0
.L_020c15e4: .word func_020646cc
.L_020c15e8: .word data_021e9ac4

__sinit_020c15ec: ; 0x020c15ec
    ldr ip, .L_020c15f8
    ldr r0, .L_020c15fc
    bx ip
.L_020c15f8: .word func_02022fbc
.L_020c15fc: .word data_021e9db8

__sinit_020c1600: ; 0x020c1600
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c1620
    bl func_0206f750
    ldr r0, .L_020c1620
    ldr r1, .L_020c1624
    ldr r2, .L_020c1628
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1620: .word data_021e9de8
.L_020c1624: .word func_0206f760
.L_020c1628: .word data_021e9ddc

__sinit_020c162c: ; 0x020c162c
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c164c
    bl func_0206fbb0
    ldr r0, .L_020c164c
    ldr r1, .L_020c1650
    ldr r2, .L_020c1654
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c164c: .word data_021e9e00
.L_020c1650: .word func_0206fbe8
.L_020c1654: .word data_021e9df4

__sinit_020c1658: ; 0x020c1658
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c1678
    bl func_0206fd78
    ldr r0, .L_020c1678
    ldr r1, .L_020c167c
    ldr r2, .L_020c1680
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1678: .word data_021e9e1c
.L_020c167c: .word func_0206fdd8
.L_020c1680: .word data_021e9e10

__sinit_020c1684: ; 0x020c1684
    stmdb sp!, {r3, lr}
    ldr ip, .L_020c16b8
    ldr r0, .L_020c16bc
    ldr r3, .L_020c16c0
    mov r1, #0x180
    mov r2, #0x3c
    str ip, [sp, #0x0]
    bl __construct_array
    ldr r1, .L_020c16c4
    ldr r2, .L_020c16c8
    mov r0, #0x0
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c16b8: .word func_020766cc
.L_020c16bc: .word data_021edea0
.L_020c16c0: .word func_02072aec
.L_020c16c4: .word func_020766d0
.L_020c16c8: .word data_021ede74

__sinit_020c16cc: ; 0x020c16cc
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c16ec
    bl func_020787bc
    ldr r0, .L_020c16ec
    ldr r1, .L_020c16f0
    ldr r2, .L_020c16f4
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c16ec: .word data_021f38fc
.L_020c16f0: .word func_020787c0
.L_020c16f4: .word data_021f38f0

__sinit_020c16f8: ; 0x020c16f8
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c1748
    bl func_0207a064
    ldr r0, .L_020c1748
    ldr r1, .L_020c174c
    ldr r2, .L_020c1750
    bl __register_global_object
    ldr r0, .L_020c1754
    bl func_0207a13c
    ldr r0, .L_020c1754
    ldr r1, .L_020c1758
    ldr r2, .L_020c175c
    bl __register_global_object
    ldr r0, .L_020c1760
    bl func_0207a16c
    ldr r0, .L_020c1760
    ldr r1, .L_020c1764
    ldr r2, .L_020c1768
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c1748: .word data_021f3ecc
.L_020c174c: .word func_0207a10c
.L_020c1750: .word data_021f3d44
.L_020c1754: .word data_021f4090
.L_020c1758: .word func_0207a14c
.L_020c175c: .word data_021f3d50
.L_020c1760: .word data_021f3d68
.L_020c1764: .word func_0207a17c
.L_020c1768: .word data_021f3d5c

__sinit_020c176c: ; 0x020c176c
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c178c
    bl func_0207c38c
    ldr r0, .L_020c178c
    ldr r1, .L_020c1790
    ldr r2, .L_020c1794
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c178c: .word data_021f5138
.L_020c1790: .word func_0207c424
.L_020c1794: .word data_021f512c

__sinit_020c1798: ; 0x020c1798
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c17b8
    bl func_02082890
    ldr r0, .L_020c17b8
    ldr r1, .L_020c17bc
    ldr r2, .L_020c17c0
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c17b8: .word data_021f5ebc
.L_020c17bc: .word func_0208289c
.L_020c17c0: .word data_021f5ec0

__sinit_020c17c4: ; 0x020c17c4
    stmdb sp!, {r3, lr}
    ldr r0, .L_020c17e4
    bl func_020983c8
    ldr r0, .L_020c17e4
    ldr r1, .L_020c17e8
    ldr r2, .L_020c17ec
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_020c17e4: .word data_021f5f18
.L_020c17e8: .word func_02098450
.L_020c17ec: .word data_021f5f0c

.size __sinit_020c1374, __sinit_020c13a0 - __sinit_020c1374
.size __sinit_020c13a0, __sinit_020c13cc - __sinit_020c13a0
.size __sinit_020c13cc, __sinit_020c13f8 - __sinit_020c13cc
.size __sinit_020c13f8, __sinit_020c1490 - __sinit_020c13f8
.size __sinit_020c1490, __sinit_020c14bc - __sinit_020c1490
.size __sinit_020c14bc, __sinit_020c152c - __sinit_020c14bc
.size __sinit_020c152c, __sinit_020c1558 - __sinit_020c152c
.size __sinit_020c1558, __sinit_020c15c0 - __sinit_020c1558
.size __sinit_020c15c0, __sinit_020c15ec - __sinit_020c15c0
.size __sinit_020c15ec, __sinit_020c1600 - __sinit_020c15ec
.size __sinit_020c1600, __sinit_020c162c - __sinit_020c1600
.size __sinit_020c162c, __sinit_020c1658 - __sinit_020c162c
.size __sinit_020c1658, __sinit_020c1684 - __sinit_020c1658
.size __sinit_020c1684, __sinit_020c16cc - __sinit_020c1684
.size __sinit_020c16cc, __sinit_020c16f8 - __sinit_020c16cc
.size __sinit_020c16f8, __sinit_020c176c - __sinit_020c16f8
.size __sinit_020c176c, __sinit_020c1798 - __sinit_020c176c
.size __sinit_020c1798, __sinit_020c17c4 - __sinit_020c1798
.size __sinit_020c17c4, . - __sinit_020c17c4
