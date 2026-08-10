; Matching retail form; see src/game/actor_extended_linked_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e04d8
.extern data_02105728
.extern data_0210572c
.extern ActorExtendedType2_Init
.extern ActorExtendedType2_Destroy
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_ApplyContactResponse
.global ActorExtendedLinked_Init
.type ActorExtendedLinked_Init, @function
.global ActorExtendedLinked_DestroyComplete
.type ActorExtendedLinked_DestroyComplete, @function
.global ActorExtendedLinked_DestroyAndFree
.type ActorExtendedLinked_DestroyAndFree, @function
.global ActorExtendedLinked_Destroy
.type ActorExtendedLinked_Destroy, @function
.global ActorExtendedLinked_UpdateFrame
.type ActorExtendedLinked_UpdateFrame, @function
.global ActorExtendedLinked_ApplyContactResponse
.type ActorExtendedLinked_ApplyContactResponse, @function
ActorExtendedLinked_Init: ; 0x02043cd0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02043d10
    mov r1, #0x0
    str r0, [r4, #0x0]
    ldr r0, .L_02043d14
    str r1, [r4, #0x298]
    ldrsh r3, [r0, #0x2]
    cmp r3, #0x8
    ldrlt r1, .L_02043d18
    addlt r2, r3, #0x1
    strlth r2, [r0, #0x2]
    strlt r4, [r1, r3, lsl #0x2]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02043d10: .word data_020e04d8
.L_02043d14: .word data_02105728
.L_02043d18: .word data_0210572c
.size ActorExtendedLinked_Init, . - ActorExtendedLinked_Init
ActorExtendedLinked_DestroyComplete: ; 0x02043d1c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorExtendedLinked_DestroyComplete, . - ActorExtendedLinked_DestroyComplete
ActorExtendedLinked_DestroyAndFree: ; 0x02043d30
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorExtendedLinked_DestroyAndFree, . - ActorExtendedLinked_DestroyAndFree
ActorExtendedLinked_Destroy: ; 0x02043d4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorExtendedLinked_Destroy, . - ActorExtendedLinked_Destroy
ActorExtendedLinked_UpdateFrame: ; 0x02043d60
    ldr ip, .L_02043d68
    bx ip
.L_02043d68: .word ActorExtendedType2_UpdateFrame
.size ActorExtendedLinked_UpdateFrame, . - ActorExtendedLinked_UpdateFrame
ActorExtendedLinked_ApplyContactResponse: ; 0x02043d6c
    ldr ip, .L_02043d74
    bx ip
.L_02043d74: .word ActorExtendedType2_ApplyContactResponse
.size ActorExtendedLinked_ApplyContactResponse, . - ActorExtendedLinked_ApplyContactResponse
