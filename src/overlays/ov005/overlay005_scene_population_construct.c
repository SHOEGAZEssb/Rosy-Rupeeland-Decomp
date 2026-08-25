#include "tingle/types.h"

/*
 * Overlay 5 scene-population construction. This recovered routine constructs
 * resource arrays, animations, an embedded counter, and table-driven draw
 * objects used by a multi-item scene.
 */

typedef struct Overlay005ScenePopulation {
    u8 bytes[0x15c];
} Overlay005ScenePopulation;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *gGameWork;
extern const u16 data_ov005_021fca28[];
extern const u8 data_020d780c[];
extern const s32 data_ov005_021fc8d8[];
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_Destroy(void *resource);
extern void *__construct_array(void *array, s32 count, s32 elementSize,
                               void (*constructor)(void *),
                               void (*destructor)(void *));
extern void TitleInterpolatedValue_Init(void *animation);
extern void *func_ov005_021fb82c(void *state);
extern u32 genrand_int32(void);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *context, void *resource, s32 mode);
extern void GraphicsSpriteState_ApplyRenderConfig(void *drawObject, s32 mode, s32 x, s32 y,
                          s32 first, s32 second, s32 third);
extern void TitleInterpolatedValue_Configure(void *animation, s32 mode, s32 value, s32 scale,
                          s32 duration);
#ifdef __cplusplus
}
#endif

/* Access one 0x34-byte coordinate record without assigning it a guessed type. */
static s16 overlay005_record_coordinate(s32 index, s32 offset)
{
    return *(const s16 *)(data_020d780c + index * 0x34 + offset);
}

/*
 * Construct standalone resources at +0x08/+0x14, eleven 0x0C-byte resources
 * at +0x20, three at +0xA4, animations at +0x110/+0x12C, and the counter at
 * +0x148. Seed +0x10C, retain owner at +0x00, and cache its context at +0x04.
 * Bind the confirmed resource-ID triplets 0x3343/0x332A/0x3344,
 * 0x4003..0x4005, 0x3384..0x3386, 0x3387..0x3389, and 0x338A..0x338C.
 * Cache signed game-work halfwords +0x12E/+0x1CE at +0x104/+0x108.
 *
 * For each of 11 table entries, bind three halfword resource IDs from
 * data_ov005_021fca28, create a mode-2 draw object at +0xC8, and place it from
 * the corresponding data_020d780c record with trailing values 1/index/4.
 * Indices no greater than +0x108 receive halfword flag 2 at draw offset +0x2A;
 * later indices up to +0x104 optionally create a second mode-1 draw when
 * createMarkers is nonzero, using the table's fourth halfword and trailing
 * values 1/index/0. Create three more mode-2 draws at +0xF4 from the signed
 * coordinate pairs in data_ov005_021fc8d8 with trailing values 1/0/2. Clear
 * +0x158, start animation +0x110 in mode 2/value 0/scale 0xA000/duration 30,
 * and return state. Resource ownership and exact visual identities are still
 * unknown; array sizes, IDs, coordinates, and draw arguments are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005ScenePopulation *
func_ov005_021fb86c(Overlay005ScenePopulation *state, void *owner,
                     s32 createMarkers)
{
    s32 index;
    void *context;

    AnimationResourceState_InitEmbedded((u8 *)state + 0x08);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x14);
    __construct_array((u8 *)state + 0x20, 11, 0x0c, AnimationResourceState_InitEmbedded,
                      AnimationResourceState_Destroy);
    __construct_array((u8 *)state + 0xa4, 3, 0x0c, AnimationResourceState_InitEmbedded,
                      AnimationResourceState_Destroy);
    FIELD(u32, state, 0x10c) = 0;
    TitleInterpolatedValue_Init((u8 *)state + 0x110);
    TitleInterpolatedValue_Init((u8 *)state + 0x12c);
    func_ov005_021fb82c((u8 *)state + 0x148);
    FIELD(u32, state, 0x10c) = genrand_int32();
    FIELD(void *, state, 0x000) = owner;
    context = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(void *, state, 0x004) = context;

    AnimationResourceState_ReplaceResources((u8 *)state + 0x08, data_020f4e18, 0x3343, 0x332a,
                  0x3344);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x14, data_020f4e18, 0x4003, 0x4004,
                  0x4005);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xa4, data_020f4e18, 0x3384, 0x3385,
                  0x3386);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xb0, data_020f4e18, 0x3387, 0x3388,
                  0x3389);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xbc, data_020f4e18, 0x338a, 0x338b,
                  0x338c);

    FIELD(s32, state, 0x104) = FIELD(s16, gGameWork, 0x12e);
    FIELD(s32, state, 0x108) = FIELD(s16, gGameWork, 0x1ce);
    FIELD(s32, state, 0x100) = 0;

    for (index = 0; index < 11; index++) {
        const u16 *entry = &data_ov005_021fca28[index * 4];
        void *resource = (u8 *)state + 0x20 + index * 0x0c;
        void *draw;
        s32 x = overlay005_record_coordinate(index, 0x18);
        s32 y = overlay005_record_coordinate(index, 0x1a);

        AnimationResourceState_ReplaceResources(resource, data_020f4e18, entry[0], entry[1], entry[2]);
        draw = GraphicsSpriteGroup_CreateStateFromSource(context, resource, 2);
        FIELD(void *, state, 0x0c8 + index * 4) = draw;
        GraphicsSpriteState_ApplyRenderConfig(draw, 0, x, y, 1, index, 4);

        if (index <= FIELD(s32, state, 0x108)) {
            FIELD(u16, draw, 0x2a) = 2;
        } else if (index <= FIELD(s32, state, 0x104) && createMarkers) {
            draw = GraphicsSpriteGroup_CreateStateFromSource(context, (u8 *)state + 0x08, 1);
            GraphicsSpriteState_ApplyRenderConfig(draw, entry[3], x, y, 1, index, 0);
        }
    }

    for (index = 0; index < 3; index++) {
        void *resource = (u8 *)state + 0xa4 + index * 0x0c;
        void *draw = GraphicsSpriteGroup_CreateStateFromSource(context, resource, 2);

        FIELD(void *, state, 0x0f4 + index * 4) = draw;
        GraphicsSpriteState_ApplyRenderConfig(draw, 0, data_ov005_021fc8d8[index * 2],
                      data_ov005_021fc8d8[index * 2 + 1], 1, 0, 2);
    }

    FIELD(s32, state, 0x158) = 0;
    TitleInterpolatedValue_Configure((u8 *)state + 0x110, 2, 0, 0xa000, 30);
    return state;
}

#undef FIELD
