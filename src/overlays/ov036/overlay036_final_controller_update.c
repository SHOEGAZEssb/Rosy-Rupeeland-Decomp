#include "tingle/types.h"

/* Overlay 36 final-controller per-frame child, list, and manager servicing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*UpdateCallback)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_UpdateAndDeleteCompleted(void *list);
extern void GraphicsAnimationInstanceManager_Update(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Invokes vtable update slot +8 for objects +0xF0/+0xF4, services lists
 * +0xFC/+0x10C, and advances manager +0xE8. Returns nothing; child, list, and
 * manager state change, with any hardware effects delegated to virtual calls.
 */
extern "C" void func_ov036_0220429c(void *controller)
{
    void *object = FIELD(void *, controller, 0xf0);
    (*(UpdateCallback *)((u8 *)FIELD(void *, object, 0) + 8))(object);
    object = FIELD(void *, controller, 0xf4);
    (*(UpdateCallback *)((u8 *)FIELD(void *, object, 0) + 8))(object);
    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0xfc);
    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x10c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0xe8));
}
