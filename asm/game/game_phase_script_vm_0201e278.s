; Matching retail form; see src/game/timed_sprite_presentation.c.
.text
.extern Heap_Free
.extern func_0200500c
.extern func_02005058
.extern func_020050c8
.extern VecFx32_Subtract
.extern func_02073fc4
.extern func_02074038
.extern func_0201e3b8
.extern data_020d6248
.extern data_020d6098
.global func_0201e278
func_0201e278: ; 0x0201e278
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}


.size func_0201e278, . - func_0201e278
