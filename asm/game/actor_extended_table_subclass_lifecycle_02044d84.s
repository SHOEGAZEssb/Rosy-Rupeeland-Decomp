; Matching retail form; see src/game/actor_extended_table_subclass_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e0b70
.extern ActorExtendedType2_Destroy
.extern func_02044518
.extern func_020447ec
.global func_02044d84
.type func_02044d84, @function
.global func_02044db4
.type func_02044db4, @function
.global func_02044dc8
.type func_02044dc8, @function
.global func_02044de4
.type func_02044de4, @function
func_02044d84: ; 0x02044d84
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02044518
    ldr r0, .L_02044db0
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0xa8]
    mov r0, r4
    strh r2, [r1, #0xaa]
    ldmia sp!, {r4, pc}
.L_02044db0: .word data_020e0b70

.size func_02044d84, . - func_02044d84
func_02044db4: ; 0x02044db4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02044db4, . - func_02044db4
func_02044dc8: ; 0x02044dc8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02044dc8, . - func_02044dc8
func_02044de4: ; 0x02044de4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020447ec
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa8]
    mov r1, #0xf
    strh r1, [r0, #0xaa]
    ldmia sp!, {r4, pc}
.size func_02044de4, . - func_02044de4
