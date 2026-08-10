; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text
.extern Heap_Free
.extern data_020d6a70
.extern VecFx32Object_Destroy
.extern func_0201e28c
.extern func_0206ba50

    .global func_02025564
    .type func_02025564, @function
func_02025564: ; 0x02025564
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02025628
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_0202558c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0202558c:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_020255a4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020255a4:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_020255c0
    mov r0, r5
    bl func_0206ba50
    mov r0, r5
    bl Heap_Free
.L_020255c0:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_020255d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020255d8:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_020255f0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020255f0:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02025608
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02025608:
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02025628: .word data_020d6a70
    .size func_02025564, . - func_02025564
