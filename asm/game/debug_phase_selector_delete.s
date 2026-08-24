; Matching retail form; see src/game/debug_phase_selector_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_020ae90c
.extern SoftwareCanvas_Destroy
.extern Scene_Destroy
.extern Heap_Free
.extern gDebugPhaseSelectorVTable
.global DebugPhaseSelector_DestroyAndFree
DebugPhaseSelector_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200c35c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020ae90c
    add r0, r4, #0x34
    bl SoftwareCanvas_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200c35c: .word gDebugPhaseSelectorVTable
.size DebugPhaseSelector_DestroyAndFree, . - DebugPhaseSelector_DestroyAndFree
