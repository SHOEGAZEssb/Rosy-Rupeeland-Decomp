.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_resource_transition.c. */
.extern Sound_Play
.extern data_020f4dc8
.extern func_02002ac0
.extern func_02002d28
.extern func_02058d28
.extern func_ov041_021fd01c
.extern func_ov041_021fdeb4
.extern func_ov041_021ff6b8
.extern func_ov041_021ff6f8
.extern func_ov041_022013cc
.extern gSoundContext

    .global func_ov041_021fdfd0
func_ov041_021fdfd0: ; 0x021fdfd0
    stmdb sp!, {r4, lr}
    ldr r1, .L_021fe080
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl func_02058d28
    mov r0, #0x1
    str r0, [r4, #0x1f8]
    ldr r0, [r4, #0x10]
    bl func_ov041_021ff6b8
    mov r0, r4
    bl func_ov041_021fdeb4
    mov r0, #0x1
    str r0, [r4, #0x1f4]
    mov r0, r4
    bl func_ov041_021fd01c
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x0]
    bl func_ov041_021ff6f8
    mov r1, #0x0
    str r1, [r4, #0x1f8]
    ldr r0, .L_021fe084
    bl func_02002d28
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x1e
    bl func_02002ac0
    ldr r0, .L_021fe084
    mov r1, #0x1
    bl func_02002d28
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x1e
    bl func_02002ac0
    ldr r0, [r4, #0xc]
    mov r1, #0xe
    mov r2, #0xa000
    mov r3, #0x140000
    bl func_ov041_022013cc
    ldr r0, .L_021fe080
    mov r1, #0xf8
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldmia sp!, {r4, pc}
.L_021fe080: .word gSoundContext
.L_021fe084: .word data_020f4dc8
    .size func_ov041_021fdfd0, . - func_ov041_021fdfd0

