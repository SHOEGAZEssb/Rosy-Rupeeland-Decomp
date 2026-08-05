; Matching retail form; see src/game/game_phase_script_vm_debug_hud_content_opcodes.c.
.text
.extern func_0200f67c
.extern func_0200f824
.extern func_02012704
.global func_0201741c
func_0201741c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_02012704
    mov r5, r0
    mov r0, r4
    bl func_02012704
    mov r4, r0
    bl func_0200f824
    mov r1, r4
    mov r2, r5
    bl func_0200f67c
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0201741c, . - func_0201741c
