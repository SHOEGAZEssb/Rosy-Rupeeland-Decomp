#include "tingle/types.h"

/* Overlay 25 modal shutdown and scene display-flag cleanup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095bec(void *);
#ifdef __cplusplus
}
#endif

/*
 * Close and virtually destroy the optional modal at scene +0x59C, clear its
 * owner pointer, and clear scene display flag bit 1. Returns void; modal heap
 * and UI state can change through the close and virtual-destructor calls.
 */
extern "C" void func_ov025_022002b0(void *scene)
{
    void *modal = FIELD(void *, scene, 0x59c);
    if (!modal)
        return;
    func_02095bec(modal);
    modal = FIELD(void *, scene, 0x59c);
    if (modal) {
        typedef void (*Destructor)(void *);
        ((Destructor)FIELD(void *, FIELD(void *, modal, 0), 4))(modal);
    }
    FIELD(void *, scene, 0x59c) = 0;
    FIELD(u32, scene, 0x48) &= ~2u;
}
