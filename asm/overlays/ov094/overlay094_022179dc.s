.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern Heap_Free
.extern data_ov094_02219eb8
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_0209548c

.global func_ov094_022179dc
func_ov094_022179dc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217a0c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xa0]
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217a0c: .word data_ov094_02219eb8
.size func_ov094_022179dc, . - func_ov094_022179dc
