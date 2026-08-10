.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern Heap_Free
.extern Scene_Destroy
.extern data_ov061_022102b0
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern func_0200f52c
.extern func_0200f7bc
.extern func_0200f824
.extern func_0205940c
.extern gSoundContext

.global func_ov061_0220fe6c
func_ov061_0220fe6c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220fed0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0200f824
    bl func_0200f52c
    bl func_0200f824
    bl func_0200f7bc
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0220feac
    ldr r0, .L_0220fed4
    ldr r1, .L_0220fed8
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205940c
.L_0220feac:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220fed0: .word data_ov061_022102b0
.L_0220fed4: .word gSoundContext
.L_0220fed8: .word 0x186
.size func_ov061_0220fe6c, . - func_ov061_0220fe6c
