; Matching retail form; see src/game/game_phase_area_scene_helpers.c.
.text
.extern GamePhaseRegionTable_GetRegion
.extern GamePhaseRegionTable_IsRegionEnabled
.extern GamePhaseRegionTable_GetCount
.extern func_02029bfc

    .global func_02012444
func_02012444: ; 0x02012444
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r7, r1
    cmp r0, #0x0
    beq L_020124e8
    mov r6, #0x0
    mov r5, r6
    mov r4, #0x1
    b L_020124d8
L_02012470:
    mov r0, r7
    mov r1, r6
    bl GamePhaseRegionTable_IsRegionEnabled
    cmp r0, #0x0
    beq L_020124d4
    mov r0, r7
    mov r1, r6
    bl GamePhaseRegionTable_GetRegion
    ldrsh r2, [r0, #0x4]
    mov r1, r4
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    str r2, [sp, #0x0]
    ldrsh r2, [r0, #0x6]
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    stmib sp, {r2, r5}
    ldrsh r2, [r0, #0x0]
    ldrsh r3, [r0, #0x2]
    ldr r0, [r8, #0x4]
    add r2, r2, r2, lsr #0x1f
    add r3, r3, r3, lsr #0x1f
    mov r2, r2, asr #0x1
    mov r3, r3, asr #0x1
    bl func_02029bfc
L_020124d4:
    add r6, r6, #0x1
L_020124d8:
    mov r0, r7
    bl GamePhaseRegionTable_GetCount
    cmp r6, r0
    blt L_02012470
L_020124e8:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    .size func_02012444, . - func_02012444

