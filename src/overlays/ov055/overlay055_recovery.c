#include "tingle/field_effect.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/types.h"

/* Overlay 55 paired-screen animated-object scene. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay055BgConfig {
    u32 character_index, palette_index, map_index;
    u32 character_destination, character_size, palette_bank, palette_count;
} Overlay055BgConfig;

extern void *data_020f4e14[], *data_020f4e18[], *gGamePhaseRuntime, *gDebugFont;
extern u8 gHeapContext[], gMainBgPaletteBuffer[], gSubBgPaletteBuffer[];
extern const u32 data_020c3850[], data_020c38ac[], data_020c3908[];
extern const Overlay055BgConfig *data_020d8818[];
extern const Overlay055BgConfig data_020d887c[], data_020d8aac[];
extern const u8 data_ov055_0220f058[], data_ov055_0220f078[];
extern const u8 data_ov055_0220f080[], data_ov055_0220f088[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *); extern void Heap_Free(void *);
extern void *__construct_array(void *, s32, s32, void (*)(void *), void (*)(void *));
extern void *__destroy_arr(void *, s32, s32, void (*)(void *));
extern u32 genrand_int32(void); extern void *GamePhaseProgress_GetOrCreateGlobal(void); extern s32 GamePhaseProgressController_GetStage(void *);
extern void AnimationResourceState_InitEmbedded(void *); extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void *VecFx32Object_Init(void *); extern void *VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void *VecFx32Object_Assign(void *, const void *); extern void *VecFx32Object_Destroy(void *);
extern void RuntimePresentationManager_AppendFirstListEffect(void *, void *);
extern void *OverlayManager_GetGlobal(void); extern void OverlayManager_UnloadOverlay(void *, s32);
extern void *GraphicsArchive_AcquireCharacterResource(void *, u32); extern void *GraphicsArchive_AcquirePaletteResource(void *, u32);
extern void *GraphicsArchive_AcquireScreenResource(void *, u32); extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void GraphicsBgMapResource_SetPaletteBank(void *, s32); extern void GraphicsArchive_ReleaseCharacterResource(void *, void *);
extern void GraphicsArchive_ReleasePaletteResource(void *, void *); extern void GraphicsArchive_ReleaseScreenResource(void *, void *);
extern void func_020b44e8(void); extern void func_020b1c64(const void *, u32, u32);
extern void func_020b1924(const void *, u32, u32); extern void func_020b1b2c(const void *, u32, u32);
extern void func_020b17ec(const void *, u32, u32); extern void PaletteBuffer_Write(void *, const void *, u32, u32);

void func_ov055_0220ebec(void *); void func_ov055_0220eefc(void *, const void *);
s32 func_ov055_0220eee4(void *);

/* Initialize one collection-owned animated object and its sprite resources. */
void *func_ov055_0220e400(void *object, void *group)
{
    u8 resource[12]; void *sprite;
    FIELD(void *, object, 0) = 0; FIELD(s32, object, 4) = 0; FIELD(s32, object, 8) = 0;
    AnimationResourceState_InitEmbedded(resource); FIELD(s32, object, 8) = FIELD(s32, GamePhaseProgress_GetOrCreateGlobal(), 0x10);
    if (FIELD(s32, object, 8) == 2) AnimationResourceState_ReplaceResources(resource, data_020f4e18[0], 0x224b, 0x224c, 0x224d);
    else AnimationResourceState_ReplaceResources(resource, data_020f4e18[0], 0x2239, 0x223a, 0x223b);
    sprite = GraphicsSpriteGroup_CreateState((GraphicsSpriteGroup *)group, FIELD(void *, resource, 0), FIELD(void *, resource, 4), FIELD(void *, resource, 8), 2);
    FIELD(void *, object, 0) = sprite; FIELD(u16, sprite, 0x24) |= 4;
    GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)sprite, 1); FIELD(u16, sprite, 0x2c) = 0x80; FIELD(u16, sprite, 0x2e) = 0x2f;
    if (FIELD(s32, object, 8) == 2) FIELD(u16, sprite, 0x24) |= 2; else FIELD(u16, sprite, 0x24) &= (u16)~2;
    FIELD(u8, sprite, 0x3a) = 2; AnimationResourceState_Destroy(resource); return object;
}

/* Restart the object's animation at the recovered random cadence. */
void func_ov055_0220e518(void *object)
{
    if (FIELD(s32, object, 8) == 2 || --FIELD(s32, object, 4) >= 0) return;
    FIELD(s32, object, 4) = (s32)(genrand_int32() % 3) * 0xf0;
    GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)FIELD(void *, object, 0), 1);
    FIELD(u16, FIELD(void *, object, 0), 0x24) &= (u16)~1;
}

/* Construct the effect collection, resources, sprites, and child object. */
void *func_ov055_0220e574(void *c, void *primary, void *secondary, s32 mode)
{
    void *s, *child; __construct_array(c, 3, 12, AnimationResourceState_InitEmbedded, AnimationResourceState_Destroy);
    FIELD(void *, c, 0x24)=primary; FIELD(void *, c, 0x28)=secondary; FIELD(s32,c,0x38)=0; FIELD(s32,c,0x3c)=0; FIELD(s32,c,0x40)=0;
    AnimationResourceState_ReplaceResources(c,data_020f4e18[0],0x2239,0x223a,0x223b); AnimationResourceState_ReplaceResources((u8*)c+12,data_020f4e18[0],0x223f,0x2240,0x2241);
    AnimationResourceState_ReplaceResources((u8*)c+24,data_020f4e18[0],0x224b,0x224c,0x224d);
    s=GraphicsSpriteGroup_CreateState((GraphicsSpriteGroup *)primary,FIELD(void*,c,0),FIELD(void*,c,4),FIELD(void*,c,8),2); FIELD(void*,c,0x2c)=s;
    FIELD(u16,s,0x24)|=6; GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)s,3); FIELD(u16,s,0x2c)=0x54; FIELD(u16,s,0x2e)=0x46; FIELD(u8,s,0x3a)=2;
    s=GraphicsSpriteGroup_CreateState((GraphicsSpriteGroup *)primary,FIELD(void*,c,0),FIELD(void*,c,4),FIELD(void*,c,8),2); FIELD(void*,c,0x30)=s;
    FIELD(u16,s,0x24)|=6; GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)s,3); FIELD(u16,s,0x2c)=0xac; FIELD(u16,s,0x2e)=0x46; FIELD(u8,s,0x3a)=2;
    s=GraphicsSpriteGroup_CreateState((GraphicsSpriteGroup *)(mode<=1?primary:secondary),FIELD(void*,c,12),FIELD(void*,c,16),FIELD(void*,c,20),2); FIELD(void*,c,0x34)=s;
    GraphicsSpriteState_SetAnimationIndex((GraphicsSpriteState *)s,0); FIELD(u16,s,0x2c)=0x80; FIELD(u16,s,0x2e)=mode<=1?0x0e:0x50; FIELD(u16,s,0x24)|=0x20; FIELD(u8,s,0x3a)=mode<=1?2:1;
    child=Heap_Alloc(12,data_ov055_0220f078,4,gHeapContext); if(child) child=func_ov055_0220e400(child,primary); FIELD(void*,c,0x44)=child; return c;
}

/* Destroy the optional child and embedded resource array. */
void *func_ov055_0220e7cc(void *c)
{ if(FIELD(void*,c,0x44)) Heap_Free(FIELD(void*,c,0x44)); __destroy_arr(c,3,12,AnimationResourceState_Destroy); return c; }

/* Periodically select a different frame and advance the child object. */
void func_ov055_0220e804(void *c)
{
    if(--FIELD(s32,c,0x40)<0){u32 frame; FIELD(s32,c,0x40)=(s32)(genrand_int32()&3)+6;
        do{frame=genrand_int32()%3;}while(frame==FIELD(u8,FIELD(void*,c,0x34),0x39));
        GraphicsSpriteState_SetFrameIndex((GraphicsSpriteState *)FIELD(void*,c,0x34),(u8)frame);}
    func_ov055_0220e518(FIELD(void*,c,0x44));
}

/* Apply the recovered sprite visibility state. */
void func_ov055_0220e860(void *c)
{ FIELD(u16,FIELD(void*,c,0x2c),0x24)|=4; FIELD(u16,FIELD(void*,c,0x30),0x24)|=4; FIELD(u16,FIELD(void*,FIELD(void*,c,0x44),0),0x24)&=(u16)~4; FIELD(s32,c,0x38)=2; }

/* Mark both sprite groups for submission. */
void func_ov055_0220e8a0(void *c)
{
    ((GraphicsSpriteGroup *)FIELD(void *, c, 0x24))->renderEnabled = 1;
    ((GraphicsSpriteGroup *)FIELD(void *, c, 0x28))->renderEnabled = 1;
}

/* Construct the scene base, groups, and owned collection. */
void *func_ov055_0220e8b8(void *scene, void *owner, s32 mode)
{
    void *c; void (**vtable)(void*,s32); FieldEffect_Init(scene); FIELD(const void*,scene,0)=data_ov055_0220f058;
    VecFx32Object_Init((u8*)scene+8); FIELD(void*,scene,0x1c)=0; FIELD(void*,scene,0x28)=owner; FIELD(s32,scene,0x2c)=mode;
    FIELD(void*,scene,0x1c)=GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]); FIELD(void*,scene,0x20)=GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    c=Heap_Alloc(0x48,data_ov055_0220f080,4,gHeapContext); if(c)c=func_ov055_0220e574(c,FIELD(void*,scene,0x1c),FIELD(void*,scene,0x20),mode); FIELD(void*,scene,0x24)=c;
    vtable=*(void (***)(void*,s32))scene; vtable[5](scene,0); return scene;
}

/* Load graphics and activate the recovered display configuration. */
void func_ov055_0220e96c(void *scene)
{
    volatile u16 *bg=(volatile u16*)0x0400000a; volatile u32 *display=(volatile u32*)0x04000000;
    *bg=(u16)((*bg&0x43)|0x9a04); *display=(*display&~0x1f00u)|(((((*display&0x1f00u)>>8)|2u)<<8)); *bg=(u16)((*bg&~3u)|2u);
    if(FIELD(s32,scene,0x2c)>=2){volatile u32 *sd=(volatile u32*)0x04001000; volatile u16 *sb1=(volatile u16*)0x0400100c,*sb2=(volatile u16*)0x0400100e;
        *sb1=(u16)((*sb1&0x43)|0x9c10); *sd=(*sd&~0x1f00u)|(((((*sd&0x1f00u)>>8)|4u)<<8)); *sb2=(u16)((*sb2&~3u)|2u);}
    func_ov055_0220ebec(scene); (void)GamePhaseProgress_GetOrCreateGlobal(); func_ov055_0220e8a0(FIELD(void*,scene,0x24)); func_ov055_0220e860(FIELD(void*,scene,0x24));
    if(FIELD(s32,scene,0x2c)>2) FIELD(u16,FIELD(void*,FIELD(void*,scene,0x24),0x34),0x24)|=4;
}

/* Destroy scene-owned resources while retaining its allocation. */
void *func_ov055_0220ea68(void *scene)
{
    void *c=FIELD(void*,scene,0x24); FIELD(const void*,scene,0)=data_ov055_0220f058;
    if(c){func_ov055_0220e7cc(c); Heap_Free(c);} GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14[0],(GraphicsSpriteGroup *)FIELD(void*,scene,0x1c));
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont,(GraphicsSpriteGroup *)FIELD(void*,scene,0x20)); OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(),1);
    VecFx32Object_Destroy((u8*)scene+8); FieldEffect_DestroyBase(scene); return scene;
}

/* Destroy all resources and free the scene allocation. */
void *func_ov055_0220eae4(void *scene)
{ func_ov055_0220ea68(scene); Heap_Free(scene); return scene; }

/* Advance transform, random animation, and the primary sprite group. */
void func_ov055_0220eb68(void *scene)
{
    u8 vector[16]; GraphicsSpriteGroup *group; VecFx32Object_InitComponents(vector,0,0x42000,0); VecFx32Object_Assign((u8*)scene+8,vector); VecFx32Object_Destroy(vector);
    func_ov055_0220eefc(scene,(u8*)scene+8); func_ov055_0220e804(FIELD(void*,scene,0x24)); group=(GraphicsSpriteGroup *)FIELD(void*,scene,0x1c);
    group->screenOffsetX=0; group->screenOffsetY=FIELD(s32,scene,0x2c)==0?0x60:0; GraphicsSpriteGroup_AdvanceAnimations(group); *(volatile u16*)0x05000000=0;
}

/* Load and release one pair of recovered BG resources. */
static void Overlay055_LoadBgPair(const Overlay055BgConfig *config, s32 sub)
{
    s32 i; for(i=0;i<2;++i){const Overlay055BgConfig *e=&config[i]; void *archive=data_020f4e18[0];
        void *character=GraphicsArchive_AcquireCharacterResource(archive,data_020c38ac[e->character_index]); void *palette=GraphicsArchive_AcquirePaletteResource(archive,data_020c3850[e->palette_index]);
        void *map=GraphicsArchive_AcquireScreenResource(archive,data_020c3908[e->map_index]); u16 *tiles=FIELD(u16*,map,0x24); s32 count=func_ov055_0220eee4(map)/2,t;
        for(t=0;t<count;++t)tiles[t]=(u16)((tiles[t]&0xfc00u)|((tiles[t]&0x3ffu)+(e->character_destination>>5)));
        GraphicsBgMapResource_SetPaletteBank(map,(s32)e->palette_bank); func_020b44e8();
        if(sub){func_020b1b2c(FIELD(void*,map,0x24),(u32)(i*3)<<8,0x300); func_020b17ec(FIELD(void*,character,0x24),e->character_destination,e->character_size);
            PaletteBuffer_Write(gSubBgPaletteBuffer,GraphicsBgResourceData_GetDecoded(palette),e->palette_bank<<5,e->palette_count<<5);}
        else{func_020b1c64(FIELD(void*,map,0x24),(u32)(i*3)<<8,0x300); func_020b1924(FIELD(void*,character,0x24),e->character_destination,e->character_size);
            PaletteBuffer_Write(gMainBgPaletteBuffer,GraphicsBgResourceData_GetDecoded(palette),e->palette_bank<<5,e->palette_count<<5);}
        GraphicsArchive_ReleaseCharacterResource(archive,character); GraphicsArchive_ReleasePaletteResource(archive,palette); GraphicsArchive_ReleaseScreenResource(archive,map);}
}

/* Load paired main/sub background resources. */
void func_ov055_0220ebec(void *scene)
{ s32 mode=FIELD(s32,scene,0x2c); Overlay055_LoadBgPair(data_020d8818[mode],0); if(mode>1)Overlay055_LoadBgPair(mode==2?data_020d887c:data_020d8aac,1); }

/* Return the byte size represented by the map dimensions. */
s32 func_ov055_0220eee4(void *resource)
{ void *d=FIELD(void*,resource,0x20); return FIELD(s32,d,12)*FIELD(s32,d,16)*2; }

/* Copy fixed-point transform values to main/sub BG offset registers. */
void func_ov055_0220eefc(void *scene, const void *v)
{ s32 y=FIELD(s32,v,4)>>12,z=FIELD(s32,v,8)>>12; (void)scene; *(volatile u32*)0x04000014=(u32)((y-0x20)&0x1ff)|((u32)(z&0x1ff)<<16); *(volatile u32*)0x04001018=(u32)((y-0x20)&0x1ff)|((u32)((z-0x42)&0x1ff)<<16); }

/* Allocate, construct, and register the scene. */
void *func_ov055_0220ef6c(void)
{
    void *scene=Heap_Alloc(0x30,data_ov055_0220f088,4,gHeapContext); if(scene){u8 *runtime=(u8*)gGamePhaseRuntime; scene=func_ov055_0220e8b8(scene,runtime+0x2fbc,GamePhaseProgressController_GetStage(GamePhaseProgress_GetOrCreateGlobal()));}
    RuntimePresentationManager_AppendFirstListEffect((u8*)gGamePhaseRuntime+0x2f7c,scene); return scene;
}

/* Submit or release both collection sprite groups. */
void func_ov055_0220efe0(void *scene, s32 mode)
{ void *c=FIELD(void*,scene,0x24); if(mode){func_ov055_0220e8a0(c);return;} GraphicsSpriteGroup_ReleaseIndexedEntries((GraphicsSpriteGroup *)FIELD(void*,c,0x24)); GraphicsSpriteGroup_ReleaseIndexedEntries((GraphicsSpriteGroup *)FIELD(void*,c,0x28)); }

/* Intentional no-op scene callback; all state remains unchanged. */
void func_ov055_0220f010(void *scene){(void)scene;}

/* Intentional no-op scene callback; all state remains unchanged. */
void func_ov055_0220f014(void *scene){(void)scene;}

/* Intentional no-op scene callback; all state remains unchanged. */
void func_ov055_0220f018(void *scene){(void)scene;}

#ifdef __cplusplus
}
#endif
