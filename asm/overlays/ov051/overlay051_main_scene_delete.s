.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern Heap_Free
.extern data_ov051_0220df48
.extern func_02002290
.extern func_020022dc
.extern func_0201e28c
.extern func_020ae96c

.global func_ov051_0220dd44
func_ov051_0220dd44:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220dd7c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020ae96c
    bl func_020022dc
    mov r1, #0x0
    bl func_02002290
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220dd7c: .word data_ov051_0220df48
.size func_ov051_0220dd44, . - func_ov051_0220dd44
