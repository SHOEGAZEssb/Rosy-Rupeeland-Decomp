.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_sub_scene_recovery.c.
.extern GX_SetBankForSubBG
.extern Heap_Free
.extern data_ov051_0220df98
.extern func_02002290
.extern func_020022dc
.extern func_0201e28c
.extern func_020aea7c

.global func_ov051_0220d9dc
func_ov051_0220d9dc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220da20
    mov r4, r0
    mov r0, #0x4
    str r1, [r4, #0x0]
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    bl func_020022dc
    mov r1, #0x0
    bl func_02002290
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220da20: .word data_ov051_0220df98
.size func_ov051_0220d9dc, . - func_ov051_0220d9dc
