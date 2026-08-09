.text
; Matching fallback for the portable implementation in src/overlays/ov101/overlay101_recovery.c.
.extern Scene_Init
.extern data_ov101_0221d658

.global func_ov101_0221d3e0
func_ov101_0221d3e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Scene_Init
    ldr r0, .L_0221d404
    mov r1, #0x0
    str r0, [r4, #0x0]
    mov r0, r4
    strh r1, [r4, #0x24]
    ldmia sp!, {r4, pc}
.L_0221d404: .word data_ov101_0221d658
.size func_ov101_0221d3e0, . - func_ov101_0221d3e0
