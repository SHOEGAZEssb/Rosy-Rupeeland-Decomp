.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_020050a4
.extern Actor_RefreshTerrainHeight
.extern func_ov081_0221312c

.global func_ov081_022130dc
func_ov081_022130dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x18
    add r1, r4, #0x214
    bl func_020050a4
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    mov r1, #0x0
    ldr r0, [r4, #0x1dc]
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x24]
    add r0, r4, #0x38
    bl func_ov081_0221312c
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov081_0221312c
    ldmia sp!, {r4, pc}
.size func_ov081_022130dc, . - func_ov081_022130dc
