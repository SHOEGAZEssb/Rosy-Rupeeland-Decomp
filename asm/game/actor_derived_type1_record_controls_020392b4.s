; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern func_02033f7c
.extern func_02035bc8
.extern func_020390c8
.extern func_02039bb0

    .global func_020392b4
    .type func_020392b4, @function
func_020392b4: ; 0x020392b4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x230]
    mov r5, r1
    mov r4, r2
    tst r0, #0x400
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x26c]
    cmp r0, #0x0
    bne .L_020392f4
    ldr r0, [r6, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x14
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldmneia sp!, {r4, r5, r6, pc}
.L_020392f4:
    mov r0, r6
    bl func_02035bc8
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x270]
    cmp r0, #0x0
    beq .L_0203931c
    ldrb r0, [r0, #0x10]
    tst r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_0203931c:
    cmp r4, #0x0
    beq .L_0203932c
    mov r0, r6
    bl func_020390c8
.L_0203932c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02033f7c
    mov r0, r6
    bl func_02039bb0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_020392b4, . - func_020392b4
