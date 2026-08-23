.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern data_ov087_022189e0
.extern Actor_ReleaseSecondaryRenderAttachment
.extern ActorDerivedRuntime_DestroyAlternate

.global func_ov087_0221788c
func_ov087_0221788c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022178d8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_022178c8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022178c8:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022178d8: .word data_ov087_022189e0
.size func_ov087_0221788c, . - func_ov087_0221788c
