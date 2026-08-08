.text
.extern func_0209a2ac
    .global func_ov042_02208fd0
func_ov042_02208fd0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x4c]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_02208fd0, . - func_ov042_02208fd0
