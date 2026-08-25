; Matching retail form; see src/game/interaction_forwarding_wrappers.c.
.text
.extern data_020e1738
.extern Type7Actor_SelectRandomCallback
.extern Type7Actor_SelectRandomCallbackPair01
.extern Type7Actor_SetCallbackPair
.global InteractionCallbackForwarder01_SelectRandomCallback
.type InteractionCallbackForwarder01_SelectRandomCallback, @function
.global InteractionCallbackForwarder02_SelectRandomCallback
.type InteractionCallbackForwarder02_SelectRandomCallback, @function
.global InteractionCallbackForwarder03_SelectRandomCallback
.type InteractionCallbackForwarder03_SelectRandomCallback, @function
.global InteractionCallbackForwarder04_SelectRandomCallback
.type InteractionCallbackForwarder04_SelectRandomCallback, @function
.global InteractionCallbackForwarder05_SelectRandomCallback
.type InteractionCallbackForwarder05_SelectRandomCallback, @function
.global InteractionCallbackForwarder06_SelectRandomCallback
.type InteractionCallbackForwarder06_SelectRandomCallback, @function
.global InteractionCallbackForwarder07_SelectRandomCallback
.type InteractionCallbackForwarder07_SelectRandomCallback, @function
.global InteractionCallbackForwarder08_SelectRandomCallbackPair01
.type InteractionCallbackForwarder08_SelectRandomCallbackPair01, @function
.global InteractionCallbackForwarder09_SelectRandomCallbackPair01
.type InteractionCallbackForwarder09_SelectRandomCallbackPair01, @function
.global InteractionCallbackForwarder10_SelectRandomCallbackPair01
.type InteractionCallbackForwarder10_SelectRandomCallbackPair01, @function
.global InteractionCallbackForwarder11_SelectRandomCallback
.type InteractionCallbackForwarder11_SelectRandomCallback, @function
.global InteractionCallbackForwarder12_SelectRandomCallback
.type InteractionCallbackForwarder12_SelectRandomCallback, @function
.global InteractionCallbackForwarder13_SelectRandomCallback
.type InteractionCallbackForwarder13_SelectRandomCallback, @function
.global InteractionCallbackForwarder14_SelectRandomCallback
.type InteractionCallbackForwarder14_SelectRandomCallback, @function
.global InteractionCallbackForwarder15_SetGlobalCallbackPair
.type InteractionCallbackForwarder15_SetGlobalCallbackPair, @function
.global InteractionCallbackForwarder16_SelectRandomCallback
.type InteractionCallbackForwarder16_SelectRandomCallback, @function
.global InteractionCallbackForwarder17_SelectRandomCallbackPair01
.type InteractionCallbackForwarder17_SelectRandomCallbackPair01, @function
.global InteractionCallbackForwarder18_SelectRandomCallbackPair01
.type InteractionCallbackForwarder18_SelectRandomCallbackPair01, @function
InteractionCallbackForwarder01_SelectRandomCallback: ; 0x02045410
    ldr ip, .L_02045418
    bx ip
.L_02045418: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder01_SelectRandomCallback, . - InteractionCallbackForwarder01_SelectRandomCallback
InteractionCallbackForwarder02_SelectRandomCallback: ; 0x0204541c
    ldr ip, .L_02045424
    bx ip
.L_02045424: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder02_SelectRandomCallback, . - InteractionCallbackForwarder02_SelectRandomCallback
InteractionCallbackForwarder03_SelectRandomCallback: ; 0x02045428
    ldr ip, .L_02045430
    bx ip
.L_02045430: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder03_SelectRandomCallback, . - InteractionCallbackForwarder03_SelectRandomCallback
InteractionCallbackForwarder04_SelectRandomCallback: ; 0x02045434
    ldr ip, .L_0204543c
    bx ip
.L_0204543c: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder04_SelectRandomCallback, . - InteractionCallbackForwarder04_SelectRandomCallback
InteractionCallbackForwarder05_SelectRandomCallback: ; 0x02045440
    ldr ip, .L_02045448
    bx ip
.L_02045448: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder05_SelectRandomCallback, . - InteractionCallbackForwarder05_SelectRandomCallback
InteractionCallbackForwarder06_SelectRandomCallback: ; 0x0204544c
    ldr ip, .L_02045454
    bx ip
.L_02045454: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder06_SelectRandomCallback, . - InteractionCallbackForwarder06_SelectRandomCallback
InteractionCallbackForwarder07_SelectRandomCallback: ; 0x02045458
    ldr ip, .L_02045460
    bx ip
.L_02045460: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder07_SelectRandomCallback, . - InteractionCallbackForwarder07_SelectRandomCallback
InteractionCallbackForwarder08_SelectRandomCallbackPair01: ; 0x02045464
    ldr ip, .L_0204546c
    bx ip
.L_0204546c: .word Type7Actor_SelectRandomCallbackPair01

.size InteractionCallbackForwarder08_SelectRandomCallbackPair01, . - InteractionCallbackForwarder08_SelectRandomCallbackPair01
InteractionCallbackForwarder09_SelectRandomCallbackPair01: ; 0x02045470
    ldr ip, .L_02045478
    bx ip
.L_02045478: .word Type7Actor_SelectRandomCallbackPair01

.size InteractionCallbackForwarder09_SelectRandomCallbackPair01, . - InteractionCallbackForwarder09_SelectRandomCallbackPair01
InteractionCallbackForwarder10_SelectRandomCallbackPair01: ; 0x0204547c
    ldr ip, .L_02045484
    bx ip
.L_02045484: .word Type7Actor_SelectRandomCallbackPair01

.size InteractionCallbackForwarder10_SelectRandomCallbackPair01, . - InteractionCallbackForwarder10_SelectRandomCallbackPair01
InteractionCallbackForwarder11_SelectRandomCallback: ; 0x02045488
    ldr ip, .L_02045490
    bx ip
.L_02045490: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder11_SelectRandomCallback, . - InteractionCallbackForwarder11_SelectRandomCallback
InteractionCallbackForwarder12_SelectRandomCallback: ; 0x02045494
    ldr ip, .L_0204549c
    bx ip
.L_0204549c: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder12_SelectRandomCallback, . - InteractionCallbackForwarder12_SelectRandomCallback
InteractionCallbackForwarder13_SelectRandomCallback: ; 0x020454a0
    ldr ip, .L_020454a8
    bx ip
.L_020454a8: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder13_SelectRandomCallback, . - InteractionCallbackForwarder13_SelectRandomCallback
InteractionCallbackForwarder14_SelectRandomCallback: ; 0x020454ac
    ldr ip, .L_020454b4
    bx ip
.L_020454b4: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder14_SelectRandomCallback, . - InteractionCallbackForwarder14_SelectRandomCallback
InteractionCallbackForwarder15_SetGlobalCallbackPair: ; 0x020454b8
    ldr r1, .L_020454cc
    ldr ip, .L_020454d0
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bx ip
.L_020454cc: .word data_020e1738
.L_020454d0: .word Type7Actor_SetCallbackPair

.size InteractionCallbackForwarder15_SetGlobalCallbackPair, . - InteractionCallbackForwarder15_SetGlobalCallbackPair
InteractionCallbackForwarder16_SelectRandomCallback: ; 0x020454d4
    ldr ip, .L_020454dc
    bx ip
.L_020454dc: .word Type7Actor_SelectRandomCallback

.size InteractionCallbackForwarder16_SelectRandomCallback, . - InteractionCallbackForwarder16_SelectRandomCallback
InteractionCallbackForwarder17_SelectRandomCallbackPair01: ; 0x020454e0
    ldr ip, .L_020454e8
    bx ip
.L_020454e8: .word Type7Actor_SelectRandomCallbackPair01

.size InteractionCallbackForwarder17_SelectRandomCallbackPair01, . - InteractionCallbackForwarder17_SelectRandomCallbackPair01
InteractionCallbackForwarder18_SelectRandomCallbackPair01: ; 0x020454ec
    ldr ip, .L_020454f4
    bx ip
.L_020454f4: .word Type7Actor_SelectRandomCallbackPair01
.size InteractionCallbackForwarder18_SelectRandomCallbackPair01, . - InteractionCallbackForwarder18_SelectRandomCallbackPair01
