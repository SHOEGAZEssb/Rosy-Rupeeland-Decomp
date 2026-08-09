.text
; Matching fallback for the portable implementation in src/overlays/ov132/overlay132_recovery.c.
.extern data_ov132_0221d72c
.extern data_ov132_0221d740
.extern data_ov132_0221e95e
.extern data_ov132_0222c780
.extern data_ov132_0222c784
.extern func_02008f58
.extern func_0203aac4
.extern func_0203abac
.extern func_0203b38c
.extern func_0203b3ac

.global func_ov132_0221d6c0
func_ov132_0221d6c0:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_0203aac4
    ldr r0, .L_0221d6fc
    ldr r2, .L_0221d700
    mov r1, #0x3
    bl func_0203b38c
    ldr r0, .L_0221d704
    bl func_0203abac
    ldr r0, .L_0221d708
    bl func_02008f58
    ldr r0, .L_0221d70c
    bl func_0203b3ac
    ldmia sp!, {r3, pc}
.L_0221d6fc: .word data_ov132_0222c784
.L_0221d700: .word data_ov132_0221d740
.L_0221d704: .word data_ov132_0222c780
.L_0221d708: .word data_ov132_0221d72c
.L_0221d70c: .word data_ov132_0221e95e
.size func_ov132_0221d6c0, . - func_ov132_0221d6c0
