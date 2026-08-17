.text

/* Exact fallback; see src/overlays/ov032/overlay032_terminal_and_child_init.c for documented portable C. */
.extern AnimationResourceState_ReleaseResources
.extern func_ov032_0220147c

    .global func_ov032_02200f88
func_ov032_02200f88:
    stmdb sp!, {r4, lr}
    mov r4, r0
    stmia r4, {r1, r2, r3}
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b L_02200ff8
L_02200fa0: ; jump table
    b L_02200fb4 ; case 0
    b L_02200fc0 ; case 1
    b L_02200fd8 ; case 2
    b L_02200fd8 ; case 3
    b L_02200ff0 ; case 4
L_02200fb4:
    mov r0, #0xc
    str r0, [r4, #0x48]
    b L_02200ff8
L_02200fc0:
    rsb r1, r2, #0x3
    mov r0, #0x38
    mul r0, r1, r0
    rsb r0, r0, #0xc8
    str r0, [r4, #0x48]
    b L_02200ff8
L_02200fd8:
    rsb r1, r2, #0x3
    mov r0, #0x38
    mul r0, r1, r0
    rsb r0, r0, #0xc0
    str r0, [r4, #0x48]
    b L_02200ff8
L_02200ff0:
    ldr r0, L_0220101c
    str r0, [r4, #0x48]
L_02200ff8:
    mov r0, #0x90
    str r0, [r4, #0x4c]
    mov r1, #0x0
    add r0, r4, #0x18
    str r1, [r4, #0x64]
    bl func_ov032_0220147c
    add r0, r4, #0xc
    bl AnimationResourceState_ReleaseResources
    ldmia sp!, {r4, pc}
L_0220101c: .word 0x11a
.size func_ov032_02200f88, .-func_ov032_02200f88

