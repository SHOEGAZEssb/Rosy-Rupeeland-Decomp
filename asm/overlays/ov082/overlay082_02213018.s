.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern ActorExtendedType2_HandleLanding
.extern ActorExtendedType2_GetDescriptorValue2C

.global func_ov082_02213018
func_ov082_02213018:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x1
    bne .L_0221303c
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x238]
    cmp r1, r0
    ldmgtia sp!, {r4, pc}
.L_0221303c:
    mov r0, r4
    bl ActorExtendedType2_HandleLanding
    mov r1, #0x0
    strh r1, [r4, #0xda]
    add r0, r4, #0x200
    strh r1, [r0, #0x98]
    ldmia sp!, {r4, pc}
.size func_ov082_02213018, . - func_ov082_02213018
