.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern func_02071eb8
.extern func_0207419c

.global func_ov094_022199e0
func_ov094_022199e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    bl func_0207419c
    ldr r0, [r4, #0x10]
    bl func_0207419c
    mov r0, r4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov094_022199e0, . - func_ov094_022199e0
