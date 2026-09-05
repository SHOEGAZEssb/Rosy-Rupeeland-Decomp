#include "tingle/types.h"
#include "tingle/heap.h"

/* Recovered modal sprite nodes: linked ownership, archive resource references,
 * parent-relative Q12 placement and sprite animation. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern u32 data_020f3058[];
extern const char data_020f305c[];
extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_Destroy(void *);
extern void VecFx32Object_Assign(void *,const void *);
extern void VecFx32Object_Add(void *,const void *);
extern void *GraphicsArchive_AcquireCharacterResource(void *,u32);
extern void *GraphicsArchive_AcquirePaletteResource(void *,u32);
extern void *GraphicsArchive_AcquireCellResource(void *,u32);
extern void GraphicsArchive_ReleaseCharacterResource(void *,void *);
extern void GraphicsArchive_ReleasePaletteResource(void *,void *);
extern void GraphicsArchive_ReleaseCellResource(void *,void *);
extern void *GraphicsSpriteGroup_CreateState(void *,void *,void *,void *,u8);
extern void GraphicsSpriteGroup_ReleaseState(void *,void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *,u8);
extern void GraphicsSpriteState_AdvanceAnimation(void *);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(void *,const void *,const void *,s32,s32,s32,u16);
#ifdef __cplusplus
}
#endif

/* Acquire the three archive references into caller-owned output slots. */
void func_02071b94(void *archive,u32 character,u32 palette,u32 cell,void **c,void **p,void **a)
{
    *c=GraphicsArchive_AcquireCharacterResource(archive,character);
    *p=GraphicsArchive_AcquirePaletteResource(archive,palette);
    *a=GraphicsArchive_AcquireCellResource(archive,cell);
}

/* Acquire resources and attach a group-owned sprite; flags begin clear. */
void func_0209a00c(void *self,u32 character,u32 palette,u32 cell,void *group,u8 engine)
{
    void *sprite;
    func_02071b94(data_020f4e18,character,palette,cell,(void **)((u8 *)self+0x10),(void **)((u8 *)self+0x14),(void **)((u8 *)self+0x18));
    sprite=GraphicsSpriteGroup_CreateState(group,F(void *,self,0x10),F(void *,self,0x14),F(void *,self,0x18),engine);
    F(void *,self,0xc)=sprite;
    F(u16,sprite,0x24)|=8;
    F(u16,self,0x42)=0;
}

/* Initialize caller-owned node storage and its owned sprite references. */
void *func_02099edc(void *self,u32 character,u32 palette,u32 cell,void *group,u8 engine)
{
    F(void *,self,0)=data_020f3058;
    VecFx32Object_Init((u8 *)self+0x1c);
    VecFx32Object_Init((u8 *)self+0x2c);
    F(void *,self,4)=0; F(void *,self,8)=0; F(void *,self,0xc)=0; F(s32,self,0x44)=0;
    func_0209a00c(self,character,palette,cell,group,engine);
    return self;
}

/* Release sprite and archive references, leaving the node allocated. */
void func_0209a07c(void *self)
{
    void *sprite=F(void *,self,0xc);
    if(!sprite) return;
    GraphicsSpriteGroup_ReleaseState(F(void *,sprite,0),sprite);
    GraphicsArchive_ReleaseCharacterResource(data_020f4e18,F(void *,self,0x10));
    GraphicsArchive_ReleasePaletteResource(data_020f4e18,F(void *,self,0x14));
    GraphicsArchive_ReleaseCellResource(data_020f4e18,F(void *,self,0x18));
    F(void *,self,0xc)=0;
}

/* Recursively release owned successor nodes, then this node's resources. */
void *func_02099f54(void *self)
{
    void *next;
    F(void *,self,0)=data_020f3058;
    next=F(void *,self,4);
    if(next) { func_02099f54(next); Heap_Free(next); F(void *,self,4)=0; }
    func_0209a07c(self);
    VecFx32Object_Destroy((u8 *)self+0x2c);
    VecFx32Object_Destroy((u8 *)self+0x1c);
    return self;
}

/* Complete destructor has the same ownership effects as the base entry. */
void *func_02099fb0(void *self) { return func_02099f54(self); }

/* Replace the sprite by releasing its previous resources first. */
void func_0209a0d8(void *self,u32 c,u32 p,u32 a,void *group,u8 engine)
{
    func_0209a07c(self); func_0209a00c(self,c,p,a,group,engine);
}

/* Acquire the replacement before releasing the old sprite's references. */
void func_0209a120(void *self,u32 c,u32 p,u32 a,void *group)
{
    void *cr,*pr,*ar,*sprite;
    func_02071b94(data_020f4e18,c,p,a,&cr,&pr,&ar);
    sprite=GraphicsSpriteGroup_CreateState(group,cr,pr,ar,1);
    func_0209a07c(self);
    F(void *,self,0x10)=cr; F(void *,self,0x14)=pr; F(void *,self,0x18)=ar;
    F(void *,self,0xc)=sprite; F(u16,sprite,0x24)|=8; F(u16,self,0x42)=0;
}

/* Set a child node's animation, Q12 local position and unit Q8 scales. */
void func_0209a1b4(void *self,void *node,s32 x,s32 y,s32 z,u8 animation)
{
    void *sprite=F(void *,node,0xc);
    (void)self;
    GraphicsSpriteState_SetAnimationIndex(sprite,animation);
    F(u16,sprite,0x24)|=2;
    F(s32,node,0x30)=x; F(s32,node,0x34)=y; F(s32,node,0x38)=z;
    F(u16,node,0x3c)=0x100; F(u16,node,0x3e)=0x100; F(u16,node,0x40)=0;
}

/* Append an owned node at the end of the successor chain; return zero. */
s32 func_0209a280(void *self,void *node)
{
    if(F(void *,self,4)) return func_0209a280(F(void *,self,4),node);
    F(void *,self,4)=node; return 0;
}

/* Allocate a node and transfer its ownership to the supplied chain. */
void *func_0209a208(void *self,u32 c,u32 p,u32 a,void *group,u8 engine)
{
    void *node=Heap_Alloc(0x48,data_020f305c,4,&gHeapContext);
    if(node) func_02099edc(node,c,p,a,group,engine);
    func_0209a280(self,node); return node;
}

/* Retain a borrowed positional parent; ownership remains with its caller. */
void func_0209a2a4(void *self,void *parent) { F(void *,self,8)=parent; }

/* Resolve parent-relative placement, visibility/depth and advance animation.
 * Margin class selects the same pixel culling rectangle as the retail code. */
void func_0209a2ac(void *self,const void *origin,s32 marginClass)
{
    void *sprite,*parent;
    s16 margins[4];
    VecFx32Object_Assign((u8 *)self+0x1c,(u8 *)self+0x2c);
    parent=F(void *,self,8);
    if(parent) VecFx32Object_Add((u8 *)self+0x1c,(u8 *)parent+0x1c);
    sprite=F(void *,self,0xc);
    if(!sprite) return;
    if(F(u16,self,0x42)&4) F(u16,sprite,0x24)|=4;
    else {
        if(marginClass==2) { margins[0]=-128; margins[1]=-96; margins[2]=128; margins[3]=96; }
        else if(marginClass==1) { margins[0]=-32; margins[1]=-36; margins[2]=64; margins[3]=72; }
        else { margins[0]=-32; margins[1]=-25; margins[2]=32; margins[3]=25; }
        GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(sprite,origin,margins,F(s32,self,0x20),F(s32,self,0x24),F(s32,self,0x28),8);
        F(u16,sprite,0x24)=(F(u16,sprite,0x24)|F(u16,self,0x42))&~4;
        if(!parent) F(s16,sprite,0x28)+=(s16)F(s32,self,0x44);
        else if(F(void *,parent,0xc)) F(s16,sprite,0x28)=F(s16,F(void *,parent,0xc),0x28)+(s16)F(s32,self,0x44);
    }
    F(u16,sprite,0x32)=F(u16,self,0x3c); F(u16,sprite,0x34)=F(u16,self,0x3e);
    GraphicsSpriteState_AdvanceAnimation(sprite);
}
