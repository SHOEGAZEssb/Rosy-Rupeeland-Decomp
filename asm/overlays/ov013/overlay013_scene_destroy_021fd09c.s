    .text
    .extern __destroy_arr
    .extern data_020f4e14
    .extern data_021052fc
    .extern data_ov013_021fed6c
    .extern func_0201e14c
    .extern func_02071eb8
    .extern func_0207419c
    .extern func_02075630
    .extern func_ov013_021fce00

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_scene_lifecycle.c. */
    .global func_ov013_021fd09c

func_ov013_021fd09c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd190
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x948]
    cmp r0, #0x0
    beq L_021fd0d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd0d0:
    ldr r0, [r4, #0x9a4]
    cmp r0, #0x0
    beq L_021fd0e8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd0e8:
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021fd100
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fd100:
    ldr r0, [r4, #0x84]
    bl func_0207419c
    ldr r0, [r4, #0x88]
    bl func_0207419c
    ldr r0, L_021fd194
    ldr r0, [r0, #0x0]
    bl func_02075630
    ldr r0, L_021fd198
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e14c
    add r0, r4, #0x9c
    add r0, r0, #0x800
    bl func_ov013_021fce00
    add r0, r4, #0x540
    mov r1, #0x5
    mov r2, #0xac
    ldr r3, L_021fd19c
    bl __destroy_arr
    add r0, r4, #0x8c
    mov r1, #0x7
    mov r2, #0xac
    ldr r3, L_021fd19c
    bl __destroy_arr
    add r0, r4, #0x78
    bl func_02071eb8
    add r0, r4, #0x6c
    bl func_02071eb8
    add r0, r4, #0x60
    bl func_02071eb8
    add r0, r4, #0x54
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd190: .word data_ov013_021fed6c
L_021fd194: .word data_020f4e14
L_021fd198: .word data_021052fc
L_021fd19c: .word func_ov013_021fce00
    .size func_ov013_021fd09c, . - func_ov013_021fd09c
