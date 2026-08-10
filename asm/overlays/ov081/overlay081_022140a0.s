.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_02005058
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_0204cd7c

.global func_ov081_022140a0
func_ov081_022140a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x244
    bl func_0204cd7c
    add r0, r4, #0x214
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov081_022140a0, . - func_ov081_022140a0
