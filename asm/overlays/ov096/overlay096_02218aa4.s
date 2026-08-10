.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedType2_LookupSpecialTarget65

.global func_ov096_02218aa4
func_ov096_02218aa4:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x228]
    cmp r3, #0x0
    ldrnesh r2, [r0, #0xda]
    cmpne r2, #0x0
    beq .L_02218ad4
    ldr r2, [r0, #0x0]
    add r1, r3, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02218ad4:
    bl ActorExtendedType2_LookupSpecialTarget65
    ldmia sp!, {r3, pc}
.size func_ov096_02218aa4, . - func_ov096_02218aa4
