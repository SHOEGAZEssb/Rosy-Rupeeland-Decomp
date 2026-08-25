.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern gGamePhaseRuntime
.extern data_ov093_022188f0
.extern VecFx32Object_Init
.extern GamePhaseCurrencyHud_SetVisible
.extern RuntimeActorScriptVariantSubclass_Init
.extern func_ov093_022177e0
.extern gGameWork
.extern gGamePhaseCurrencyHud

.global func_ov093_022177f0
func_ov093_022177f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActorScriptVariantSubclass_Init
    ldr r1, .L_022178f0
    add r0, r4, #0x1ec
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    mov r1, #0x0
    strb r1, [r4, #0x1fc]
    strb r1, [r4, #0x1fd]
    add r0, r4, #0x100
    strh r1, [r0, #0xfe]
    add r0, r4, #0x200
    strh r1, [r0, #0x3c]
    strh r1, [r0, #0x3e]
    sub r2, r1, #0x10
    strh r2, [r0, #0x40]
    sub r0, r1, #0x180000
    str r0, [r4, #0x244]
    sub r0, r1, #0x248000
    str r0, [r4, #0x248]
    ldr r0, .L_022178f4
    str r1, [r4, #0x24c]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r2, [r0, #0x230]
    bic r2, r2, #0x4
    str r2, [r0, #0x230]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_022178f8
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_022178f8
    ldr r1, .L_022178fc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_022178f8
    ldr r1, .L_02217900
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_022178f8
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02217904
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    add r0, r4, #0x18
    mov r1, #0x180000
    ldr r2, [r4, #0x244]
    mov r3, #0x0
    bl func_ov093_022177e0
    add r0, r4, #0x1ec
    mov r1, #0x180000
    ldr r2, [r4, #0x248]
    mov r3, #0x0
    bl func_ov093_022177e0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022178f0: .word data_ov093_022188f0
.L_022178f4: .word gGamePhaseRuntime
.L_022178f8: .word gGameWork
.L_022178fc: .word 0x3f5
.L_02217900: .word 0x403
.L_02217904: .word gGamePhaseCurrencyHud
.size func_ov093_022177f0, . - func_ov093_022177f0
