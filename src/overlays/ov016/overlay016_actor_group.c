#include "tingle/types.h"

/* Overlay 16 actor-group construction, teardown, layout, and value aggregation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u32 data_ov016_02201394[];
extern const u32 data_ov016_02201520[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void PresentationList_DeleteAll(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_ov016_021fe0d4(void *);
extern void Overlay016SmallBase_Init(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct an actor-group view for the selected table index. Initialize two
 * resources at +0/+0x0C, actor record +0x20, and list base +0xD0. Store five
 * times index+1 at +0xE0, the confirmed image table entry at +0xE4, acquire a
 * child from the global graphics manager, load resource triples 0x0D-0x0F and
 * 0x19-0x1B, bind the actor record to a new sprite, center and stop it, then
 * create sprite +0x1C at (0x26,0xAA). Return state. SDK graphics and actor state
 * changes; no direct MMIO.
 */
extern "C" void *func_ov016_021fe118(void *state, s32 index)
{
    void *sprite;

    AnimationResourceState_InitEmbedded(state);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xc);
    func_020957bc((u8 *)state + 0x20);
    Overlay016SmallBase_Init((u8 *)state + 0xd0);
    FIELD(s32, state, 0xe0) = (index + 1) * 5;
    FIELD(u32, state, 0xe4) = data_ov016_02201394[index];
    FIELD(void *, state, 0xcc) = 0;
    FIELD(void *, state, 0x18) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    func_02071ee0(state, data_020f4e18, 0xd, 0xe, 0xf);
    func_02071ee0((u8 *)state + 0xc, data_020f4e18, 0x19, 0x1a, 0x1b);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x18), state, 1);
    func_020957f0((u8 *)state + 0x20, sprite, 1, 1, 0);
    func_02095820((u8 *)state + 0x20, 0x80, 0xaa);
    func_02095940((u8 *)state + 0x20);
    FIELD(void *, state, 0x1c) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x18),
                                               (u8 *)state + 0xc, 2);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0x1c), FIELD(u32, state, 0xe4),
                  0x26, 0xaa, 1, 0, 0);
    return state;
}

/*
 * Tear down list base +0xD0, delete optional object +0xCC through vtable slot
 * +4, destroy child +0x18, restore and tear down the small base at +0xD0, invoke
 * the recovered no-op callback for actor +0x20, and destroy resources +0x0C/+0.
 * Return state. Heap/SDK objects may be released; no direct hardware effects.
 */
extern "C" void *func_ov016_021fe24c(void *state)
{
    typedef void (*DeleteFunction)(void *);
    void *object;

    PresentationList_DeleteAll((u8 *)state + 0xd0);
    object = FIELD(void *, state, 0xcc);
    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x18));
    FIELD(const u32 *, state, 0xd0) = data_ov016_02201520;
    PresentationList_DeleteAll((u8 *)state + 0xd0);
    func_ov016_021fe0d4((u8 *)state + 0x20);
    AnimationResourceState_Destroy((u8 *)state + 0xc);
    AnimationResourceState_Destroy(state);
    return state;
}

/*
 * Evenly distribute every actor linked from +0xD4 across a fixed-point span.
 * Count +0xDC determines spacing returned by func_02091A70; horizontal positions
 * are centered around 0x80000, vertical positions alternate 0x84000/0x8C000,
 * and each actor receives +0x7C=0x10 and +0x80=0. Return void; actor transforms
 * change through SDK calls, with no direct MMIO.
 */
extern "C" void func_ov016_021fe2b0(void *state)
{
    s32 count = FIELD(s32, state, 0xdc);
    s32 step;
    s32 x;
    s32 index = 0;
    void *actor;

    if (count == 0) {
        return;
    }
    step = Presentation_InterpolateLinear(0x20000, 0x10000, 0xf, count);
    x = 0x80000 - ((count - 1) * step) / 2;
    for (actor = FIELD(void *, state, 0xd4); actor != 0;
         actor = FIELD(void *, actor, 8), index++, x += step) {
        PresentationScalar_TransitionTo((u8 *)actor + 0xc, 2, x);
        PresentationScalar_TransitionTo((u8 *)actor + 0x1c, 2,
                      (index & 1) != 0 ? 0x8c000 : 0x84000);
        FIELD(s32, actor, 0x7c) = 0x10;
        FIELD(s32, actor, 0x80) = 0;
    }
}

/*
 * Sum halfword +0x2C from every 0x24-byte entry in the table wrapped by argument
 * two, using its count at +0x100, and return the total. Argument one is unused;
 * inputs are read only and there are no SDK or hardware effects.
 */
extern "C" s32 func_ov016_021fe358(void *unused, void *wrapper)
{
    void *table = FIELD(void *, wrapper, 0);
    s32 count = FIELD(s32, table, 0x100);
    s32 total = 0;
    s32 i;

    (void)unused;
    for (i = 0; i < count; i++) {
        total += FIELD(u16, (u8 *)table + i * 0x24, 0x2c);
    }
    return total;
}
