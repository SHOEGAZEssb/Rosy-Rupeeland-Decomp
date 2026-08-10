; Matching retail form; see src/game/actor_extended_link_source_callbacks.c.
.text
.extern ActorExtendedType2_ApplyContactResponse
.global func_02044044
.type func_02044044, @function
.global func_0204404c
.type func_0204404c, @function
.global func_02044058
.type func_02044058, @function
.global func_02044088
.type func_02044088, @function
.global func_02044098
.type func_02044098, @function
.global func_020440a8
.type func_020440a8, @function
func_02044044: ; 0x02044044
    mov r0, #0x20000
    bx lr

.size func_02044044, . - func_02044044
func_0204404c: ; 0x0204404c
    ldr ip, .L_02044054
    bx ip
.L_02044054: .word ActorExtendedType2_ApplyContactResponse

.size func_0204404c, . - func_0204404c
func_02044058: ; 0x02044058
    str r1, [r0, #0x298]
    ldr r2, [r0, #0x29c]
    mov r1, #0x100
    orr r2, r2, #0x1
    str r2, [r0, #0x29c]
    ldr r2, [r0, #0xd0]
    bic r2, r2, #0x100
    str r2, [r0, #0xd0]
    ldr r0, [r0, #0x54]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    bx lr

.size func_02044058, . - func_02044058
func_02044088: ; 0x02044088
    ldr r1, [r0, #0x29c]
    bic r1, r1, #0x1
    str r1, [r0, #0x29c]
    bx lr

.size func_02044088, . - func_02044088
func_02044098: ; 0x02044098
    ldr r1, [r0, #0x29c]
    bic r1, r1, #0x2
    str r1, [r0, #0x29c]
    bx lr

.size func_02044098, . - func_02044098
func_020440a8: ; 0x020440a8
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x10
    beq .L_020440c4
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_020440c4:
    mov r0, #0x0
    bx lr
.size func_020440a8, . - func_020440a8
