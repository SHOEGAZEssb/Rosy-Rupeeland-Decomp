.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_controller.c. */
.extern func_0209189c
.extern TitleRandom_NextBounded
.extern func_ov025_021fe4cc


    .global func_ov025_021fe3f8
func_ov025_021fe3f8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x9
L_021fe404:
    mov r1, r5
    add r0, r6, #0xf8
    bl TitleRandom_NextBounded
    ldr r1, [r6, #0x9c]
    mov r4, r0
    cmp r4, r1
    beq L_021fe404
    add r0, r6, #0xf8
    mov r1, #0x0
    mov r2, #0x3
    bl func_0209189c
    mov r2, r0
    mov r0, r6
    mov r1, r4
    bl func_ov025_021fe4cc
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov025_021fe3f8, .-func_ov025_021fe3f8

