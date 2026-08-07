#include "tingle/types.h"

/* Overlay 15 base value initialization, flag propagation, and transition-field helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Clear words +0x00/+0x04/+0x08 and return void without hardware effects. */
extern "C" void func_ov015_021fce00(void *value)
{ FIELD(s32,value,8)=0; FIELD(s32,value,4)=0; FIELD(s32,value,0)=0; }

/* Accept one pointer and return immediately without changing state or hardware. */
extern "C" void func_ov015_021fce14(void *value) { (void)value; }

/* If state +0x0C is non-null, OR argument two into that object's +0x20 flags; return void. */
extern "C" void func_ov015_021fce18(void *state, u32 mask)
{ void *object=FIELD(void *,state,0xc); if(object) FIELD(u32,object,0x20)|=mask; }

/* Store arguments two/three at +0x24/+0x28, clear +0x04/+0x08, ignore argument four, and return void. */
extern "C" void func_ov015_021fce30(void *state,s32 a,s32 b,s32 unused)
{ (void)unused; FIELD(s32,state,0x24)=a; FIELD(s32,state,0x28)=b; FIELD(s32,state,4)=0; FIELD(s32,state,8)=0; }
