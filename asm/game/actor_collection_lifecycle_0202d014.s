; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text
.extern func_020742cc
.extern data_020f4e14
.extern gDebugFont

    .global func_0202d014
    .type func_0202d014, @function
func_0202d014: ; 0x0202d014
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    cmp r4, #0x1
    beq .L_0202d034
    cmp r4, #0x2
    beq .L_0202d048
    b .L_0202d058
.L_0202d034:
    ldr r0, .L_0202d064
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r5, #0xe00]
    b .L_0202d058
.L_0202d048:
    ldr r0, .L_0202d068
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r5, #0xe00]
.L_0202d058:
    add r0, r5, #0x2000
    str r4, [r0, #0xe84]
    ldmia sp!, {r3, r4, r5, pc}
.L_0202d064: .word data_020f4e14
.L_0202d068: .word gDebugFont
    .size func_0202d014, . - func_0202d014
