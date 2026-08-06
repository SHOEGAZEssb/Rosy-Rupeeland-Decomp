; Matching retail form; see src/game/actor_extended_type3_timed_helpers.c.
.text
.extern data_020e0224
.extern func_02005030
.extern func_02005058
.extern func_020412a8
.extern func_02043610
.extern func_0204362c
.extern func_02043958
.extern func_02050078
.extern func_020bf1f8
.extern genrand_int32
.global func_02043b20
.type func_02043b20, @function
func_02043b20: ; 0x02043b20
    stmdb sp!, {r3, lr}
    add r2, r0, #0x200
    ldrsh r3, [r2, #0x9a]
    sub r3, r3, #0x1
    strh r3, [r2, #0x9a]
    ldrsh r2, [r2, #0x9a]
    cmp r2, #0x0
    bgt .L_02043b4c
    bl func_02043958
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02043b4c:
    bl func_020412a8
    ldmia sp!, {r3, pc}

.size func_02043b20, . - func_02043b20

.global func_02043b54
.type func_02043b54, @function
func_02043b54: ; 0x02043b54
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_02043b90
    bl genrand_int32
    mov r1, #0xf0
    bl func_020bf1f8
    add r1, r1, #0xf0
    add r0, r4, #0x200
    strh r1, [r0, #0x58]
    b .L_02043bac
.L_02043b90:
    ldrh r0, [r0, #0x58]
    cmp r1, r0
    ldrge r0, .L_02043bc4
    ldrge r1, [r0, #0x8]
    ldrge r0, [r0, #0xc]
    strge r1, [r4, #0x220]
    strge r0, [r4, #0x224]
.L_02043bac:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldmia sp!, {r4, pc}
.L_02043bc4: .word data_020e0224

.size func_02043b54, . - func_02043b54

.global func_02043bc8
.type func_02043bc8, @function
func_02043bc8: ; 0x02043bc8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_02043610
    cmp r0, #0x0
    bne .L_02043c1c
    mov r0, r4
    bl func_0204362c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02043c1c
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl func_02005030
    mov r0, r4
    bl func_0204362c
    add r1, sp, #0x0
    mov r2, r1
    bl func_02050078
    add r0, sp, #0x0
    bl func_02005058
.L_02043c1c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_02043bc8, . - func_02043bc8
