    .text
    .extern func_02071eb8
    .extern func_0207419c
    .extern func_020927b8
    .extern func_020c0c24
    .extern func_ov016_021fd0dc

/* Exact fallback for list destruction; see src/overlays/ov016/overlay016_list_lifecycle.c. */
    .global func_ov016_021fd06c

func_ov016_021fd06c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_0207419c
    ldr r0, [r4, #0x8]
    bl func_0207419c
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq L_021fd09c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd09c:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq L_021fd0b8
    ldr r3, L_021fd0d8
    mov r1, #0x14
    mov r2, #0x8
    bl func_020c0c24
L_021fd0b8:
    add r0, r4, #0x28
    bl func_020927b8
    add r0, r4, #0x18
    bl func_02071eb8
    add r0, r4, #0xc
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd0d8: .word func_ov016_021fd0dc

    .size func_ov016_021fd06c, . - func_ov016_021fd06c
