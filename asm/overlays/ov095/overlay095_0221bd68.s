.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorExtendedType2_DispatchTransitionCallback
.extern func_ov095_0221bf8c

.global func_ov095_0221bd68
func_ov095_0221bd68:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov095_0221bf8c
    cmp r0, #0x0
    mov r0, r5
    beq .L_0221bd98
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0221bd98:
    mov r1, r4
    bl ActorExtendedType2_DispatchTransitionCallback
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov095_0221bd68, . - func_ov095_0221bd68
