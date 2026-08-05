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
.global func_0201e3d8
func_0201e3d8: ; 0x0201e3d8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r2, [r5, #0x28]
    mov r4, r1
    subs r1, r2, #0x1
    str r1, [r5, #0x28]
    bpl L_0201e408
    mov r1, #0x0
    bl func_0201e3b8
    mov r0, #0x1
    b L_0201e44c
L_0201e408:
    add r0, r5, #0x8
    add r1, r5, #0x18
    bl func_020050c8
    add r0, sp, #0x0
    mov r2, r4
    add r1, r5, #0x8
    bl func_020066a4
    ldr r0, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r1, r0, asr #0xc
    ldr r2, [r5, #0x4]
    add r0, sp, #0x0
    strh r1, [r2, #0x2c]
    mov r1, r3, asr #0xc
    strh r1, [r2, #0x2e]
    bl func_02005058
    mov r0, #0x0
L_0201e44c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201e3d8, . - func_0201e3d8
