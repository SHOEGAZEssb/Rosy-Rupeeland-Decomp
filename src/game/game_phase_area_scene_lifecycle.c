#include "tingle/game_phase_area_scene.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Construct, start, and destroy the area-specific sub-screen scene renderer. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5680;
extern const char gGamePhaseAreaSceneRendererAllocationTag[];
extern void *gGamePhaseRuntime;
extern void ActorCollection_Init(void *renderer);
extern void ActorCollection_CreateSpriteGroupForDisplayMode(void *renderer, s32 value);
extern void ActorCollection_SetActorScale(void *renderer, s32 scale);
extern void *ActorCollection_FindActorByTypeAndId(void *renderer, s32 first, s32 second);
extern void ActorCollection_UnregisterAndDestroyAllActors(void *renderer);
extern void ActorCollection_Destructor(void *renderer);
extern void OverlaySlot_Init(void *state);
extern void OverlaySlot_Destroy(void *state);
extern void OverlaySlot_LoadOverlay(void *state, u32 value);
extern void *SubDualLayerResourceRenderer_Init(void *self);
extern void *SubDualLayerResourceRendererAlt_Init(void *self);
extern void *SubDualLayerResourceRendererSwapped_Init(void *self);
extern void *SubThreeLayerResourceRenderer_Init(void *self);
extern void *DualLayerTileRendererBase_Init(void *self);
extern void DualLayerTileRendererBase_SetLayoutParameters(void *self, s32 a, s32 b, s32 c);
extern void DualLayerTileRenderer_LoadEmbeddedRendererEntry(void *self, const void *config);
extern void RuntimePresentationManager_DetachEffectsByKey(
    void *manager, s32 effectKey);
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
    void *renderer = Heap_Alloc(0x187c, gGamePhaseAreaSceneRendererAllocationTag, 4, &gHeapContext);
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
 * generic renderer and resource from config flags bits 18-21. All renderer
 * variants receive their resource through virtual method 0x14. BG0/BG1
 * priorities are set to 1/2 except for area 93, and mode 0/3 renderers receive
 * config subRendererConfig. The routine also clears sub-engine blending,
 * rolls GameWork halfwords 0x242/0x244, clears pointer bank 1 and flag 0x3e9,
 * and returns self.
 * Hardware effects include sub DISPCNT, BGxCNT, VRAM-bank, graphics-mode, and
 * BLDCNT writes. Offsets and flag slices remain address-derived.
 */
GamePhaseAreaScene *GamePhaseAreaScene_Init(GamePhaseAreaScene *self,
                                            GamePhaseAreaSceneConfig *config,
                                            s32 createSubRenderer)
{
    u32 mode;
    self->vtable = data_020d5680;
    self->subRenderer = 0;
    ActorCollection_Init(self->actorCollectionStorage);
    self->stateFlags =
        (self->stateFlags & ~0x1f) | 0x3f;
    self->config = config;
    OverlaySlot_Init(self->overlaySlotStorage);
    self->secondaryActor = 0;
    VecFx32Object_Init(&self->position);
    self->overlayObject = 0;
    self->regionEffectHandle = 0;

    if (createSubRenderer) {
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
        mode = (config->flags >> 18) & 3;
        if (mode != 1) {
            u32 planes = (*subDisplay & 0x1f00) >> 8;
            *subDisplay = (*subDisplay & ~0x1f00) |
                          ((planes & ~0x0c) << 8);
        }
        GX_SetBankForSubBG(4);
        func_020aea7c(0x80);
        if (config->areaId == 2 || config->areaId == 199) {
            GXS_SetGraphicsMode(0);
            self->subRenderer = createRenderer(SubDualLayerResourceRenderer_Init);
            loadRenderer(self->subRenderer, config->resource08, 0);
        } else if (config->areaId == 3) {
            GXS_SetGraphicsMode(0);
            self->subRenderer = createRenderer(SubDualLayerResourceRendererAlt_Init);
            loadRenderer(self->subRenderer, config->resource08, 0);
        } else if (config->areaId == 4) {
            GXS_SetGraphicsMode(0);
            self->subRenderer = createRenderer(SubDualLayerResourceRendererSwapped_Init);
            loadRenderer(self->subRenderer, config->resource08, 0);
        } else if (config->areaId == 93) {
            GXS_SetGraphicsMode(0);
            self->subRenderer = createRenderer(SubThreeLayerResourceRenderer_Init);
            loadRenderer(self->subRenderer, config->resource08, 0);
            goto rendererConfigured;
        } else if (mode != 1) {
            void *resource = mode == 3 ? config->resource04 : config->resource08;
            u32 variant = (config->flags >> 20) & 3;
            if (variant == 0 || variant == 1) {
                GXS_SetGraphicsMode(0);
                self->subRenderer = createRenderer(DualLayerTileRendererBase_Init);
                DualLayerTileRendererBase_SetLayoutParameters(self->subRenderer, 4, 28, 30);
                loadRenderer(self->subRenderer, resource,
                             variant == 1 ? 2 : 0);
            }
        }
        *subBg0 = (u16)((*subBg0 & ~3) | 1);
        subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
rendererConfigured:
        if (mode == 0 || mode == 3)
            DualLayerTileRenderer_LoadEmbeddedRendererEntry(self->subRenderer, config->subRendererConfig);
        *(volatile u16 *)0x04001050 = 0;
    }

    *(s16 *)((u8 *)gGameWork + 0x242) =
        *(s16 *)((u8 *)gGameWork + 0x244);
    *(s16 *)((u8 *)gGameWork + 0x244) = (s16)config->areaId;
    GameWork_ClearPointerBank(gGameWork, 1);
    GameWork_ClearFlag(gGameWork, 0x3e9);
    return self;
}

/*
 * Configure embedded rendering mode 2 and scale 0x1000, copy config overlayId
 * into overlaySlotStorage, invoke config loadCallback with zero, create a 3/3
 * renderer handle into secondaryActor, and return no value.
 */
void GamePhaseAreaScene_Start(GamePhaseAreaScene *self)
{
    ActorCollection_CreateSpriteGroupForDisplayMode(self->actorCollectionStorage, 2);
    ActorCollection_SetActorScale(self->actorCollectionStorage, 0x1000);
    OverlaySlot_LoadOverlay(self->overlaySlotStorage, self->config->overlayId);
    self->config->loadCallback(0);
    self->secondaryActor = ActorCollection_FindActorByTypeAndId(
        self->actorCollectionStorage, 3, 3);
}

/*
 * Unregister phase slot 0x37, destroy the embedded renderer, delete the
 * optional sub-renderer virtually, then destroy the vector, state, and base
 * renderer objects. Returns self without freeing its outer storage.
 */
GamePhaseAreaScene *GamePhaseAreaScene_Destroy(GamePhaseAreaScene *self)
{
    self->vtable = data_020d5680;
    RuntimePresentationManager_DetachEffectsByKey((u8 *)gGamePhaseRuntime + 0x2f7c, 0x37);
    ActorCollection_UnregisterAndDestroyAllActors(self->actorCollectionStorage);
    if (self->subRenderer)
        ((void (*)(void *))(*(void ***)self->subRenderer)[1])(
            self->subRenderer);
    VecFx32Object_Destroy(&self->position);
    OverlaySlot_Destroy(self->overlaySlotStorage);
    ActorCollection_Destructor(self->actorCollectionStorage);
    return self;
}
