; Matching retail form; see src/game/game_phase_script_vm_actor_orientation_opcodes.c.
.text
.extern func_02012704
.extern func_020330fc
.extern func_02072b68
.global func_02016030
func_02016030:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    ldr r2, [r5, #0x84]
    mov r4, r0
    ldrb r1, [r2, #0xe7]
    ldr r0, [r2, #0x54]
    add r1, r1, r4
    and r1, r1, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x84]
    mov r2, r4, lsl #13
    mov r1, #0x11
    bl func_020330fc
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02016030, . - func_02016030
