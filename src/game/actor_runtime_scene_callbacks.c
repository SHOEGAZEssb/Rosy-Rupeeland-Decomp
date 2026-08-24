#include "tingle/actor_runtime_scene.h"

/* Forward scene lifecycle and touch callbacks to the shared game context. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
#ifdef __cplusplus
}
#endif

typedef void (*ActorRuntimeContextMethod)(void *context);
typedef void (*ActorRuntimeTouchMethod)(void *context,
                                        const TouchPoint *point);

/*
 * Invoke shared-context vtable method 0x0c, clear palette entry zero at
 * 0x05000000, and return 0. The halfword write directly affects DS palette
 * hardware; self is unused.
 */
s32 ActorRuntimeScene_Begin(ActorRuntimeScene *self)
{
    void *context = gGamePhaseRuntime;
    void **vtable = *(void ***)context;

    (void)self;
    ((ActorRuntimeContextMethod)vtable[0x0c / 4])(context);
    *(volatile u16 *)0x05000000 = 0;
    return 0;
}

/* Invoke shared-context vtable method 0x10 and return 0; self is unused. */
s32 ActorRuntimeScene_Leave(ActorRuntimeScene *self)
{
    void *context = gGamePhaseRuntime;
    void **vtable = *(void ***)context;

    (void)self;
    ((ActorRuntimeContextMethod)vtable[0x10 / 4])(context);
    return 0;
}

/*
 * Copy point into a stack TouchPoint, forward it through shared-context vtable
 * method 0x14, and return 0. The virtual callback's gameplay effect is not yet
 * confirmed; self is unused and no hardware is touched directly.
 */
s32 ActorRuntimeScene_TouchBegin(ActorRuntimeScene *self, const TouchPoint *point)
{
    TouchPoint copy;
    void *context = gGamePhaseRuntime;
    void **vtable;

    (void)self;
    TouchPoint_InitCopy(&copy, point);
    vtable = *(void ***)context;
    ((ActorRuntimeTouchMethod)vtable[0x14 / 4])(context, &copy);
    return 0;
}

/* Copy x/y from source, install the shared TouchPoint vtable, and return result. */
TouchPoint *TouchPoint_InitCopy(TouchPoint *result, const TouchPoint *source)
{
    result->vtable = &gSceneTouchInitialData.pointVTable;
    result->x = source->x;
    result->y = source->y;
    return result;
}

/* Copy and forward point through shared-context vtable method 0x18; return 0. */
s32 ActorRuntimeScene_TouchMove(ActorRuntimeScene *self, const TouchPoint *point)
{
    TouchPoint copy;
    void *context = gGamePhaseRuntime;
    void **vtable;

    (void)self;
    TouchPoint_InitCopy(&copy, point);
    vtable = *(void ***)context;
    ((ActorRuntimeTouchMethod)vtable[0x18 / 4])(context, &copy);
    return 0;
}

/* Copy and forward point through shared-context vtable method 0x1c; return 0. */
s32 ActorRuntimeScene_TouchEnd(ActorRuntimeScene *self, const TouchPoint *point)
{
    TouchPoint copy;
    void *context = gGamePhaseRuntime;
    void **vtable;

    (void)self;
    TouchPoint_InitCopy(&copy, point);
    vtable = *(void ***)context;
    ((ActorRuntimeTouchMethod)vtable[0x1c / 4])(context, &copy);
    return 0;
}
