.text
.extern __construct_array
.extern func_ov042_021fcf80
.extern func_ov042_021fcf9c
.global func_ov042_022050b0
func_ov042_022050b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr ip, .L_02205140
    mov r5, r1
    ldr r3, .L_02205144
    add r0, r4, #0x144
    mov r1, #0x40
    mov r2, #0xc
    str ip, [sp, #0x0]
    bl __construct_array
    add r0, r4, #0x44
    ldr ip, .L_02205140
    ldr r3, .L_02205144
    add r0, r0, #0x400
    mov r1, #0x40
    mov r2, #0xc
    str ip, [sp, #0x0]
    bl __construct_array
    mov r0, #0x40
    str r5, [r4, #0x0]
    sub ip, r0, #0x1
    mvn r3, #0x0
.L_02205108:
    add r2, r4, ip
    add r0, r4, ip, lsl #0x1
    add r1, ip, #0x1
    strb r3, [r2, #0x4]
    add r0, r0, #0x700
    strh r1, [r0, #0xc4]
    subs ip, ip, #0x1
    bpl .L_02205108
    add r0, r4, #0x800
    strh r3, [r0, #0x42]
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x844]
    ldmia sp!, {r3, r4, r5, pc}
.L_02205140: .word func_ov042_021fcf9c
.L_02205144: .word func_ov042_021fcf80
.size func_ov042_022050b0, . - func_ov042_022050b0
