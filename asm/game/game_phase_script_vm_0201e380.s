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
.global func_0201e380
func_0201e380: ; 0x0201e380
    stmdb sp!, {r4, lr}
    ldr r1, L_0201e3b4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0x0]
    bl func_02074038
    add r0, r4, #0x18
    bl func_02005058
    add r0, r4, #0x8
    bl func_02005058
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201e3b4: .word data_020d6098


.size func_0201e380, . - func_0201e380
