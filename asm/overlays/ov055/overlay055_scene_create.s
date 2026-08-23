.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov055_0220f088
.extern RuntimePresentationManager_AppendFirstListEffect
.extern func_02027e8c
.extern GamePhaseProgress_GetOrCreateGlobal
.extern func_ov055_0220e8b8
.extern gHeapContext

.global func_ov055_0220ef6c
func_ov055_0220ef6c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220efd4
    ldr r3, .L_0220efd8
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0220efb4
    ldr r0, .L_0220efdc
    ldr r0, [r0, #0x0]
    add r4, r0, #0x3bc
    bl GamePhaseProgress_GetOrCreateGlobal
    bl func_02027e8c
    mov r2, r0
    mov r0, r5
    add r1, r4, #0x2c00
    bl func_ov055_0220e8b8
    mov r5, r0
.L_0220efb4:
    ldr r0, .L_0220efdc
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0220efd4: .word data_ov055_0220f088
.L_0220efd8: .word gHeapContext
.L_0220efdc: .word data_021052fc
.size func_ov055_0220ef6c, . - func_ov055_0220ef6c
