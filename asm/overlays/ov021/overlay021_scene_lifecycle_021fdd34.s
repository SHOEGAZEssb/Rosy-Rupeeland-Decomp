    .text
/* Exact fallback; see src/overlays/ov021/overlay021_scene_lifecycle.c. */
    .extern __destroy_arr
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov021_02202f64
    .extern func_02006280
    .extern func_02071c38
    .extern func_02071eb8
    .extern func_0207419c
    .extern func_02075630
    .extern func_020927b8
    .extern func_ov002_021fb9c4
    .extern func_ov021_021fd074
    .extern func_ov021_021fd790
    .extern func_ov045_0220b8cc
    .extern func_ov045_0220d2d8
    .extern gDebugFont
    .extern Heap_Free

.global func_ov021_021fdd34
func_ov021_021fdd34:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fded8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2d0]
    cmp r0, r1
    beq L_021fdd64
    bl func_ov045_0220d2d8
L_021fdd64:
    ldr r5, [r4, #0x3ec]
    cmp r5, #0x0
    beq L_021fdd80
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fdd80:
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_021fdd98
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdd98:
    ldr r0, [r4, #0x358]
    cmp r0, #0x0
    beq L_021fddb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fddb0:
    ldr r5, [r4, #0x390]
    cmp r5, #0x0
    beq L_021fddcc
    mov r0, r5
    bl func_ov002_021fb9c4
    mov r0, r5
    bl Heap_Free
L_021fddcc:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_021fdde4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdde4:
    ldr r0, [r4, #0x38c]
    cmp r0, #0x0
    beq L_021fddfc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fddfc:
    ldr r0, [r4, #0x388]
    cmp r0, #0x0
    beq L_021fde14
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fde14:
    mov r5, #0x0
L_021fde18:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0x2a4]
    cmp r6, #0x0
    beq L_021fde38
    mov r0, r6
    bl func_ov021_021fd074
    mov r0, r6
    bl Heap_Free
L_021fde38:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt L_021fde18
    ldr r0, [r4, #0x94]
    bl func_0207419c
    ldr r0, L_021fdedc
    ldr r1, [r4, #0x400]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fdee0
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fdee4
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02075630
    ldr r0, L_021fdee8
    ldr r0, [r0, #0x0]
    bl func_02075630
    add r0, r4, #0x1c
    add r0, r0, #0x400
    bl func_02006280
    add r0, r4, #0x14c
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fdeec
    bl __destroy_arr
    add r0, r4, #0xa0
    bl func_ov021_021fd790
    add r0, r4, #0x88
    bl func_02071eb8
    add r0, r4, #0x7c
    bl func_02071eb8
    add r0, r4, #0x58
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fded8: .word data_ov021_02202f64
L_021fdedc: .word data_020f4e18
L_021fdee0: .word 0x4000050
L_021fdee4: .word data_020f4e14
L_021fdee8: .word gDebugFont
L_021fdeec: .word func_ov021_021fd790
.size func_ov021_021fdd34, . - func_ov021_021fdd34
