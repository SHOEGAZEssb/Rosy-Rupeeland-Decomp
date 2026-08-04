#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/*
 * Short virtual methods for GamePhaseRuntime. They update its embedded scene
 * state, latch three independently requested actions, and handle event 100.
 */

typedef struct RuntimeRequestSource {
    u32 field_00;
    u32 field_04;
    u32 field_08;
} RuntimeRequestSource;

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

/* Copy a request and latch request bit 0 at runtime offset 0x30b8; returns zero. */
s32 func_02007328(GamePhaseRuntime *self, const void *source)
{
    u8 *bytes = (u8 *)self;
    func_02007354(bytes + 0x30a8, source);
    *(u32 *)(bytes + 0x30b8) |= 1;
    return 0;
}

/*
 * Copy source offsets 4 and 8 into the request record at runtime offset
 * 0x30a8 unless it is the same record. No other source fields are consumed.
 */
void func_02007354(void *destination, const void *source)
{
    RuntimeRequestSource *dst = (RuntimeRequestSource *)destination;
    const RuntimeRequestSource *src = (const RuntimeRequestSource *)source;

    if (src != dst) {
        dst->field_04 = src->field_04;
        dst->field_08 = src->field_08;
    }
}

/* Copy a request and latch request bit 1 at runtime offset 0x30b8; returns zero. */
s32 func_0200736c(GamePhaseRuntime *self, const void *source)
{
    u8 *bytes = (u8 *)self;
    func_02007354(bytes + 0x30a8, source);
    *(u32 *)(bytes + 0x30b8) |= 2;
    return 0;
}

/* Copy a request and latch request bit 2 at runtime offset 0x30b8; returns zero. */
s32 func_02007398(GamePhaseRuntime *self, const void *source)
{
    u8 *bytes = (u8 *)self;
    func_02007354(bytes + 0x30a8, source);
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
