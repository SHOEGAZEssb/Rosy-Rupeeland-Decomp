#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Build and manage a linked group of digit sprites for a signed decimal value.
 * The group owns sprite nodes, a sprite-resource state, its computed pixel
 * width, and helpers for positioning and visibility.
 */

typedef struct SpriteNode { struct SpriteNode *next00,*previous04; u8 *sprite08; } SpriteNode;
typedef struct SpriteNodeList { void **vtable; SpriteNode *tail04,*head08; s32 count0c; } SpriteNodeList;
typedef struct SpriteNumberGroup {
    void *spriteOwner00; SpriteNodeList nodes04; s16 width14; s16 pad16;
    u8 resource18[0x0c];
} SpriteNumberGroup;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d660c;
extern const char data_020d65b4[];
extern void *data_020f4e18;
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *,void *,s32,s32,s32);
extern u8 *func_02073ffc(void *,void *,s32);
extern void func_02072b68(void *,s32);
extern void func_02074038(void *,void *);
extern s32 func_020befec(s32,s32);
#ifdef __cplusplus
}
#endif

SpriteNodeList *func_02022a88(SpriteNodeList *);
void func_02022ac8(SpriteNodeList *);
SpriteNode *func_02022b08(SpriteNodeList *,u8 *);
void func_02022bc8(SpriteNodeList *,SpriteNode *);

/*
 * Retain spriteOwner, initialize list/resource state and load recovered IDs
 * 0x1717/0x1718/0x1001. Create one sprite per decimal digit from the absolute
 * value (least-significant first), using frame base 13 for negative values or
 * 2 otherwise; append a sign/unit sprite (12 negative, 1 nonnegative) and a
 * trailing frame-0 sprite. Store width (digit count + 1)*10 + 8 and return self.
 * func_020befec provides quotient in r0 and remainder in r1 at this SDK boundary.
 */
SpriteNumberGroup *func_0202293c(SpriteNumberGroup *self,void *spriteOwner,s32 value)
{
    s32 remaining=value<0?-value:value,digits=0,base=value<0?13:2;
    self->spriteOwner00=spriteOwner; func_02022a88(&self->nodes04);
    func_02071ea4(self->resource18);
    func_02071ee0(self->resource18,data_020f4e18,0x1717,0x1001,0x1718);
    while(remaining>0) {
        u8 *sprite=func_02073ffc(spriteOwner,self->resource18,2);
        s32 quotient=remaining/10,remainder=remaining%10;
        func_02072b68(sprite,base+remainder); func_02022b08(&self->nodes04,sprite);
        remaining=quotient; digits++;
    }
    { u8 *s=func_02073ffc(spriteOwner,self->resource18,2); func_02072b68(s,value<0?12:1); func_02022b08(&self->nodes04,s); }
    { u8 *s=func_02073ffc(spriteOwner,self->resource18,2); func_02072b68(s,0); func_02022b08(&self->nodes04,s); }
    self->width14=(s16)((digits+1)*10+8); return self;
}

/* Install the node-list vtable and clear tail, head, and count. */
SpriteNodeList *func_02022a88(SpriteNodeList *self)
{ self->vtable=(void **)data_020d660c; self->tail04=0; self->head08=0; self->count0c=0; return self; }

/* Install the list vtable, free all nodes, and return self. */
SpriteNodeList *func_02022aa8(SpriteNodeList *self)
{ self->vtable=(void **)data_020d660c; func_02022ac8(self); return self; }

/* Free all linked nodes and clear both ends and count; sprite payloads are not released here. */
void func_02022ac8(SpriteNodeList *self)
{
    SpriteNode *n=self->tail04; while(n){SpriteNode *next=n->next00;Heap_Free(n);n=next;}
    self->tail04=0;self->head08=0;self->count0c=0;
}

/* Allocate a node for sprite, append it at the list's tail-side end, increment count, and return the new tail. */
SpriteNode *func_02022b08(SpriteNodeList *self,u8 *sprite)
{
    SpriteNode *n=(SpriteNode *)Heap_Alloc(0x0c,data_020d65b4,4,&gHeapContext);
    if(n){n->next00=0;n->previous04=0;n->sprite08=sprite;}
    if(self->tail04){self->tail04->previous04=n;n->next00=self->tail04;}else self->head08=n;
    self->tail04=n;self->count0c++;return self->tail04;
}

/* Release every sprite through spriteOwner, erase its node, tear down resource/list state, and return self. */
SpriteNumberGroup *func_02022b70(SpriteNumberGroup *self)
{
    SpriteNode *n=self->nodes04.head08;
    while(n){func_02074038(self->spriteOwner00,n->sprite08);func_02022bc8(&self->nodes04,n);n=n->next00;}
    func_02071eb8(self->resource18);self->nodes04.vtable=(void **)data_020d660c;func_02022ac8(&self->nodes04);return self;
}

/* Unlink and free node, decrement count, and normalize the empty list when count reaches zero. */
void func_02022bc8(SpriteNodeList *self,SpriteNode *node)
{
    if(node==self->tail04)self->tail04=node->next00;else node->previous04->next00=node->next00;
    if(node==self->head08)self->head08=node->previous04;else node->next00->previous04=node->previous04;
    if(node)Heap_Free(node);if(--self->count0c==0)func_02022ac8(self);
}

/* Center the group around x, clamp it to 0..256-width, and place each sprite ten pixels apart at y. */
void func_02022c30(SpriteNumberGroup *self,s32 x,s32 y)
{
    s32 px=x-(self->width14/2);SpriteNode *n=self->nodes04.head08;
    if(px<0)px=0;if(px+self->width14>=0x100)px=0x100-self->width14;
    while(n){*(s16 *)(n->sprite08+0x2c)=(s16)px;*(s16 *)(n->sprite08+0x2e)=(s16)y;n=n->next00;px+=10;}
}

/* Show sprites by clearing flag bit 2 when visible is nonzero, or hide them by setting it when zero. */
void func_02022c80(SpriteNumberGroup *self,s32 visible)
{
    SpriteNode *n=self->nodes04.head08;while(n){u16 *f=(u16 *)(n->sprite08+0x24);if(visible)*f&=(u16)~4;else *f|=4;n=n->next00;}
}
