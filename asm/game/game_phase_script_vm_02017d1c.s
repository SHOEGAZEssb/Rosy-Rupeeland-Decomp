; Matching retail form; see src/game/game_phase_script_vm_object_factory_dispatch_opcode.c.
.text
.extern Heap_Alloc
.extern data_020d5b34
.extern data_020d5b74
.extern data_020d5b94
.extern data_020d5b9c
.extern data_020d5ba4
.extern data_020d5bac
.extern data_020d5bb4
.extern data_020d5bbc
.extern data_020d5bc4
.extern data_020d5bcc
.extern data_020d5bd4
.extern data_020d5bdc
.extern data_020d5be4
.extern data_020f4e14
.extern data_021052fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern func_0201d240
.extern func_0201d688
.extern func_0201ded4
.extern func_0201df44
.extern func_020200bc
.extern DisplayFadePresentation_Init
.extern SceneDisplayResources_Setup
.extern func_020215cc
.extern func_0202225c
.extern func_02022580
.extern func_02023fa0
.extern func_020240cc
.extern func_02024200
.extern func_0202432c
.extern func_02024468
.extern func_02024594
.extern func_02027150
.extern func_02027300
.extern func_020755e0
.extern func_02075630
.extern func_ov058_0220f484
.extern gDebugFont
.extern gHeapContext
.global GamePhaseActorScriptVm_DispatchObjectFactory
GamePhaseActorScriptVm_DispatchObjectFactory:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    cmp r4, #0x14
    addls pc, pc, r4, lsl #0x2
    b L_0201816c
L_02017d54: ; jump table
    b L_0201816c ; case 0
    b L_0201816c ; case 1
    b L_0201812c ; case 2
    b L_02018120 ; case 3
    b L_020180e4 ; case 4
    b L_020180b8 ; case 5
    b L_0201807c ; case 6
    b L_020181b0 ; case 7
    b L_02018054 ; case 8
    b L_02018014 ; case 9
    b L_02017fc8 ; case 10
    b L_02017f8c ; case 11
    b L_02017f4c ; case 12
    b L_02017f0c ; case 13
    b L_02017ecc ; case 14
    b L_02017e90 ; case 15
    b L_02017e78 ; case 16
    b L_02017e34 ; case 17
    b L_02017e00 ; case 18
    b L_02017de4 ; case 19
    b L_02017da8 ; case 20
L_02017da8:
    ldr r1, L_020181bc
    ldr r3, L_020181c0
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017dcc
    bl func_02024468
    mov r1, r0
L_02017dcc:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017de4:
    ldr r0, L_020181c8
    ldr r0, [r0, #0x0]
    bl func_02075630
    ldr r0, L_020181cc
    ldr r0, [r0, #0x0]
    bl func_02075630
    b L_020181b0
L_02017e00:
    ldr r0, L_020181cc
    ldr r0, [r0, #0x0]
    bl func_020755e0
    mov r4, r0
    mov r1, r6, lsl #0x1
    ldr r0, L_020181c8
    strh r5, [r4, r1]
    ldr r0, [r0, #0x0]
    bl func_020755e0
    mov r2, r6, lsl #0x1
    ldrh r1, [r4, r2]
    strh r1, [r0, r2]
    b L_020181b0
L_02017e34:
    ldr r1, L_020181d0
    ldr r3, L_020181c0
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017e60
    mov r1, r6
    mov r2, r5
    bl func_0202432c
    mov r1, r0
L_02017e60:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017e78:
    bl OverlayManager_GetGlobal
    ldr r2, L_020181d4
    mov r1, #0x1
    bl OverlayManager_LoadOverlay
    bl func_ov058_0220f484
    b L_020181b0
L_02017e90:
    ldr r1, L_020181d8
    ldr r3, L_020181c0
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017eb4
    bl func_02024200
    mov r1, r0
L_02017eb4:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017ecc:
    ldr r1, L_020181dc
    ldr r3, L_020181c0
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017ef4
    mov r1, r6
    bl func_02027150
    mov r1, r0
L_02017ef4:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017f0c:
    ldr r1, L_020181e0
    ldr r3, L_020181c0
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017f34
    mov r1, r6
    bl func_020240cc
    mov r1, r0
L_02017f34:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017f4c:
    ldr r1, L_020181e4
    ldr r3, L_020181c0
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017f74
    mov r1, r6
    bl func_02027300
    mov r1, r0
L_02017f74:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02017f8c:
    ldr r0, L_020181e8
    ldr r1, L_020181ec
    ldr r3, L_020181c0
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017fb0
    bl func_02022580
    mov r1, r0
L_02017fb0:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df44
    b L_020181b0
L_02017fc8:
    ldr r1, L_020181f0
    ldr r3, L_020181c0
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02017ffc
    mov r2, #0x0
    mov r1, r6
    mov r3, r2
    str r5, [sp, #0x0]
    bl func_020200bc
    mov r1, r0
L_02017ffc:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02018014:
    ldr r1, L_020181f4
    ldr r3, L_020181c0
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_0201803c
    mov r1, r6
    bl func_02024594
    mov r1, r0
L_0201803c:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_02018054:
    ldr r1, L_020181f8
    ldr r3, L_020181c0
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_020181b0
    mov r1, r6
    bl func_0201d688
    b L_020181b0
L_0201807c:
    ldr r1, L_020181e0
    ldr r3, L_020181c0
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_020180a0
    bl func_02023fa0
    mov r1, r0
L_020180a0:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_020181b0
L_020180b8:
    ldr r1, L_020181fc
    ldr r3, L_020181c0
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_020181b0
    mov r2, r6
    mov r1, #0x1
    bl func_0201d240
    b L_020181b0
L_020180e4:
    ldr r1, L_02018200
    ldr r3, L_020181c0
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02018108
    bl func_0202225c
    mov r1, r0
L_02018108:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df44
    b L_020181b0
L_02018120:
    mov r0, r6
    bl SceneDisplayResources_Setup
    b L_020181b0
L_0201812c:
    ldr r1, L_02018204
    ldr r3, L_020181c0
    mov r0, #0x3cc
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02018154
    mov r1, r6
    bl func_020215cc
    mov r1, r0
L_02018154:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df44
    b L_020181b0
L_0201816c:
    ldr r1, L_02018204
    ldr r3, L_020181c0
    mov r0, #0x54
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_0201819c
    mov r1, r4
    mov r2, r6
    mov r3, r5
    bl DisplayFadePresentation_Init
    mov r1, r0
L_0201819c:
    ldr r0, L_020181c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df44
L_020181b0:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_020181bc: .word data_020d5b94
L_020181c0: .word gHeapContext
L_020181c4: .word data_021052fc
L_020181c8: .word data_020f4e14
L_020181cc: .word gDebugFont
L_020181d0: .word data_020d5b9c
L_020181d4: .word 0x3a
L_020181d8: .word data_020d5ba4
L_020181dc: .word data_020d5bac
L_020181e0: .word data_020d5bb4
L_020181e4: .word data_020d5bbc
L_020181e8: .word 0x448
L_020181ec: .word data_020d5bc4
L_020181f0: .word data_020d5b74
L_020181f4: .word data_020d5bcc
L_020181f8: .word data_020d5bd4
L_020181fc: .word data_020d5bdc
L_02018200: .word data_020d5be4
L_02018204: .word data_020d5b34
.size GamePhaseActorScriptVm_DispatchObjectFactory, . - GamePhaseActorScriptVm_DispatchObjectFactory
