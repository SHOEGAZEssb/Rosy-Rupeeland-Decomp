; Matching retail form; see src/game/actor_extended_link_source_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e06b4
.extern data_02105728
.extern data_0210574c
.extern ActorExtendedType2_Init
.extern ActorExtendedType2_Destroy
.extern ActorExtendedType2_UpdateFrame
.global func_02043de4
.type func_02043de4, @function
.global func_02043e38
.type func_02043e38, @function
.global func_02043e4c
.type func_02043e4c, @function
.global func_02043e68
.type func_02043e68, @function
.global func_02043e7c
.type func_02043e7c, @function
func_02043de4: ; 0x02043de4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02043e2c
    mov r1, #0x0
    str r0, [r4, #0x0]
    ldr r0, .L_02043e30
    str r1, [r4, #0x298]
    ldrsh r3, [r0, #0x0]
    cmp r3, #0x8
    ldrlt r1, .L_02043e34
    addlt r2, r3, #0x1
    strlth r2, [r0, #0x0]
    strlt r4, [r1, r3, lsl #0x2]
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x29c]
    ldmia sp!, {r4, pc}
.L_02043e2c: .word data_020e06b4
.L_02043e30: .word data_02105728
.L_02043e34: .word data_0210574c

.size func_02043de4, . - func_02043de4
func_02043e38: ; 0x02043e38
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02043e38, . - func_02043e38
func_02043e4c: ; 0x02043e4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02043e4c, . - func_02043e4c
func_02043e68: ; 0x02043e68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02043e68, . - func_02043e68
func_02043e7c: ; 0x02043e7c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
    ldr r0, [r4, #0x29c]
    bic r0, r0, #0x2
    str r0, [r4, #0x29c]
    ldmia sp!, {r4, pc}
.size func_02043e7c, . - func_02043e7c
