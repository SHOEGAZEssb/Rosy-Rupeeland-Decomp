#include "tingle/types.h"

/* Recovered modal effect pool: eight audible bursts and nine silent bursts. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern u32 data_020f3058[],data_020f3184[];
extern void *gSoundContext;
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_Assign(void *,const void *);
extern void *func_02099fb0(void *);
extern void *func_0209a208(void *,u32,u32,u32,void *,u8);
extern void func_0209a2ac(void *,const void *,s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *,u8);
extern void Sound_Play(void *,s32,s32);
#ifdef __cplusplus
}
#endif

/* Initialize a sprite-free root node with two vectors and an empty chain. */
void *func_0209eee4(void *self)
{
    F(void *,self,0)=data_020f3058;
    VecFx32Object_Init((u8 *)self+0x1c); VecFx32Object_Init((u8 *)self+0x2c);
    F(void *,self,4)=0; F(void *,self,8)=0; F(void *,self,0xc)=0; F(s32,self,0x44)=0;
    return self;
}

/* Build both owned effect pools, initially hidden, on the supplied group. */
void *func_0209ef24(void *self,void *group)
{
    s32 pool,i;
    func_0209eee4(self); F(void *,self,0)=data_020f3184;
    for(pool=0;pool<2;pool++) for(i=7+pool;i>=0;i--) {
        u32 resource=pool?0x162b:0x1622;
        void *node=func_0209a208(self,resource,resource+1,resource+2,group,2);
        F(void *,self,0x48+pool*0x20+i*4)=node;
        (*(void (**)(void *,void *,s32,s32,s32,u8))F(void *,self,0))(self,node,i*0x46000+0x168000,0x258000,0,0);
        F(u8,F(void *,node,0xc),0x3a)=(u8)pool;
        if(pool) F(s32,node,0x44)=100;
        F(u16,node,0x42)|=4;
    }
    return self;
}

/* Release the linked effect nodes and root vectors without freeing storage. */
void *func_0209f088(void *self) { func_02099fb0(self); return self; }

/* Assign the borrowed Q12 vector to the node's local position. */
void func_0209f148(void *self,const void *position) { VecFx32Object_Assign((u8 *)self+0x2c,position); }

/* Activate the last free node in a pool; audible bursts play effect 0x63. */
static void startBurst(void *self,const void *position,s32 pool)
{
    s32 i;
    for(i=7+pool;i>=0;i--) {
        void *node=F(void *,self,0x48+pool*0x20+i*4);
        if(F(u16,node,0x42)&4) {
            void *sprite=F(void *,node,0xc);
            F(u16,node,0x42)&=~4; GraphicsSpriteState_SetAnimationIndex(sprite,0);
            F(u16,sprite,0x24)&=~2; func_0209f148(node,position);
            if(!pool) Sound_Play(gSoundContext,0x63,0);
            break;
        }
    }
}

/* Start one audible burst at the supplied position, if capacity permits. */
void func_0209f09c(void *self,const void *position) { startBurst(self,position,0); }

/* Start one silent burst at the supplied position, if capacity permits. */
void func_0209f158(void *self,const void *position) { startBurst(self,position,1); }

/* Return completed animations to the hidden/free state in both pools. */
void func_0209f1ec(void *self)
{
    s32 pool,i;
    for(pool=0;pool<2;pool++) for(i=7+pool;i>=0;i--) {
        void *node=F(void *,self,0x48+pool*0x20+i*4);
        if(!(F(u16,node,0x42)&4) && (F(u16,F(void *,node,0xc),0x24)&1)) F(u16,node,0x42)|=4;
    }
}

/* Resolve root and pooled sprite placement against the borrowed camera. */
void func_0209f270(void *self,const void *origin)
{
    s32 pool,i;
    func_0209a2ac(self,0,1);
    for(pool=0;pool<2;pool++) for(i=7+pool;i>=0;i--) func_0209a2ac(F(void *,self,0x48+pool*0x20+i*4),origin,1);
}
