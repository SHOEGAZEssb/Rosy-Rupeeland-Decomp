; Matching retail form; see src/game/game_phase_script_vm_actor_action_opcodes.c.
.text
.extern Actor_SavePrimaryAttachmentState

    .global func_02013eb0
func_02013eb0: ; 0x02013eb0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x84]
    bl Actor_SavePrimaryAttachmentState
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02013eb0, . - func_02013eb0
