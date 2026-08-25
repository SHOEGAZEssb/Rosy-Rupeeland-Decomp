    .section .init, 4, 1, 6
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern __register_global_object
    .extern data_ov017_022016f0
    .extern data_ov017_022016f8
    .extern data_ov017_02201700
    .extern data_ov017_0220170c
    .extern data_ov017_02201718
    .extern data_ov017_02201724
    .extern data_ov017_02201730
    .extern data_ov017_0220173c
    .extern data_ov017_02201748
    .extern data_ov017_02201754
    .extern func_02091e0c
    .extern func_02091e1c
    .extern Overlay017_RecordBase_NoOp
    .extern Overlay017_RecordBase_Init
    .extern Overlay017_RecordBase_Destroy
    .extern func_ov017_022013f4
.global __sinit_ov017_02201440
.type __sinit_ov017_02201440, @function
__sinit_ov017_02201440:
    stmdb sp!, {r3, lr}
    mov r1, #0x0
    ldr r0, L_022014d8
    mov r2, r1
    bl func_ov017_022013f4
    ldr r0, L_022014d8
    ldr r1, L_022014dc
    ldr r2, L_022014e0
    bl __register_global_object
    mov r1, #0x0
    ldr r0, L_022014e4
    mov r2, r1
    bl func_ov017_022013f4
    ldr r0, L_022014e4
    ldr r1, L_022014dc
    ldr r2, L_022014e8
    bl __register_global_object
    ldr r0, L_022014ec
    bl Overlay017_RecordBase_Init
    ldr r0, L_022014ec
    ldr r1, L_022014f0
    ldr r2, L_022014f4
    bl __register_global_object
    ldr r0, L_022014f8
    mov r1, #0x4
    bl func_02091e0c
    ldr r0, L_022014f8
    ldr r1, L_022014fc
    ldr r2, L_02201500
    bl __register_global_object
    ldr r0, L_02201504
    mov r1, #0x8
    bl func_02091e0c
    ldr r0, L_02201504
    ldr r1, L_022014fc
    ldr r2, L_02201508
    bl __register_global_object
    ldmia sp!, {r3, pc}
L_022014d8: .word data_ov017_0220170c
L_022014dc: .word Overlay017_RecordBase_NoOp
L_022014e0: .word data_ov017_02201718
L_022014e4: .word data_ov017_02201730
L_022014e8: .word data_ov017_02201724
L_022014ec: .word data_ov017_02201754
L_022014f0: .word Overlay017_RecordBase_Destroy
L_022014f4: .word data_ov017_0220173c
L_022014f8: .word data_ov017_022016f0
L_022014fc: .word func_02091e1c
L_02201500: .word data_ov017_02201748
L_02201504: .word data_ov017_022016f8
L_02201508: .word data_ov017_02201700
    .size __sinit_ov017_02201440, . - __sinit_ov017_02201440
