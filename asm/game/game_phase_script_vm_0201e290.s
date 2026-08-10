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
.global func_0201e290
func_0201e290: ; 0x0201e290
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    mov r1, #0x0
    ldr ip, L_0201e304
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x8
    str ip, [r4, #0x0]
    bl func_0200500c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x18
    bl func_0200500c
    mov r0, #0x0
    str r0, [r4, #0x28]
    ldr r0, [r5, #0x34]
    and r0, r0, #0xff
    str r0, [sp, #0x0]
    ldmia r5, {r0, r1, r2, r3}
    bl func_02073fc4
    mov r2, r0
    str r0, [r4, #0x4]
    ldrh r1, [r2, #0x24]
    mov r0, r4
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
L_0201e304: .word data_020d6098


.size func_0201e290, . - func_0201e290
