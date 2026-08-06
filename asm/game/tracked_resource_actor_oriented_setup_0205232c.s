; Matching retail form; see src/game/tracked_resource_actor_oriented_setup.c.
.extern func_02005058
.extern func_02005070
.extern func_020050a4
.extern func_020066a4
.extern func_020328d0
.extern func_02050b34
.text
    .global func_0205232c
func_0205232c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    mov r1, r2
    add r0, sp, #0x0
    add r2, r4, #0x18
    str r5, [r4, #0x1fc]
    bl func_020066a4
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, r4, #0x38
    bl func_02005070
    mov r1, r0
    cmp r1, #0x4
    movlt r1, #0x4
    add r0, r4, #0x38
    bl func_02050b34
    ldrsh r1, [r5, #0xa]
    add r0, r4, #0x38
    mov r1, r1, lsl #0x4
    bl func_020328d0
    mov r0, #0x10000
    ldrsh r2, [r5, #0xa]
    ldr r1, [r4, #0x54]
    rsb r0, r0, #0x0
    strh r2, [r1, #0x36]
    ldr r1, [r4, #0x14]
    orr r1, r1, #0x800000
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x5c]
    and r0, r1, r0
    orr r0, r0, #0x8
    str r0, [r4, #0x5c]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0205232c, . - func_0205232c

