; Matching retail form; see src/game/actor_extended_table_descriptor_gates.c.
.text
.extern ActorExtendedType2_AccumulateProximityInteraction
.extern func_02043610
.extern func_02044760
.global func_020447a8
.type func_020447a8, @function
func_020447a8: ; 0x020447a8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02043610
    cmp r0, #0x0
    bne .L_020447d8
    mov r0, r6
    bl func_02044760
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_020447d8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorExtendedType2_AccumulateProximityInteraction
    ldmia sp!, {r4, r5, r6, pc}
.size func_020447a8, . - func_020447a8
