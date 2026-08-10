; Matching retail form; see src/game/overlay60_object_spawn.c.
.text
.extern GamePhaseScriptVm_Pop
.extern func_020be328
.extern func_02072b68
.extern func_020791e0
.extern Actor_GetCollection
.extern func_02078e98
.extern func_0201d9e4
.extern func_0201da34
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern Heap_Alloc
.extern func_ov060_022100e4
.extern data_021f3ecc
.extern data_021f4090
.extern data_020d5e00
.extern gHeapContext
.global func_0201da34
func_0201da34: ; 0x0201da34
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x8c]
    ldr r1, [r5, #0x84]
    mov r0, r0, lsl #0x1e
    ldr r4, [r1, #0x54]
    movs r0, r0, asr #0x1f
    cmpne r4, #0x0
    ldrnesb r0, [r5, #0x90]
    mvnne r1, #0x7f
    cmpne r0, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020be328
    mov r1, r0
    mov r0, r4
    and r1, r1, #0xff
    bl func_02072b68
    ldrsb r0, [r5, #0x90]
    cmp r0, #0x0
    ldrlth r0, [r4, #0x24]
    orrlt r0, r0, #0x40
    strlth r0, [r4, #0x24]
    ldrh r0, [r4, #0x24]
    orr r0, r0, #0x2
    strh r0, [r4, #0x24]
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201da34, . - func_0201da34
