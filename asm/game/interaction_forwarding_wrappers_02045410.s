; Matching retail form; see src/game/interaction_forwarding_wrappers.c.
.text
.extern data_020e1738
.extern Type7Actor_SelectRandomCallback
.extern Type7Actor_SelectRandomCallbackPair01
.extern Type7Actor_SetCallbackPair
.global func_02045410
.type func_02045410, @function
.global func_0204541c
.type func_0204541c, @function
.global func_02045428
.type func_02045428, @function
.global func_02045434
.type func_02045434, @function
.global func_02045440
.type func_02045440, @function
.global func_0204544c
.type func_0204544c, @function
.global func_02045458
.type func_02045458, @function
.global func_02045464
.type func_02045464, @function
.global func_02045470
.type func_02045470, @function
.global func_0204547c
.type func_0204547c, @function
.global func_02045488
.type func_02045488, @function
.global func_02045494
.type func_02045494, @function
.global func_020454a0
.type func_020454a0, @function
.global func_020454ac
.type func_020454ac, @function
.global func_020454b8
.type func_020454b8, @function
.global func_020454d4
.type func_020454d4, @function
.global func_020454e0
.type func_020454e0, @function
.global func_020454ec
.type func_020454ec, @function
func_02045410: ; 0x02045410
    ldr ip, .L_02045418
    bx ip
.L_02045418: .word Type7Actor_SelectRandomCallback

.size func_02045410, . - func_02045410
func_0204541c: ; 0x0204541c
    ldr ip, .L_02045424
    bx ip
.L_02045424: .word Type7Actor_SelectRandomCallback

.size func_0204541c, . - func_0204541c
func_02045428: ; 0x02045428
    ldr ip, .L_02045430
    bx ip
.L_02045430: .word Type7Actor_SelectRandomCallback

.size func_02045428, . - func_02045428
func_02045434: ; 0x02045434
    ldr ip, .L_0204543c
    bx ip
.L_0204543c: .word Type7Actor_SelectRandomCallback

.size func_02045434, . - func_02045434
func_02045440: ; 0x02045440
    ldr ip, .L_02045448
    bx ip
.L_02045448: .word Type7Actor_SelectRandomCallback

.size func_02045440, . - func_02045440
func_0204544c: ; 0x0204544c
    ldr ip, .L_02045454
    bx ip
.L_02045454: .word Type7Actor_SelectRandomCallback

.size func_0204544c, . - func_0204544c
func_02045458: ; 0x02045458
    ldr ip, .L_02045460
    bx ip
.L_02045460: .word Type7Actor_SelectRandomCallback

.size func_02045458, . - func_02045458
func_02045464: ; 0x02045464
    ldr ip, .L_0204546c
    bx ip
.L_0204546c: .word Type7Actor_SelectRandomCallbackPair01

.size func_02045464, . - func_02045464
func_02045470: ; 0x02045470
    ldr ip, .L_02045478
    bx ip
.L_02045478: .word Type7Actor_SelectRandomCallbackPair01

.size func_02045470, . - func_02045470
func_0204547c: ; 0x0204547c
    ldr ip, .L_02045484
    bx ip
.L_02045484: .word Type7Actor_SelectRandomCallbackPair01

.size func_0204547c, . - func_0204547c
func_02045488: ; 0x02045488
    ldr ip, .L_02045490
    bx ip
.L_02045490: .word Type7Actor_SelectRandomCallback

.size func_02045488, . - func_02045488
func_02045494: ; 0x02045494
    ldr ip, .L_0204549c
    bx ip
.L_0204549c: .word Type7Actor_SelectRandomCallback

.size func_02045494, . - func_02045494
func_020454a0: ; 0x020454a0
    ldr ip, .L_020454a8
    bx ip
.L_020454a8: .word Type7Actor_SelectRandomCallback

.size func_020454a0, . - func_020454a0
func_020454ac: ; 0x020454ac
    ldr ip, .L_020454b4
    bx ip
.L_020454b4: .word Type7Actor_SelectRandomCallback

.size func_020454ac, . - func_020454ac
func_020454b8: ; 0x020454b8
    ldr r1, .L_020454cc
    ldr ip, .L_020454d0
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bx ip
.L_020454cc: .word data_020e1738
.L_020454d0: .word Type7Actor_SetCallbackPair

.size func_020454b8, . - func_020454b8
func_020454d4: ; 0x020454d4
    ldr ip, .L_020454dc
    bx ip
.L_020454dc: .word Type7Actor_SelectRandomCallback

.size func_020454d4, . - func_020454d4
func_020454e0: ; 0x020454e0
    ldr ip, .L_020454e8
    bx ip
.L_020454e8: .word Type7Actor_SelectRandomCallbackPair01

.size func_020454e0, . - func_020454e0
func_020454ec: ; 0x020454ec
    ldr ip, .L_020454f4
    bx ip
.L_020454f4: .word Type7Actor_SelectRandomCallbackPair01
.size func_020454ec, . - func_020454ec
