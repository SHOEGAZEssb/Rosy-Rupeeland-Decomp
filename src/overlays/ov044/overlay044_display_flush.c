#include "tingle/types.h"

/*
 * Overlay 44 display flush. This recovered helper commits both embedded
 * presentations, the scene font resource, panel viewport/font state, and the
 * optional debug preview during the frame's display phase.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_020958d8(void *presentation);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *resource);
extern "C" void func_02094574(void *viewport);
extern "C" void func_ov001_021fbaa8(void *preview);

/*
 * Flush presentations +0xD0/+0x17C and resource +0xBC. If panel +0x228 is
 * present, flush its child viewport +0x44 and font resource +0x04. Finally
 * flush optional preview +0x22C. These calls commit graphics state and have no
 * return value.
 */
extern "C" void func_ov044_0220c880(void *object)
{
    func_020958d8((u8 *)object + 0xd0);
    func_020958d8((u8 *)object + 0x17c);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0xbc));
    void *panel = FIELD(void *, object, 0x228);
    if (panel) {
        func_02094574(FIELD(void *, panel, 0x44));
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, panel, 4));
    }
    void *preview = FIELD(void *, object, 0x22c);
    if (preview)
        func_ov001_021fbaa8(preview);
}
