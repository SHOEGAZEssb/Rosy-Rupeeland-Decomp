    .text
/* Exact fallback; see src/overlays/ov022/overlay022_scene_lifecycle.c. */
    .extern __destroy_arr
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov022_022006a0
    .extern func_020597fc
    .extern func_02071c38
    .extern func_02071eb8
    .extern func_0207419c
    .extern func_02075630
    .extern func_020927b8
    .extern func_ov022_021fcf98
    .extern func_ov022_021fd458
    .extern func_ov022_021fda28
    .extern func_ov022_021fdd00
    .extern func_ov046_0220ba80
    .extern gDebugFont
    .extern gSoundContext
    .extern Heap_Free

.global func_ov022_021fe010
func_ov022_021fe010:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe16c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x20]
    ldr r0, L_021fe170
    bic r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fe174
    bl func_020597fc
    ldr r5, [r4, #0x354]
    cmp r5, #0x0
    beq L_021fe058
    mov r0, r5
    bl func_ov022_021fcf98
    mov r0, r5
    bl Heap_Free
L_021fe058:
    ldr r5, [r4, #0x35c]
    cmp r5, #0x0
    beq L_021fe074
    mov r0, r5
    bl func_ov046_0220ba80
    mov r0, r5
    bl Heap_Free
L_021fe074:
    ldr r5, [r4, #0x350]
    cmp r5, #0x0
    beq L_021fe090
    mov r0, r5
    bl func_ov022_021fd458
    mov r0, r5
    bl Heap_Free
L_021fe090:
    ldr r0, [r4, #0x2cc]
    cmp r0, #0x0
    beq L_021fe0a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe0a8:
    ldr r0, [r4, #0x2b4]
    cmp r0, #0x0
    beq L_021fe0c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe0c0:
    ldr r5, [r4, #0x2b8]
    cmp r5, #0x0
    beq L_021fe0dc
    mov r0, r5
    bl func_ov022_021fda28
    mov r0, r5
    bl Heap_Free
L_021fe0dc:
    ldr r0, [r4, #0x9c]
    bl func_0207419c
    ldr r0, [r4, #0xa0]
    bl func_0207419c
    ldr r0, L_021fe178
    ldr r1, [r4, #0x374]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fe17c
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    ldr r0, L_021fe180
    ldr r0, [r0, #0x0]
    bl func_02075630
    ldr r0, L_021fe184
    ldr r0, [r0, #0x0]
    bl func_02075630
    add r0, r4, #0x154
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fe188
    bl __destroy_arr
    add r0, r4, #0xa8
    bl func_ov022_021fdd00
    add r0, r4, #0x90
    bl func_02071eb8
    add r0, r4, #0x84
    bl func_02071eb8
    add r0, r4, #0x78
    bl func_02071eb8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe16c: .word data_ov022_022006a0
L_021fe170: .word gSoundContext
L_021fe174: .word 0x122
L_021fe178: .word data_020f4e18
L_021fe17c: .word 0x4000050
L_021fe180: .word data_020f4e14
L_021fe184: .word gDebugFont
L_021fe188: .word func_ov022_021fdd00
.size func_ov022_021fe010, . - func_ov022_021fe010
