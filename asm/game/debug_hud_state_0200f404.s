; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern Heap_Alloc
.extern gDebugHudRendererAllocationTag
.extern data_020f4e14
.extern data_020f4e18
.extern DebugHudState_UploadRows
.extern func_02071980
.extern func_02092cc0
.extern func_02092e9c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

    .global DebugHudState_Open
DebugHudState_Open: ; 0x0200f404
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    str r3, [r5, #0x20]
    str r1, [r5, #0x0]
    ldr r0, L_0200f510
    ldr r1, L_0200f514
    ldr r0, [r0, #0x0]
    mov r4, r2
    bl func_02071980
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x0]
    mov r2, #0x4
    cmp r0, #0x0
    mov r0, #0xec
    bne L_0200f46c
    ldr r1, L_0200f518
    ldr r3, L_0200f51c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f464
    ldr r1, L_0200f520
    ldr r2, [r5, #0x4]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_0200f464:
    str r0, [r5, #0x8]
    b L_0200f494
L_0200f46c:
    ldr r1, L_0200f518
    ldr r3, L_0200f51c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f490
    ldr r1, L_0200f524
    ldr r2, [r5, #0x4]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_0200f490:
    str r0, [r5, #0x8]
L_0200f494:
    mov r0, r5
    bl DebugHudState_UploadRows
    ldr lr, [r5, #0x1c]
    ldr ip, [r5, #0x18]
    ldr r3, [r5, #0x14]
    ldr r2, [r5, #0x8]
    ldr r0, [r5, #0x10]
    mov r1, #0x0
    str r0, [r2, #0xa4]
    str r3, [r2, #0xa8]
    str ip, [r2, #0xac]
    str lr, [r2, #0xb0]
    ldr r2, [r5, #0x8]
    mov r0, #0xc
    str r0, [r2, #0xd0]
    str r1, [r2, #0xd4]
    ldr r0, [r5, #0x8]
    sub r2, r1, #0x2
    str r1, [r0, #0xb4]
    ldr r0, [r5, #0x8]
    mov r1, r4
    str r2, [r0, #0xbc]
    ldr r0, [r5, #0x8]
    mov r2, #0x4
    bl func_02092e9c
    ldr r0, L_0200f528
    mov r1, #0xc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    strh r1, [r0, #0xd2]
    ldmia sp!, {r3, r4, r5, pc}
L_0200f510: .word data_020f4e18
L_0200f514: .word 0x7007
L_0200f518: .word gDebugHudRendererAllocationTag
L_0200f51c: .word gHeapContext
L_0200f520: .word data_020f4e14
L_0200f524: .word gDebugFont
L_0200f528: .word gGameWork
    .size DebugHudState_Open, . - DebugHudState_Open

