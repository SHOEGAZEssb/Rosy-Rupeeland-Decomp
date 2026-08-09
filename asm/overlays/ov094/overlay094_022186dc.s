.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e70
.extern func_02071eb8
.extern func_0207419c
.extern func_02095308

.global func_ov094_022186dc
func_ov094_022186dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1c
    bl func_02095308
    ldr r0, [r4, #0x14]
    bl func_0207419c
    ldr r0, [r4, #0x18]
    bl func_0207419c
    ldr r1, .L_0221871c
    add r0, r4, #0x1c
    str r1, [r4, #0x1c]
    bl func_02095308
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221871c: .word data_ov094_02219e70
.size func_ov094_022186dc, . - func_ov094_022186dc
