; Matching retail form; see src/game/actor_extended_transform_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e08ec
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_Init
.extern ActorExtendedType2_Destroy
.extern ActorExtendedType2_GetDescriptorValue2C
.global ActorExtendedTransform_Init
.type ActorExtendedTransform_Init, @function
.global ActorExtendedTransform_InitDuplicate
.type ActorExtendedTransform_InitDuplicate, @function
.global ActorExtendedTransform_DestroyComplete
.type ActorExtendedTransform_DestroyComplete, @function
.global ActorExtendedTransform_DestroyAndFree
.type ActorExtendedTransform_DestroyAndFree, @function
.global ActorExtendedTransform_Destroy
.type ActorExtendedTransform_Destroy, @function
ActorExtendedTransform_Init: ; 0x020440cc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    mov r1, #0x0
    ldr r0, .L_02044114
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x0]
    add ip, r4, #0x200
    add r0, r4, #0x29c
    strh r1, [ip, #0x98]
    bl VecFx32Object_InitComponents
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    add r1, r4, #0x200
    strh r0, [r1, #0x9a]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02044114: .word data_020e08ec

.size ActorExtendedTransform_Init, . - ActorExtendedTransform_Init
ActorExtendedTransform_InitDuplicate: ; 0x02044118
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    mov r1, #0x0
    ldr r0, .L_02044160
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x0]
    add ip, r4, #0x200
    add r0, r4, #0x29c
    strh r1, [ip, #0x98]
    bl VecFx32Object_InitComponents
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    add r1, r4, #0x200
    strh r0, [r1, #0x9a]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02044160: .word data_020e08ec

.size ActorExtendedTransform_InitDuplicate, . - ActorExtendedTransform_InitDuplicate
ActorExtendedTransform_DestroyComplete: ; 0x02044164
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedTransform_DestroyComplete, . - ActorExtendedTransform_DestroyComplete
ActorExtendedTransform_DestroyAndFree: ; 0x02044184
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedTransform_DestroyAndFree, . - ActorExtendedTransform_DestroyAndFree
ActorExtendedTransform_Destroy: ; 0x020441ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorExtendedTransform_Destroy, . - ActorExtendedTransform_Destroy
