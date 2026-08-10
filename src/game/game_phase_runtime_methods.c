#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/*
 * Short virtual methods for GamePhaseRuntime. They update its embedded scene
 * state, latch three independently requested actions, and handle event 100.
 */

typedef struct ActorQueryPoint {
    u32 field_00;
    u32 x_04;
    u32 y_08;
} ActorQueryPoint;

extern u8 data_020d4358[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_0200e9e0(void *sceneState);
extern void func_0200ea34(void *sceneState, u16 scanline);
extern void func_0201218c(void *object);
extern void Sound_Play(void *context, s32 argument, s32 soundId);
extern void func_0200cf00(void *object, s32 enabled, s32 argument);

#ifdef __cplusplus
}
#endif

/*
 * Advance the embedded state at offset 0x24, then update the optional object
 * stored at offset 0x2fb8. The virtual method always returns zero.
 */
s32 func_020072dc(GamePhaseRuntime *self)
{
    u8 *bytes = (u8 *)self;
    void *object;

    func_0200e9e0(bytes + 0x24);
    object = *(void **)(bytes + 0x2fb8);
    if (object != 0)
        func_0201218c(object);
    return 0;
}

/*
 * Forward the current DS vertical scanline to the embedded state at offset
 * 0x24. Reading 0x04000006 is a volatile hardware effect; returns zero.
 */
s32 func_02007308(GamePhaseRuntime *self)
{
    func_0200ea34((u8 *)self + 0x24, *(volatile u16 *)0x04000006);
    return 0;
}

/* Copy query coordinates and latch selection-query bit zero; returns zero. */
s32 GamePhaseRuntime_QueueSelectionQuery(GamePhaseRuntime *self,
                                         const void *query)
{
    u8 *bytes = (u8 *)self;
    ActorQuery_CopyCoordinates(bytes + 0x30a8, query);
    *(u32 *)(bytes + 0x30b8) |= 1;
    return 0;
}

/*
 * Copy query X/Y words +4/+8 unless source and destination are the same
 * record. No other query fields are consumed and no hardware is touched.
 */
void ActorQuery_CopyCoordinates(void *destination, const void *source)
{
    ActorQueryPoint *dst = (ActorQueryPoint *)destination;
    const ActorQueryPoint *src = (const ActorQueryPoint *)source;

    if (src != dst) {
        dst->x_04 = src->x_04;
        dst->y_08 = src->y_08;
    }
}

/* Copy query coordinates and latch until-handled bit one; returns zero. */
s32 GamePhaseRuntime_QueueQueryUntilHandled(GamePhaseRuntime *self,
                                            const void *query)
{
    u8 *bytes = (u8 *)self;
    ActorQuery_CopyCoordinates(bytes + 0x30a8, query);
    *(u32 *)(bytes + 0x30b8) |= 2;
    return 0;
}

/* Copy query coordinates and latch broadcast-query bit two; returns zero. */
s32 GamePhaseRuntime_QueueBroadcastQuery(GamePhaseRuntime *self,
                                         const void *query)
{
    u8 *bytes = (u8 *)self;
    ActorQuery_CopyCoordinates(bytes + 0x30a8, query);
    *(u32 *)(bytes + 0x30b8) |= 4;
    return 0;
}

/*
 * Handle event 100 by playing sound 123 and allocating/initializing a
 * 0x9c-byte tagged effect object. Other events have no effect; returns zero.
 */
s32 func_020073c4(GamePhaseRuntime *self, s32 event)
{
    void *effect;
    (void)self;

    if (event == 100) {
        Sound_Play(gSoundContext, 0, 123);
        effect = Heap_Alloc(0x9c, (const char *)data_020d4358, 4,
                            &gHeapContext);
        if (effect != 0)
            func_0200cf00(effect, 1, 0);
    }
    return 0;
}

/* No-op virtual method; it changes no state and returns zero. */
s32 func_02007420(GamePhaseRuntime *self)
{
    (void)self;
    return 0;
}

/* Second no-op virtual method; it changes no state and returns zero. */
s32 func_02007428(GamePhaseRuntime *self)
{
    (void)self;
    return 0;
}
