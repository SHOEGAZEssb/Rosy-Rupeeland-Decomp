; Matching retail form; see src/game/actor_extended_transform_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e08ec
.extern func_0200500c
.extern func_02005058
.extern ActorExtendedType2_Init
.extern ActorExtendedType2_Destroy
.extern ActorExtendedType2_GetDescriptorValue2C
.global func_020440cc
.type func_020440cc, @function
.global func_02044118
.type func_02044118, @function
.global func_02044164
.type func_02044164, @function
.global func_02044184
.type func_02044184, @function
.global func_020441ac
.type func_020441ac, @function
func_020440cc: ; 0x020440cc
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
    bl func_0200500c
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    add r1, r4, #0x200
    strh r0, [r1, #0x9a]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02044114: .word data_020e08ec

.size func_020440cc, . - func_020440cc
func_02044118: ; 0x02044118
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
    bl func_0200500c
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    add r1, r4, #0x200
    strh r0, [r1, #0x9a]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02044160: .word data_020e08ec

.size func_02044118, . - func_02044118
func_02044164: ; 0x02044164
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl func_02005058
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02044164, . - func_02044164
func_02044184: ; 0x02044184
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl func_02005058
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02044184, . - func_02044184
func_020441ac: ; 0x020441ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl func_02005058
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_020441ac, . - func_020441ac
