.text
.extern func_ov044_0220bd98
.extern func_ov044_0220bb48
.extern SceneSound_PlayPackedEffect
.extern func_ov044_0220be38
.extern data_ov044_0220d2e8

    .global func_ov044_0220caa4
func_ov044_0220caa4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x228]
    bl func_ov044_0220bd98
    mov r1, #0x1
    bl func_ov044_0220bb48
    cmp r0, #0x0
    mov r0, r4
    beq .L_0220cae4
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_0220cae4:
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    ldr r1, .L_0220cb00
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    ldmia sp!, {r4, pc}
.L_0220cb00: .word data_ov044_0220d2e8
.size func_ov044_0220caa4, . - func_ov044_0220caa4
