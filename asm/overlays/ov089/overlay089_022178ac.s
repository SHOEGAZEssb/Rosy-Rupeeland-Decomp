.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219928
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_ov089_02217904

.global func_ov089_022178ac
func_ov089_022178ac:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022178d0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_ov089_02217904
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022178d0: .word data_ov089_02219928
.size func_ov089_022178ac, . - func_ov089_022178ac
