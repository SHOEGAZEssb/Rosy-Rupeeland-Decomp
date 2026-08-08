.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_owner.c. */
.extern data_020f4e18
.extern data_ov026_0220497c
.extern func_02071e04
.extern func_ov026_021fce50


    .global func_ov026_021feda4
func_ov026_021feda4:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fee1c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, L_021fee20
    ldr r1, [r4, #0x9c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021feddc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feddc:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    beq L_021fedf4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fedf4:
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    beq L_021fee0c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fee0c:
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fee1c: .word data_ov026_0220497c
L_021fee20: .word data_020f4e18
.size func_ov026_021feda4, .-func_ov026_021feda4

