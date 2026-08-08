.text

/* Exact fallback; see src/overlays/ov032/overlay032_dialog_children.c for documented portable C. */
.extern Sound_Play
.extern data_020f4e18
.extern func_02071d4c
.extern func_020939d8
.extern gSoundContext

    .global func_ov032_021fe7d0
func_ov032_021fe7d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    bl func_020939d8
    ldr r0, [r4, #0x18]
    bl func_020939d8
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq L_021fe800
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe800:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq L_021fe818
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe818:
    ldr r0, L_021fe840
    ldr r1, [r4, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02071d4c
    ldr r0, L_021fe844
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    ldmia sp!, {r4, pc}
L_021fe840: .word data_020f4e18
L_021fe844: .word gSoundContext
.size func_ov032_021fe7d0, .-func_ov032_021fe7d0

