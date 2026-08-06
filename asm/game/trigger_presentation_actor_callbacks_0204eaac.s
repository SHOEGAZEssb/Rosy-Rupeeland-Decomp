; Matching retail form; see src/game/trigger_presentation_actor_callbacks.c.
.extern func_02031748
.extern func_02032a94
.extern func_02032abc
.extern func_02033fe4
.extern func_02034164
.text

func_0204eaac: ; 0x0204eaac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02031748
    mov r0, r4
    bl func_02034164
    cmp r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0204eaac, . - func_0204eaac

    .global func_0204eac8

func_0204eac8: ; 0x0204eac8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02032a94
    ldr r0, [r6, #0x188]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    cmpeq r4, #0x0
    bne .L_0204eb04
    mov r0, r6
    bl func_02033fe4
.L_0204eb04:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.size func_0204eac8, . - func_0204eac8

    .global func_0204eb0c

func_0204eb0c: ; 0x0204eb0c
    ldr ip, .L_0204eb14
    bx ip
.L_0204eb14: .word func_02032abc
.size func_0204eb0c, . - func_0204eb0c

