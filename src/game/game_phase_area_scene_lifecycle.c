#include "tingle/game_phase_area_scene.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Construct, start, and destroy the area-specific sub-screen scene renderer. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5680;
extern const char data_020d5688[];
extern void *data_021052fc;
extern void ActorCollection_Init(void *renderer);
extern void ActorCollection_SetSpriteMode(void *renderer, s32 value);
extern void func_02030b18(void *renderer, s32 value);
extern void *ActorCollection_FindActorByTypeAndId(void *renderer, s32 first, s32 second);
extern void ActorCollection_UnregisterAndDestroyAllActors(void *renderer);
extern void ActorCollection_Destructor(void *renderer);
extern void func_02006268(void *state);
extern void func_02006280(void *state);
extern void func_020062a0(void *state, u32 value);
extern void *func_0202bc18(void *self);
extern void *func_0202c0b8(void *self);
extern void *func_0202c4f4(void *self);
extern void *func_0202c8a8(void *self);
extern void *func_02029218(void *self);
extern void func_02029360(void *self, s32 a, s32 b, s32 c);
extern void func_02029ca4(void *self, const void *config);
extern void func_0201e1b0(void *state, s32 value);
extern void GX_SetBankForSubBG(s32 bank);
extern void GXS_SetGraphicsMode(s32 mode);
extern void func_020aea7c(s32 value);
#ifdef __cplusplus
}
#endif

typedef void *(*AreaRendererCtor)(void *allocation);
typedef void (*AreaRendererLoad)(void *self, void *resource,
                                 s32 first, s32 second);

static void *createRenderer(AreaRendererCtor constructor)
{
    void *renderer = Heap_Alloc(0x187c, data_020d5688, 4, &gHeapContext);
    return renderer ? constructor(renderer) : 0;
}

static void loadRenderer(void *renderer, void *resource, s32 second)
{
    AreaRendererLoad load =
        *(AreaRendererLoad *)(*(u8 **)renderer + 0x14);
    load(renderer, resource, 2, second);
}

/*
 * Initialize the embedded renderer/state/vector objects and retain config. If
 * createRenderer is nonzero, configure sub-BG VRAM and choose one of four
 * special renderers for area IDs 2/199, 3, 4, or 93; otherwise select the
 * generic renderer and resource from config flags40 bits 18-21. All renderer
 * variants receive their resource through virtual method 0x14. BG0/BG1
 * priorities are set to 1/2 except for area 93, and mode 0/3 renderers receive
 * config field34. The routine also clears sub-engine blending, rolls GameWork
 * halfwords 0x242/0x244, clears pointer bank 1 and flag 0x3e9, and returns self.
 * Hardware effects include sub DISPCNT, BGxCNT, VRAM-bank, graphics-mode, and
 * BLDCNT writes. Offsets and flag slices remain address-derived.
 */
GamePhaseAreaScene *func_02011a5c(GamePhaseAreaScene *self,
                                  GamePhaseAreaSceneConfig *config,
                                  s32 createSubRenderer)
{
    u32 mode;
    self->vtable = data_020d5680;
    self->subRenderer_04 = 0;
    ActorCollection_Init(self->renderer_08);
    self->rendererFlags_2ea8 =
        (self->rendererFlags_2ea8 & ~0x1f) | 0x3f;
    self->config_2eac = config;
    func_02006268(self->state_2eb0);
    self->field_2ebc = 0;
    func_02004fe0(&self->position_2ec0);
    self->field_2ed0 = 0;
    self->field_2ed4 = 0;

    if (createSubRenderer) {
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
        mode = (config->flags40 >> 18) & 3;
        if (mode != 1) {
            u32 planes = (*subDisplay & 0x1f00) >> 8;
            *subDisplay = (*subDisplay & ~0x1f00) |
                          ((planes & ~0x0c) << 8);
        }
        GX_SetBankForSubBG(4);
        func_020aea7c(0x80);
        if (config->areaId_00 == 2 || config->areaId_00 == 199) {
            GXS_SetGraphicsMode(0);
            self->subRenderer_04 = createRenderer(func_0202bc18);
            loadRenderer(self->subRenderer_04, config->resource08, 0);
        } else if (config->areaId_00 == 3) {
            GXS_SetGraphicsMode(0);
            self->subRenderer_04 = createRenderer(func_0202c0b8);
            loadRenderer(self->subRenderer_04, config->resource08, 0);
        } else if (config->areaId_00 == 4) {
            GXS_SetGraphicsMode(0);
            self->subRenderer_04 = createRenderer(func_0202c4f4);
            loadRenderer(self->subRenderer_04, config->resource08, 0);
        } else if (config->areaId_00 == 93) {
            GXS_SetGraphicsMode(0);
            self->subRenderer_04 = createRenderer(func_0202c8a8);
            loadRenderer(self->subRenderer_04, config->resource08, 0);
            goto rendererConfigured;
        } else if (mode != 1) {
            void *resource = mode == 3 ? config->resource04 : config->resource08;
            u32 variant = (config->flags40 >> 20) & 3;
            if (variant == 0 || variant == 1) {
                GXS_SetGraphicsMode(0);
                self->subRenderer_04 = createRenderer(func_02029218);
                func_02029360(self->subRenderer_04, 4, 28, 30);
                loadRenderer(self->subRenderer_04, resource,
                             variant == 1 ? 2 : 0);
            }
        }
        *subBg0 = (u16)((*subBg0 & ~3) | 1);
        subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
rendererConfigured:
        if (mode == 0 || mode == 3)
            func_02029ca4(self->subRenderer_04, config->field34);
        *(volatile u16 *)0x04001050 = 0;
    }

    *(s16 *)((u8 *)gGameWork + 0x242) =
        *(s16 *)((u8 *)gGameWork + 0x244);
    *(s16 *)((u8 *)gGameWork + 0x244) = (s16)config->areaId_00;
    GameWork_ClearPointerBank(gGameWork, 1);
    GameWork_ClearFlag(gGameWork, 0x3e9);
    return self;
}

/*
 * Configure embedded rendering mode 2 and scale 0x1000, copy config field20
 * into state_2eb0, invoke config callback28 with zero, create a 3/3 renderer
 * handle into field_2ebc, and return no value.
 */
void func_02011ebc(GamePhaseAreaScene *self)
{
    ActorCollection_SetSpriteMode(self->renderer_08, 2);
    func_02030b18(self->renderer_08, 0x1000);
    func_020062a0(self->state_2eb0, self->config_2eac->field20);
    self->config_2eac->callback28(0);
    self->field_2ebc = ActorCollection_FindActorByTypeAndId(self->renderer_08, 3, 3);
}

/*
 * Unregister phase slot 0x37, destroy the embedded renderer, delete the
 * optional sub-renderer virtually, then destroy the vector, state, and base
 * renderer objects. Returns self without freeing its outer storage.
 */
GamePhaseAreaScene *func_02011f24(GamePhaseAreaScene *self)
{
    self->vtable = data_020d5680;
    func_0201e1b0((u8 *)data_021052fc + 0x2f7c, 0x37);
    ActorCollection_UnregisterAndDestroyAllActors(self->renderer_08);
    if (self->subRenderer_04)
        ((void (*)(void *))(*(void ***)self->subRenderer_04)[1])(
            self->subRenderer_04);
    func_02005058(&self->position_2ec0);
    func_02006280(self->state_2eb0);
    ActorCollection_Destructor(self->renderer_08);
    return self;
}
