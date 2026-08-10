.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221aaa4
.extern TrackedResourceActorType28_Destroy
.extern func_ov097_02219aa8

.global func_ov097_02219e4c
func_ov097_02219e4c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02219e7c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x204]
    cmp r0, #0x0
    beq .L_02219e6c
    bl func_ov097_02219aa8
.L_02219e6c:
    mov r0, r4
    bl TrackedResourceActorType28_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02219e7c: .word data_ov097_0221aaa4
.size func_ov097_02219e4c, . - func_ov097_02219e4c
