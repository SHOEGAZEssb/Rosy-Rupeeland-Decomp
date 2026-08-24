#include "tingle/types.h"

/* Overlay 18 scene construction and ordered teardown of graphics, UI, actor, and resource state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18[];
extern void *data_021052fc;
extern const s32 data_ov018_021ffc10[2];
extern const u32 data_ov018_021ffcf0[];
extern const u32 data_ov018_021ffd00[];
extern const u32 data_ov018_021ffd3c[];
extern const u8 data_ov018_021ffd50[];
extern const u8 data_ov018_021ffd58[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern void GameWork_SetFlag(void *, u32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern u32 genrand_int32(void);
extern void *GamePhaseState_GetConfiguration(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_ConfigureTextGridPriority(void *, s32, s32);
extern void func_02091b6c(void *);
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void PresentationList_DeleteAll(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void func_020b4554(void *, s32);
extern void *func_ov000_021fb6e0(void *);
extern void func_ov001_021fb7d4(void *);
extern void func_ov018_021fcefc(void *);
extern void *func_ov018_021fcf00(void *);
extern void func_ov018_021fcf40(void *, s32, s32, s32);
extern void func_ov018_021fd5d0(void *);
extern void func_ov018_021fd6c0(void *);
extern void func_ov018_021fd740(void *);
extern void func_ov018_021fdbd4(void *);
extern void func_ov018_021fe5ac(void *);
extern void func_ov018_021fe644(void *);
extern void *func_ov018_021ff330(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Install vtable data_ov018_021FFCF0 and clear words +4/+8. Returns state;
 * only caller-owned memory changes and no SDK or hardware effects occur.
 */
extern "C" void *func_ov018_021fd36c(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffcf0;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
    return state;
}

/*
 * Construct the scene and store caller context at +0x54. Initialize embedded
 * callback, manager, resource, UI, and PRNG objects; set GameWork flag 0x418;
 * allocate helper +0x58 and six-halfword descriptor +0x190; cache confirmed
 * values from global data_021052FC; and load resource sets 0x38/1/0x39,
 * 0x3298..0x329A, 0x4000..0x4002, and 0x1003/0x1001/0x1004. Create three
 * renderers and UI sprites +0xD0/+0xD4, configure manager resource 0x7007,
 * run camera/display setup, bind the global actor at +0x184, set display flag
 * bit 10, and install callback pair data_ov018_021FFC10. Returns state. Heap,
 * GameWork, PRNG, actor, graphics/resource, and UI state change; setup helpers
 * perform Nintendo DS display/MMIO writes.
 */
extern "C" void *func_ov018_021fcf68(void *state, void *context)
{
    void *descriptor;
    void *global;
    void *sprite;
    void *actor;
    void *actorData;

    SceneInputBase_Init(state);
    FIELD(const u32 *, state, 0) = data_ov018_021ffd3c;
    func_ov018_021fd36c((u8 *)state + 0x64);
    TitleCharacterResourceCollection_Init((u8 *)state + 0x70);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x94);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xa0);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xac);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xb8);
    func_020957bc((u8 *)state + 0xd8);
    func_02091b6c((u8 *)state + 0x1a8);
    func_ov018_021fcf00((u8 *)state + 0x3cc);
    FIELD(s32, state, 0x3dc) = 0;
    func_02091b6c((u8 *)state + 0x3e0);
    GameWork_SetFlag(gGameWork, 0x418);
    FIELD(void *, state, 0x54) = context;

    descriptor = Heap_Alloc(0x2c, data_ov018_021ffd50, 4, gHeapContext);
    if (descriptor != 0)
        descriptor = func_ov018_021ff330(descriptor, 0x80);
    FIELD(void *, state, 0x58) = descriptor;
    FIELD(s32, state, 0x3c8) = 0;
    FIELD(void *, state, 0x418) = 0;
    FIELD(s32, state, 0x68) = 0;
    FIELD(s32, state, 0x6c) = 0;
    FIELD(u32, state, 0x3dc) = genrand_int32();
    FIELD(s32, state, 0x404) = 0;
    FIELD(s32, state, 0x408) = 0;
    FIELD(s32, state, 0x40c) = 0;
    FIELD(s32, state, 0x410) = 0;
    FIELD(s32, state, 0x414) = 0;

    descriptor = Heap_Alloc(0x24, data_ov018_021ffd58, 4, gHeapContext);
    if (descriptor != 0)
        descriptor = func_ov000_021fb6e0(descriptor);
    FIELD(void *, state, 0x190) = descriptor;
    FIELD(u16, descriptor, 4) = 0x3f1b;
    FIELD(u16, descriptor, 6) = 0x2655;
    FIELD(u16, descriptor, 8) = 0x2042;
    FIELD(u16, descriptor, 0xa) = 0x6108;
    FIELD(u16, descriptor, 0xc) = 0x205f;
    FIELD(u16, descriptor, 0xe) = 0x2218;
    func_020b4554((u8 *)descriptor + 4, 0x20);

    global = data_021052fc;
    actorData = GamePhaseState_GetConfiguration((u8 *)global + 0x24);
    FIELD(s32, state, 0x198) = FIELD(s32, actorData, 0);
    actorData = GamePhaseState_GetConfiguration((u8 *)global + 0x24);
    FIELD(s32, state, 0x19c) = FIELD(s8, actorData, 0x4d);
    actorData = FIELD(void *, (u8 *)global + 0x3000, 0xbc);
    FIELD(s32, state, 0x1a0) = FIELD(s8, actorData, 0x4e);
    FIELD(s32, state, 0x1a4) = FIELD(s8, actorData, 0x4f);
    FIELD(s32, state, 0x400) = 0;
    func_ov018_021fe644(state);

    func_02071ee0((u8 *)state + 0x94, data_020f4e18[0], 0x38, 1, 0x39);
    func_02071ee0((u8 *)state + 0xa0, data_020f4e18[0],
                  0x3298, 0x3299, 0x329a);
    func_02071ee0((u8 *)state + 0xac, data_020f4e18[0],
                  0x4000, 0x4001, 0x4002);
    func_02071ee0((u8 *)state + 0xb8, data_020f4e18[0],
                  0x1003, 0x1001, 0x1004);
    FIELD(void *, state, 0xc4) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    FIELD(void *, state, 0xc8) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, state, 0xcc) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xc8),
                           (u8 *)state + 0x94, 1);
    func_020957f0((u8 *)state + 0xd8, sprite, 6, 0, 0);
    func_02095820((u8 *)state + 0xd8, 0xe8, 0xb4);
    func_02095940((u8 *)state + 0xd8);
    func_02092814((u8 *)state + 0x70, 0x7007);
    func_ov018_021fd740(state);
    func_ov018_021fd5d0(state);
    func_ov018_021fd6c0(state);

    FIELD(s32, state, 0x188) = 0;
    actor = FIELD(void *, (u8 *)global + 0x2000, 0xea4);
    FIELD(void *, state, 0x184) = actor;
    {
        typedef void *(*ActorMethod)(void *, s32);
        ActorMethod method = (ActorMethod)FIELD(void **, actor, 0)[0x54 / 4];
        actorData = FIELD(void *, actor, 0x54);
        method(actor, 0);
    }

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xc4),
                           (u8 *)state + 0xb8, 2);
    FIELD(void *, state, 0xd0) = sprite;
    GraphicsSpriteState_ApplyRenderConfig(sprite, 0x21, FIELD(s16, actorData, 0x2c),
                  FIELD(s16, actorData, 0x2e), FIELD(u8, actorData, 0x3a),
                  FIELD(u16, actorData, 0x28), 0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xc8),
                           (u8 *)state + 0xa0, 2);
    FIELD(void *, state, 0xd4) = sprite;
    GraphicsSpriteState_ApplyRenderConfig(sprite, 0x18, 0xec, 0xac, 0, 0, 6);
    FIELD(s32, state, 0x18c) = 0;
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov018_021fcf40(state, data_ov018_021ffc10[0],
                        data_ov018_021ffc10[1], 0);
    return state;
}

/* Invoke virtual destructor slot +4 when object is non-null; ownership effects depend on its concrete type. */
static void destroyVirtual(void *object)
{
    if (object != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, object, 0)[1](object);
    }
}

/*
 * Shared ordered scene teardown: restore vtable data_ov018_021FFD3C, clear
 * display bit 10 and sub-engine brightness, stop scene output, destroy optional
 * +0x418 and callback +0x3CC, release three renderers, clear debug-font state,
 * detach actor +0x184, destroy/free descriptor +0x190, run transition cleanup,
 * clear GameWork flag 0x418, then tear down embedded UI/resources and manager.
 * Returns void. Heap, GameWork, actor, graphics, and resource state change;
 * sub-display MMIO 0x04001050 is written directly.
 */
static void destroyScene(void *state)
{
    void *descriptor;

    FIELD(const u32 *, state, 0) = data_ov018_021ffd3c;
    FIELD(u32, state, 0x20) &= ~0x400U;
    *(volatile u16 *)0x04001050 = 0;
    func_ov018_021fdbd4(state);
    destroyVirtual(FIELD(void *, state, 0x418));
    PresentationList_DeleteAll((u8 *)state + 0x3cc);
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0xc4));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0xcc));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0xc8));
    GraphicsSpriteRenderer_ConfigureTextGridPriority(gDebugFont, 0, 0x10);
    {
        void *actor = FIELD(void *, state, 0x184);
        typedef void (*ActorMethod)(void *, s32);
        ActorMethod method = (ActorMethod)FIELD(void **, actor, 0)[0x54 / 4];
        method(actor, 1);
    }
    descriptor = FIELD(void *, state, 0x190);
    if (descriptor != 0) {
        func_ov001_021fb7d4(descriptor);
        Heap_Free(descriptor);
    }
    func_ov018_021fe5ac(state);
    GameWork_ClearFlag(gGameWork, 0x418);
    FIELD(const u32 *, state, 0x3cc) = data_ov018_021ffd00;
    PresentationList_DeleteAll((u8 *)state + 0x3cc);
    func_ov018_021fcefc((u8 *)state + 0xd8);
    AnimationResourceState_Destroy((u8 *)state + 0xb8);
    AnimationResourceState_Destroy((u8 *)state + 0xac);
    AnimationResourceState_Destroy((u8 *)state + 0xa0);
    AnimationResourceState_Destroy((u8 *)state + 0x94);
    func_020927b8((u8 *)state + 0x70);
}

/*
 * Run the complete ordered teardown documented by destroyScene while retaining
 * the scene allocation, then return state. All documented SDK, resource,
 * GameWork, heap-child, and sub-display MMIO effects occur.
 */
extern "C" void *func_ov018_021fd388(void *state)
{
    destroyScene(state);
    return state;
}

/*
 * Run the complete ordered teardown documented by destroyScene, free the scene
 * allocation, and return its former address. The returned pointer is invalid;
 * all child/resource and sub-display MMIO effects occur before the free.
 */
extern "C" void *func_ov018_021fd4a8(void *state)
{
    destroyScene(state);
    Heap_Free(state);
    return state;
}
