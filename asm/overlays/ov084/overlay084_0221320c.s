.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_021056e4
.extern func_0204157c

.global func_ov084_0221320c
func_ov084_0221320c:
    ldr r2, .L_02213224
    ldr ip, .L_02213228
    ldrh r3, [r2, #0x0]
    add r3, r3, #0x1
    strh r3, [r2, #0x0]
    bx ip
.L_02213224: .word data_021056e4
.L_02213228: .word func_0204157c
.size func_ov084_0221320c, . - func_ov084_0221320c
