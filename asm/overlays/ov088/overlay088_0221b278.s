.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern gGamePhaseRuntime
.extern Actor_IsTerrainCellEligibleAtHeight

.global func_ov088_0221b278
func_ov088_0221b278:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr ip, .L_0221b2c0
    mov r4, r0
    ldr r0, [ip, #0x0]
    mov r7, r1
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r6, r2
    ldr ip, [r0, #0x0]
    mov r5, r3
    ldr ip, [ip, #0x2c]
    blx ip
    mov r0, r4
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl Actor_IsTerrainCellEligibleAtHeight
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221b2c0: .word gGamePhaseRuntime
.size func_ov088_0221b278, . - func_ov088_0221b278
