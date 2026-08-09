.text
; Matching fallback for the portable implementation in src/overlays/ov109/overlay109_recovery.c.
.extern data_ov109_0221d720
.extern data_ov109_0221d734
.extern data_ov109_0221ef6d
.extern data_ov109_022228c0
.extern data_ov109_022228c4
.extern func_02008f58
.extern func_0203aac4
.extern func_0203abac
.extern func_0203b38c
.extern func_0203b3ac

.global func_ov109_0221d6c0
func_ov109_0221d6c0:
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
.L_0221d6fc: .word data_ov109_022228c4
.L_0221d700: .word data_ov109_0221d734
.L_0221d704: .word data_ov109_022228c0
.L_0221d708: .word data_ov109_0221d720
.L_0221d70c: .word data_ov109_0221ef6d
.size func_ov109_0221d6c0, . - func_ov109_0221d6c0
