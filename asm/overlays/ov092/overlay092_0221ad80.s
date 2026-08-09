.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221ad80
func_ov092_0221ad80:
    ldr ip, [r0, #0x214]
    cmp ip, #0x0
    movne ip, #0x6
    moveq ip, #0x8
    str ip, [r0, #0x20c]
    str r1, [r0, #0x200]
    str r3, [r0, #0x204]
    str r2, [r0, #0x208]
    bx lr
.size func_ov092_0221ad80, . - func_ov092_0221ad80
