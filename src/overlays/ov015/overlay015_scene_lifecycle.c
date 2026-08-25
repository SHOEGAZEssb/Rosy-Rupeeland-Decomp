#include "tingle/types.h"

/*
 * Overlay 15 controller lifecycle. The recovered object owns resource handles,
 * three 0xAC-byte records, two presentations, a timer, and optional sound mode.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_ov015_021fec74[];
extern const char data_ov015_021fec88[];
extern const char data_ov015_021fec90[];
extern const s32 data_ov015_021fec48[];
extern void *gDebugFont;
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern void *gSoundContext;
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *); extern void AnimationResourceState_InitEmbedded(void *); extern void AnimationResourceState_Destroy(void *);
extern void TitleCharacterResourceCollection_Init(void *); extern void TitleCharacterResourceCollection_Destroy(void *); extern void TitleScreenResourceCollection_Init(void *); extern void TitleScreenResourceCollection_Destroy(void *);
extern void SpriteMotionController_Init(void *); extern void TitleScreenResourceCollection_Append(void *,s32); extern void TitleCharacterResourceCollection_Append(void *,s32);
extern void *Heap_Alloc(u32,const char *,s32,void *); extern void Heap_Free(void *);
extern void *func_ov001_021fb6f8(void *,void *); extern void func_ov001_021fb7d4(void *);
extern void *Overlay001_Grid_Init(void *,void *); extern void InventoryRecordCollection_SortAlternate(void *,s32);
extern void AnimationResourceState_ReplaceResources(void *,void *,s32,s32,s32); extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *,void *,s32); extern void SpriteMotionController_BindSprite(void *,void *,s32,s32,s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *,s32,s32,s32,s32,s32,s32); extern void func_020afd0c(void *,s32,s32,s32,s32);
extern void Sound_LoadGroup(void *,s32); extern void Sound_ReleaseGroup(void *,s32); extern void GraphicsSpriteGroup_Destroy(void *);
extern void Overlay015_ClearValueTriple(void *); extern void func_ov015_021fce14(void *); extern void func_ov015_021fce30(void *,s32,s32,s32);
extern void Overlay015_CopyValueTriple(void *,const void *); extern void Overlay015_SetupGraphics(void *);
extern void Overlay015_StopRecords(void *); extern void func_ov015_021fd8a8(void *,s32); extern void Overlay015_LayoutRecords(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay015Destructor)(void *);

/*
 * Construct state in caller storage from optional three-word parameters and
 * sound-mode argument three, returning state. Initialize base/resource members
 * +0x58/+0x64/+0x74/+0x98, parameter +0xE0, and three 0xAC-byte records at
 * +0xFC; perform graphics setup; register resource IDs 0x8010/0x8011/0x800B
 * and 0x7001/0x7005/0x7000; allocate presentations +0xF4/+0xDC; and, when sound
 * mode is enabled, scan subordinate entries to propagate confirmed flags and
 * choose an entry for +0xE0. Configure the resource handles, acquire manager
 * +0x54, bind three records, initialize record selection +0x300 through
 * func_ov015_021fd8a8/021fd8ec, configure associated object +0x70, program
 * blend register 0x04000050, set state bit 0x400, and install callback
 * data_ov015_021fec48. Allocation, sound, graphics, and global-service effects
 * pass through their callees; semantic object names remain inferred.
 */
extern "C" void *Overlay015_Scene_Init(void *state,const void *parameters,s32 soundMode)
{
    s32 i; void *object; void *selected;
    SceneInputBase_Init(state); FIELD(const void *,state,0)=data_ov015_021fec74;
    AnimationResourceState_InitEmbedded((u8 *)state+0x58); AnimationResourceState_InitEmbedded((u8 *)state+0x64);
    TitleCharacterResourceCollection_Init((u8 *)state+0x74); TitleScreenResourceCollection_Init((u8 *)state+0x98);
    Overlay015_ClearValueTriple((u8 *)state+0xe0);
    for(i=0;i<3;i++)SpriteMotionController_Init((u8 *)state+0xfc+i*0xac);
    FIELD(s32,state,0xec)=soundMode; Overlay015_SetupGraphics(state);
    TitleScreenResourceCollection_Append((u8 *)state+0x98,0x8010); TitleScreenResourceCollection_Append((u8 *)state+0x98,0x8011); TitleScreenResourceCollection_Append((u8 *)state+0x98,0x800b);
    TitleCharacterResourceCollection_Append((u8 *)state+0x74,0x7001); TitleCharacterResourceCollection_Append((u8 *)state+0x74,0x7005); TitleCharacterResourceCollection_Append((u8 *)state+0x74,0x7000);
    object=Heap_Alloc(0x48,data_ov015_021fec88,4,gHeapContext);if(object)object=func_ov001_021fb6f8(object,gDebugFont);FIELD(void *,state,0xf4)=object;FIELD(void *,state,0xf8)=0;
    if(parameters)Overlay015_CopyValueTriple((u8 *)state+0xe0,parameters);
    InventoryRecordCollection_SortAlternate((u8 *)data_021e9ac0+0x34,1);
    object=Heap_Alloc(0x210,data_ov015_021fec90,4,gHeapContext);if(object)object=Overlay001_Grid_Init(object,data_020f4e14);FIELD(void *,state,0xdc)=object;
    if(soundMode)Sound_LoadGroup(gSoundContext,0x82);
    AnimationResourceState_ReplaceResources((u8 *)state+0x58,data_020f4e18,0,1,2);
    AnimationResourceState_ReplaceResources((u8 *)state+0x64,data_020f4e18,0x47,0x45,0x48);
    FIELD(void *,state,0x54)=GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    for(i=0;i<3;i++){selected=GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *,state,0x54),(u8 *)state+0x58,1);SpriteMotionController_BindSprite((u8 *)state+0xfc+i*0xac,selected,0,2,0);}
    FIELD(s32,state,0x300)=0;Overlay015_StopRecords(state);func_ov015_021fd8a8(state,0);Overlay015_LayoutRecords(state);Overlay015_StopRecords(state);
    selected=GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *,state,0x54),(u8 *)state+0x64,1);FIELD(void *,state,0x70)=selected;GraphicsSpriteState_ApplyRenderConfig(selected,0,0x9c,0xe,1,0,4);
    func_020afd0c((void *)0x04000050,0,4,4,0xc);FIELD(u32,state,0x20)|=0x400;
    func_ov015_021fce30(state,data_ov015_021fec48[0],data_ov015_021fec48[1],0);return state;
}

/* Destroy owned sound, presentation, record, timer, and resource objects without freeing state; return state. */
extern "C" void *Overlay015_Scene_Destroy(void *state)
{
    s32 i;void *o;FIELD(const void *,state,0)=data_ov015_021fec74;FIELD(u32,state,0x20)&=~0x400u;
    if(FIELD(s32,state,0xec))Sound_ReleaseGroup(gSoundContext,0x82);*(volatile u16 *)0x04000050=0;
    o=FIELD(void *,state,0xf8);if(o){void **v=FIELD(void **,o,0);((Overlay015Destructor)v[1])(o);}
    o=FIELD(void *,state,0xf4);if(o){func_ov001_021fb7d4(o);Heap_Free(o);}o=FIELD(void *,state,0xdc);if(o){void **v=FIELD(void **,o,0);((Overlay015Destructor)v[1])(o);}
    GraphicsSpriteGroup_Destroy(FIELD(void *,state,0x54));for(i=2;i>=0;i--)func_ov015_021fce14((u8 *)state+0xfc+i*0xac);
    TitleScreenResourceCollection_Destroy((u8 *)state+0x98);TitleCharacterResourceCollection_Destroy((u8 *)state+0x74);AnimationResourceState_Destroy((u8 *)state+0x64);AnimationResourceState_Destroy((u8 *)state+0x58);return state;
}

/* Call the non-freeing destructor, free state, and return its former address; heap state changes are observable. */
extern "C" void *Overlay015_Scene_Delete(void *state)
{ Overlay015_Scene_Destroy(state);Heap_Free(state);return state; }
