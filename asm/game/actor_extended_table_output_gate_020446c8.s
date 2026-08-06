; Matching retail form; see src/game/actor_extended_table_descriptor_gates.c.
.text
.extern func_0203f2ec
.extern func_02043610
.extern func_02044718
.extern func_02044760
.global func_020446c8
.type func_020446c8, @function
func_020446c8: ; 0x020446c8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203f2ec
    mov r0, r5
    bl func_02043610
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_02044718
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_02044760
    cmp r0, #0x0
    moveq r0, #0x0
    streqh r0, [r4, #0x0]
    streqh r0, [r4, #0x2]
    streqh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.size func_020446c8, . - func_020446c8
