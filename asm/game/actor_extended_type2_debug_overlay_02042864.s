; Matching retail form; see src/game/actor_extended_type2_debug_overlay.c.
.text
.extern data_020df9e8
.extern data_020dfa78
.extern data_020dfa90
.extern data_020dfaa0
.extern data_020dfac0
.extern data_020dfac8
.extern data_020dfb10
.extern data_020dfb20
.extern data_020dfb28
.extern data_020dfb30
.extern data_020dfb38
.extern data_020dfb40
.extern data_020dfb48
.extern data_020dfb50
.extern data_020dfb60
.extern data_020dfb68
.extern data_020dfb70
.extern data_020dfb80
.extern data_020dfb88
.extern data_020dfb90
.extern data_020dfb98
.extern data_020dfba8
.extern data_020dfce4
.extern data_020e00d0
.extern data_020e00d8
.extern data_020e00dc
.extern data_020e00e4
.extern data_020e00ec
.extern data_020e00f4
.extern data_020e00f8
.extern data_020e0100
.extern data_020e010c
.extern data_020e0110
.extern data_020e011c
.extern data_020e0124
.extern data_020e012c
.extern data_020e0134
.extern data_020e013c
.extern data_020e0144
.extern data_020e0150
.extern data_020e0158
.extern data_020e0160
.extern data_020e0168
.extern data_020e016c
.extern data_020e0178
.extern data_020e0184
.extern data_020e0194
.extern data_020e019c
.extern data_020e01a4
.extern data_020e01b4
.extern data_020e01c4
.extern data_020e01e4
.extern data_020e01f4
.extern data_020e0204
.extern data_020e0214
.extern DebugText_Printf
.extern func_02033b38
.extern func_020befec
.extern gDebugFont
.global func_02042864
.type func_02042864, @function
func_02042864: ; 0x02042864
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl func_02033b38
    ldr r0, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r0, #0xd8]
    mov r0, #0x0
    cmp r3, r1
    mov r6, #0x1
    ldr r1, .L_02042f80
    bne .L_020428ac
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_020428ac:
    cmp r6, #0x0
    ldreq r0, .L_02042f84
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x1b0]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042f88
    bne .L_020428e8
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_020428e8:
    cmp r6, #0x0
    ldreq r0, .L_02042f8c
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x1c0]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042f90
    bne .L_02042924
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042924:
    cmp r6, #0x0
    ldreq r0, .L_02042f94
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x1a8]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042f98
    bne .L_02042960
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042960:
    cmp r6, #0x0
    ldreq r0, .L_02042f9c
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x1a0]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fa0
    bne .L_0204299c
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_0204299c:
    cmp r6, #0x0
    ldreq r0, .L_02042fa4
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x198]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fa8
    bne .L_020429d8
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_020429d8:
    cmp r6, #0x0
    ldreq r0, .L_02042fac
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0xb8]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fb0
    bne .L_02042a14
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042a14:
    cmp r6, #0x0
    ldreq r0, .L_02042fb4
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x188]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fb8
    bne .L_02042a50
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042a50:
    cmp r6, #0x0
    ldreq r0, .L_02042fbc
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x180]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fc0
    bne .L_02042a8c
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042a8c:
    cmp r6, #0x0
    ldreq r0, .L_02042fc4
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x178]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fc8
    bne .L_02042ac8
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042ac8:
    cmp r6, #0x0
    ldreq r0, .L_02042fcc
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0xa8]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fd0
    bne .L_02042b04
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042b04:
    cmp r6, #0x0
    ldreq r0, .L_02042fd4
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x168]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fd8
    bne .L_02042b40
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042b40:
    cmp r6, #0x0
    ldreq r0, .L_02042fdc
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x160]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fe0
    bne .L_02042b7c
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042b7c:
    cmp r6, #0x0
    ldreq r0, .L_02042fe4
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x158]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042fe8
    bne .L_02042bb8
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042bb8:
    cmp r6, #0x0
    ldreq r0, .L_02042fec
    beq .L_02042bfc
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x218]
    ldr r1, [r1, #0x150]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02042ff0
    bne .L_02042bf4
    ldr r2, [r5, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042bf4:
    cmp r6, #0x0
    ldreq r0, .L_02042ff4
.L_02042bfc:
    cmp r0, #0x0
    beq .L_02042c28
    ldr r2, .L_02042ff8
    ldr r1, .L_02042ffc
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0xc
    bl DebugText_Printf
.L_02042c28:
    ldr r0, .L_02042f7c
    ldr r3, [r5, #0x220]
    ldr r1, [r0, #0x148]
    mov r0, #0x0
    cmp r3, r1
    mov r6, #0x1
    ldr r1, .L_02043000
    bne .L_02042c5c
    ldr r2, [r5, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042c5c:
    cmp r6, #0x0
    ldreq r0, .L_02043004
    beq .L_02042d54
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x220]
    ldr r1, [r1, #0x140]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02043008
    bne .L_02042c98
    ldr r2, [r5, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042c98:
    cmp r6, #0x0
    ldreq r0, .L_0204300c
    beq .L_02042d54
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x220]
    ldr r1, [r1, #0x138]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02043010
    bne .L_02042cd4
    ldr r2, [r5, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042cd4:
    cmp r6, #0x0
    ldreq r0, .L_02043014
    beq .L_02042d54
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x220]
    ldr r1, [r1, #0x90]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02043018
    bne .L_02042d10
    ldr r2, [r5, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042d10:
    cmp r6, #0x0
    ldreq r0, .L_0204301c
    beq .L_02042d54
    ldr r1, .L_02042f7c
    ldr r3, [r5, #0x220]
    ldr r1, [r1, #0x128]
    mov r6, #0x1
    cmp r3, r1
    ldr r1, .L_02043020
    bne .L_02042d4c
    ldr r2, [r5, #0x224]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r6, #0x0
.L_02042d4c:
    cmp r6, #0x0
    ldreq r0, .L_02042f9c
.L_02042d54:
    cmp r0, #0x0
    beq .L_02042d80
    ldr r2, .L_02043024
    ldr r1, .L_02042ffc
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0xd
    bl DebugText_Printf
.L_02042d80:
    ldr r0, .L_02043028
    ldr r1, .L_0204302c
    str r0, [sp, #0x0]
    ldrsh r2, [r5, #0xd6]
    ldr r0, .L_02042ffc
    mov r3, r4
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    bl DebugText_Printf
    ldr r1, .L_02043030
    ldr r0, .L_02042ffc
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x230]
    mov r3, r4
    mov r1, r1, asr #0xc
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x234]
    mov r1, #0x1
    mov r2, r2, asr #0xc
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl DebugText_Printf
    ldr r0, [r5, #0x274]
    ldr r1, .L_02043034
    cmp r0, #0x0
    ldrne r2, .L_02043038
    ldr r0, .L_02042ffc
    ldreq r2, .L_0204303c
    mov r3, r4
    stmia sp, {r1, r2}
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x10
    bl DebugText_Printf
    ldr r1, .L_02043040
    ldr r0, .L_02042ffc
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x260]
    mov r3, r4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x11
    bl DebugText_Printf
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    beq .L_02042e98
    add r0, r5, #0x200
    ldrh r7, [r0, #0x6a]
    mov r1, #0x3c
    mov r0, r7
    bl func_020befec
    mov r6, r0
    mov r0, r7
    mov r1, #0x3c
    bl func_020befec
    ldr r2, .L_02043044
    ldr r0, .L_02042ffc
    stmia sp, {r2, r6}
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x12
    bl DebugText_Printf
    b .L_02042eb8
.L_02042e98:
    ldr r1, .L_02043048
    ldr r0, .L_02042ffc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x12
    bl DebugText_Printf
.L_02042eb8:
    ldr r0, [r5, #0x278]
    ldr r1, .L_0204304c
    cmp r0, #0x0
    ldrne r2, .L_02043038
    ldr r0, .L_02042ffc
    ldreq r2, .L_0204303c
    mov r3, r4
    stmia sp, {r1, r2}
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x13
    bl DebugText_Printf
    ldr r0, .L_02042f7c
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0xe0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02043050
    bne .L_02042f18
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02042f18:
    cmp r3, #0x0
    bne .L_02042f4c
    ldr r1, .L_02043054
    add r0, r5, #0x200
    str r1, [sp, #0x0]
    ldrh r1, [r0, #0x4e]
    ldr r0, .L_02042ffc
    mov r3, r4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x14
    bl DebugText_Printf
.L_02042f4c:
    ldr r1, .L_02043058
    ldr r0, .L_02042ffc
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1fc]
    mov r3, r4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x15
    bl DebugText_Printf
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02042f7c: .word data_020df9e8
.L_02042f80: .word data_020dfac0
.L_02042f84: .word data_020e00d0
.L_02042f88: .word data_020dfb98
.L_02042f8c: .word data_020e00d8
.L_02042f90: .word data_020dfba8
.L_02042f94: .word data_020e00dc
.L_02042f98: .word data_020dfb90
.L_02042f9c: .word data_020e00e4
.L_02042fa0: .word data_020dfb88
.L_02042fa4: .word data_020e00ec
.L_02042fa8: .word data_020dfb80
.L_02042fac: .word data_020e00f4
.L_02042fb0: .word data_020dfaa0
.L_02042fb4: .word data_020e00f8
.L_02042fb8: .word data_020dfb70
.L_02042fbc: .word data_020e0100
.L_02042fc0: .word data_020dfb68
.L_02042fc4: .word data_020e010c
.L_02042fc8: .word data_020dfb60
.L_02042fcc: .word data_020e0110
.L_02042fd0: .word data_020dfa90
.L_02042fd4: .word data_020e011c
.L_02042fd8: .word data_020dfb50
.L_02042fdc: .word data_020e0124
.L_02042fe0: .word data_020dfb48
.L_02042fe4: .word data_020e012c
.L_02042fe8: .word data_020dfb40
.L_02042fec: .word data_020e0134
.L_02042ff0: .word data_020dfb38
.L_02042ff4: .word data_020e013c
.L_02042ff8: .word data_020e0144
.L_02042ffc: .word gDebugFont
.L_02043000: .word data_020dfb30
.L_02043004: .word data_020e0150
.L_02043008: .word data_020dfb28
.L_0204300c: .word data_020e0158
.L_02043010: .word data_020dfb20
.L_02043014: .word data_020e0160
.L_02043018: .word data_020dfa78
.L_0204301c: .word data_020e0168
.L_02043020: .word data_020dfb10
.L_02043024: .word data_020e016c
.L_02043028: .word data_020e0178
.L_0204302c: .word data_020dfce4
.L_02043030: .word data_020e0184
.L_02043034: .word data_020e01a4
.L_02043038: .word data_020e0194
.L_0204303c: .word data_020e019c
.L_02043040: .word data_020e01b4
.L_02043044: .word data_020e01c4
.L_02043048: .word data_020e01e4
.L_0204304c: .word data_020e01f4
.L_02043050: .word data_020dfac8
.L_02043054: .word data_020e0204
.L_02043058: .word data_020e0214

    .global ActorExtendedType2_IsDirectionToActorAccepted
.size func_02042864, . - func_02042864
