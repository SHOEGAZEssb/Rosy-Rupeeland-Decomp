.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_state.c.
.extern GameWork_SetFlag
.extern data_ov046_0220cce8
.extern func_02028100
.extern func_020755bc
.extern func_ov046_0220bffc
.extern func_ov046_0220c478
.extern func_ov046_0220c4a0
.extern func_ov046_0220c7b0
.extern func_ov046_0220cb4c
.extern gDebugFont
.extern gGameWork

.global func_ov046_0220cb88
func_ov046_0220cb88:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_0220cbfc
    ldr r0, .L_0220cc0c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, [r4, #0x74]
    ldr r1, [r4, #0x6c]
    bl func_02028100
    ldr r0, [r4, #0x70]
    bl func_ov046_0220c4a0
    mov r2, #0x0
    ldr r0, [r4, #0x70]
    ldr r1, [r4, #0x6c]
    mov r3, r2
    bl func_ov046_0220bffc
    ldr r0, [r4, #0x70]
    ldr r1, [r4, #0x6c]
    bl func_ov046_0220c478
    ldr r0, .L_0220cc10
    ldr r1, [r4, #0x68]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    ldr r1, .L_0220cc14
    ldmia r1, {r1, r2}
    bl func_ov046_0220c7b0
.L_0220cbfc:
    mov r0, r4
    bl func_ov046_0220cb4c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220cc0c: .word gDebugFont
.L_0220cc10: .word gGameWork
.L_0220cc14: .word data_ov046_0220cce8
.size func_ov046_0220cb88, . - func_ov046_0220cb88
