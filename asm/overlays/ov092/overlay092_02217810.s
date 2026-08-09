.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_ov092_02217834

.global func_ov092_02217810
func_ov092_02217810:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov092_02217834
    ldrb r0, [r4, #0xb]
    cmp r0, #0x0
    ldreqsh r0, [r4, #0x2]
    addeq r0, r0, #0x1
    streqh r0, [r4, #0x2]
    ldmia sp!, {r4, pc}
.size func_ov092_02217810, . - func_ov092_02217810
