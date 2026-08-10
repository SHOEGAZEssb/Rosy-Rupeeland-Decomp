; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_UpdateAttachmentDirectionFromVector
.extern func_020337d4

    .global func_0201389c
func_0201389c: ; 0x0201389c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_02012704
    mov r5, r0
    ldr r0, [r4, #0x84]
    bl func_020337d4
    mov r1, r5
    bl ActorCollection_FindActorByDescriptorValue
    mov r2, r0
    ldr r0, [r4, #0x84]
    ldr ip, [r2, #0x1c]
    ldr r1, [r0, #0x1c]
    ldr r3, [r2, #0x20]
    ldr r2, [r0, #0x20]
    sub r1, ip, r1
    sub r2, r3, r2
    bl Actor_UpdateAttachmentDirectionFromVector
    ldr r0, [r4, #0x84]
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    beq L_02013900
    ldrb r1, [r0, #0x38]
    mov r0, r4
    bl func_020127f8
    b L_0201390c
L_02013900:
    mov r0, r4
    mov r1, #0x0
    bl func_020127f8
L_0201390c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0201389c, . - func_0201389c
