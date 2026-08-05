; Matching retail form; see src/game/timed_sprite_presentation.c.
.text
.extern Heap_Free
.extern func_0200500c
.extern func_02005058
.extern func_020050c8
.extern func_020066a4
.extern func_02073fc4
.extern func_02074038
.extern func_0201e3b8
.extern data_020d6248
.extern data_020d6098
.global func_0201e250
func_0201e250: ; 0x0201e250
    ldr r1, L_0201e270
    str r1, [r0, #0x0]
    ldr r1, [r0, #0x4]
    bic r2, r1, #0x1
    bic r1, r2, #0x2
    bic r1, r1, #0x3fc
    str r1, [r0, #0x4]
    bx lr
L_0201e270: .word data_020d6248


.size func_0201e250, . - func_0201e250
