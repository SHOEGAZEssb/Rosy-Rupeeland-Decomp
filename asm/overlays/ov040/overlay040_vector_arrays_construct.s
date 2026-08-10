.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern __construct_array
    .extern VecFx32Object_Init
    .extern VecFx32Object_Destroy
    .global func_ov040_02202ea4
func_ov040_02202ea4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r12, .Ldtor
    ldr r3, .Lctor
    add r0, r4, #0x4
    mov r1, #0x50
    mov r2, #0x10
    str r12, [sp]
    bl __construct_array
    add r0, r4, #0x2a4
    ldr r12, .Ldtor
    ldr r3, .Lctor
    add r0, r0, #0x800
    mov r1, #0x50
    mov r2, #0x10
    str r12, [sp]
    bl __construct_array
    mov r0, #0x50
    sub r2, r0, #0x1
    mov r1, #0x0
.Lclear:
    add r0, r4, r2, lsl #2
    str r1, [r0, #0x824]
    subs r2, r2, #0x1
    bpl .Lclear
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.Ldtor: .word VecFx32Object_Destroy
.Lctor: .word VecFx32Object_Init
    .size func_ov040_02202ea4, .-func_ov040_02202ea4
