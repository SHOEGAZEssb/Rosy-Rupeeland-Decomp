.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern Heap_Free
.extern data_ov094_02219e9c
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_0209548c

.global func_ov094_02219460
func_ov094_02219460:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02219490
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xa4]
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02219490: .word data_ov094_02219e9c
.size func_ov094_02219460, . - func_ov094_02219460
