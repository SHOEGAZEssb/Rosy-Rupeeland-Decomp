; Matching retail form; see src/game/actor_extended_linked_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e04d8
.extern data_02105728
.extern data_0210572c
.extern func_0203db80
.extern func_0203e494
.extern ActorExtendedType2_UpdateFrame
.extern func_02043340
.global func_02043cd0
.type func_02043cd0, @function
.global func_02043d1c
.type func_02043d1c, @function
.global func_02043d30
.type func_02043d30, @function
.global func_02043d4c
.type func_02043d4c, @function
.global func_02043d60
.type func_02043d60, @function
.global func_02043d6c
.type func_02043d6c, @function
func_02043cd0: ; 0x02043cd0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203db80
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
.size func_02043cd0, . - func_02043cd0
func_02043d1c: ; 0x02043d1c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_02043d1c, . - func_02043d1c
func_02043d30: ; 0x02043d30
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_02043d30, . - func_02043d30
func_02043d4c: ; 0x02043d4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_02043d4c, . - func_02043d4c
func_02043d60: ; 0x02043d60
    ldr ip, .L_02043d68
    bx ip
.L_02043d68: .word ActorExtendedType2_UpdateFrame
.size func_02043d60, . - func_02043d60
func_02043d6c: ; 0x02043d6c
    ldr ip, .L_02043d74
    bx ip
.L_02043d74: .word func_02043340
.size func_02043d6c, . - func_02043d6c
