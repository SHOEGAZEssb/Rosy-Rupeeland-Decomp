.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern GXx_SetMasterBrightness_
.extern func_020afce8

.global func_ov093_022186bc
func_ov093_022186bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_02218700
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x40]
    mov r1, #0xe
    bl func_020afce8
    ldrb r0, [r4, #0x1fc]
    cmp r0, #0x8
    ldmhsia sp!, {r4, pc}
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x40]
    ldr r0, .L_02218704
    bl GXx_SetMasterBrightness_
    ldmia sp!, {r4, pc}
.L_02218700: .word 0x4000050
.L_02218704: .word 0x400106c
.size func_ov093_022186bc, . - func_ov093_022186bc
