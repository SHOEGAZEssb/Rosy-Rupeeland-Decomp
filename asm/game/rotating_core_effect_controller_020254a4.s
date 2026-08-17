; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text
.extern Heap_Free
.extern data_020d6a70
.extern VecFx32Object_Destroy
.extern func_0201e28c
.extern AuxiliaryCore_Destroy

    .global func_020254a4
    .type func_020254a4, @function
func_020254a4: ; 0x020254a4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02025560
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_020254cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020254cc:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_020254e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020254e4:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_02025500
    mov r0, r5
    bl AuxiliaryCore_Destroy
    mov r0, r5
    bl Heap_Free
.L_02025500:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02025518
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02025518:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02025530
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02025530:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02025548
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02025548:
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02025560: .word data_020d6a70
    .size func_020254a4, . - func_020254a4
