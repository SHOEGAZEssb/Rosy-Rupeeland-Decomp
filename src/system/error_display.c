#include "tingle/error_display.h"
#include "tingle/graphics_display.h"

/*
 * Terminal display path used when normal execution cannot continue. It
 * prepares one of the fixed sub-screen resource sets, blanks both backdrop
 * colors, resets the sound driver, and then leaves the CPU in an SDK halt
 * loop. A trivial lazily registered context preserves the original C++
 * lifetime machinery even though no context fields are currently consumed.
 */

#define REG_BG_PLTT0 (*(volatile u16 *)0x05000000)
#define REG_BG_PLTT0_SUB (*(volatile u16 *)0x05000400)

#ifdef __cplusplus
extern "C" {
#endif

extern void __register_global_object(void *object, void (*destructor)(void *),
                                     void *record);
extern void Sound_Reset(void *soundContext);
extern void OS_Halt(void);

extern void *gSoundContext;
extern u32 gGraphicsResourceSetsGuard[];
extern u8 gErrorDisplayContext[];
extern u8 gErrorDisplayContextDestructorRecord[];

#ifdef __cplusplus
}
#endif

/* The recovered context owns no resources, so shutdown has no work to do. */
void ErrorDisplayContext_Destroy(void *context)
{
    (void)context;
}

/*
 * Blank both engines, reset sound state, and halt forever. The loop has no
 * return value and OS_Halt disables IRQs before issuing the ARM wait command.
 */
void ErrorDisplay_RunHaltLoop(void)
{
    void **soundContext = &gSoundContext;

    REG_BG_PLTT0 = 0;
    REG_BG_PLTT0_SUB = 0;

    for (;;) {
        Sound_Reset(*soundContext);
        OS_Halt();
    }
}

/*
 * Configure the terminal sub-screen from resourceSetIndex and enter the
 * non-returning halt loop. The repeated getter call is observable lazy-global
 * access retained from the original code.
 */
void ErrorDisplay_ShowAndHalt(s32 resourceSetIndex)
{
    GraphicsDisplay_SetupSubBg0(ErrorDisplayContext_Get(), resourceSetIndex);
    ErrorDisplayContext_Get();
    ErrorDisplay_RunHaltLoop();
}

/* Select terminal resource set zero and enter the non-returning halt path. */
#ifndef MATCHING
void ErrorDisplay_ShowDefaultAndHalt(void)
{
    ErrorDisplayContext_Get();
    ErrorDisplay_ShowAndHalt(0);
}
#else
/* Force the direct local call relocation used by the original C++ object. */
asm void ErrorDisplay_ShowDefaultAndHalt(void)
{
    stmdb sp!, {r3, lr}
    bl ErrorDisplayContext_Get
    mov r0, #0
    bl ErrorDisplay_ShowAndHalt
    ldmia sp!, {r3, pc}
}
#endif

/*
 * Register the eight-byte context once and return it. The low guard bit is
 * the compiler-generated construction flag; the registered destructor is a
 * no-op because the context currently has no recovered owned state.
 */
void *ErrorDisplayContext_Get(void) throw()
{
    if (!(gGraphicsResourceSetsGuard[1] & 1)) {
        __register_global_object(gErrorDisplayContext,
                                 ErrorDisplayContext_Destroy,
                                 gErrorDisplayContextDestructorRecord);
        gGraphicsResourceSetsGuard[1] |= 1;
    }
    return gErrorDisplayContext;
}
