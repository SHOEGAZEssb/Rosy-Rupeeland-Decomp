; Matching retail form; see src/game/game_phase_script_vm_actor_effect_dispatch_opcode.c.
.text
.extern ActorDescriptor_InitRange
.global func_02019890
func_02019890:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov ip, #0x0
    strh ip, [r4, #0x2]
    strh ip, [r4, #0x4]
    strh ip, [r4, #0x6]
    str ip, [r4, #0xc]
    str ip, [r4, #0x10]
    str r4, [r4, #0x14]
    mov r3, #0x1
    str r3, [r4, #0x18]
    str r4, [r4, #0x1c]
    str ip, [r4, #0x20]
    bl ActorDescriptor_InitRange
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_02019890, . - func_02019890
