.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_ov076_02214d08
.extern func_0200500c
.extern ActorExtendedLinkSource_Init

.global func_ov076_022137c8
func_ov076_022137c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinkSource_Init
    ldr ip, .L_02213854
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0x2a8
    mov r3, #0x1b000
    str ip, [r4, #0x0]
    bl func_0200500c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x2b8
    bl func_0200500c
    mov r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0xca]
    strh r2, [r0, #0xcc]
    strb r2, [r4, #0x2ce]
    strb r2, [r4, #0x2cf]
    strh r2, [r0, #0xd0]
    strb r2, [r4, #0x2d2]
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x8
    orr r0, r0, #0x1000
    orr r0, r0, #0x200000
    str r0, [r4, #0x260]
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0x40
    str r1, [r4, #0x14]
    strh r2, [r4, #0x64]
    strh r2, [r4, #0x60]
    ldmia sp!, {r4, pc}
.L_02213854: .word data_ov076_02214d08
.size func_ov076_022137c8, . - func_ov076_022137c8
