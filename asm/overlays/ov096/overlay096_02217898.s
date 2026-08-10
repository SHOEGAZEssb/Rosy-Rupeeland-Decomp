.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedType2_ConfigureCallback08

.global func_ov096_02217898
func_ov096_02217898:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_ConfigureCallback08
    mov r0, #0x0
    strb r0, [r4, #0x298]
    strb r0, [r4, #0x299]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.size func_ov096_02217898, . - func_ov096_02217898
