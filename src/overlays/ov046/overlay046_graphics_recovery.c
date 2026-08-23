#include "tingle/types.h"
#include "tingle/graphics_resources.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/graphics_sprite_state.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Overlay 46 graphics recovery. These routines load the selection panel's
 * tile resources, rebuild its visible sprite/canvas contents, and write the
 * corresponding main- or sub-engine OAM state. Exact matching assembly is
 * retained for the long compiler-sensitive loops and direct MMIO sequences.
 */

/*
 * Load the mode-selected resource triplet (0xB10A..0xB10C or
 * 0xC00F..0xC011), configure BG0..BG3 control registers for the panel's
 * owning display, upload resource set slot 3 at 0x1E0, rebuild the panel, and
 * release the temporary resource set. `panel` changes and this routine has no
 * return value. It writes main-engine registers at 0x04000008..0x0400000E or
 * sub-engine registers at 0x04001008..0x0400100E according to font ownership.
 */
extern "C" void *data_020f4e14;
extern "C" void *data_020f4e18;
extern "C" u8 data_ov046_0220cd14[];
extern "C" u8 data_ov046_0220cdf0[];
extern "C" const u8 data_020d7834[];
extern "C" void *gGameWork;
extern "C" u8 gSystemState[];
extern "C" s32 GameWork_TestFlag(void *gameWork, u16 flag);
extern "C" void GraphicsBgMapResource_SetPaletteBank(void *resource, s32 paletteBank);
extern "C" void func_020b44e8(void);
extern "C" void func_020925a4(s32 backgroundMode);
extern "C" void func_020925dc(s32 backgroundMode);
extern "C" void func_020925f8(void);
extern "C" void func_02092618(void);
extern "C" void func_02092638(s32 bg0, s32 bg1, s32 bg2, s32 bg3);
extern "C" void func_02092688(s32 bg0, s32 bg1, s32 bg2, s32 bg3);
extern "C" void func_ov046_0220bd14(void *panel);

extern "C" void func_ov046_0220bac0(void *panel)
{
    GraphicsResourceSet resources;
    volatile u16 *bgControl;

    GraphicsResourceSet_Init(&resources);
    if (FIELD(s32, panel, 0x114) == 0) {
        GraphicsResourceSet_Load(&resources, data_020f4e18,
                                 0xb10a, 0xb10b, 0xb10c);
    } else {
        GraphicsResourceSet_Load(&resources, data_020f4e18,
                                 0xc00f, 0xc010, 0xc011);
    }
    GraphicsBgMapResource_SetPaletteBank(resources.resource2, 0x0f);
    func_020b44e8();

    if (FIELD(void *, panel, 0) == data_020f4e14) {
        func_020925a4(0);
        bgControl = (volatile u16 *)0x04000008;
        bgControl[0] = (u16)((bgControl[0] & 0x43) | 0xe008);
        bgControl[1] = (u16)((bgControl[1] & 0x43) | 0xe410);
        bgControl[2] = (u16)((bgControl[2] & 0x43) | 0xc818);
        bgControl[3] = (u16)((bgControl[3] & 0x43) | 0x0c00);
        func_020925f8();
        func_02092638(2, 2, 2, 3);
        func_02072048(&resources, 3, 0x1e0);
    } else {
        func_020925dc(0);
        bgControl = (volatile u16 *)0x04001008;
        bgControl[0] = (u16)((bgControl[0] & 0x43) | 0xe008);
        bgControl[1] = (u16)((bgControl[1] & 0x43) | 0xe410);
        bgControl[2] = (u16)((bgControl[2] & 0x43) | 0xc818);
        bgControl[3] = (u16)((bgControl[3] & 0x43) | 0x0c00);
        func_02092618();
        func_02092688(2, 2, 2, 3);
        GraphicsResourceSet_Apply(&resources, 3, 0x1e0);
    }

    GraphicsResourceSet_ReleaseHandles(&resources);
    func_ov046_0220bd14(panel);
    GraphicsResourceSet_Destroy(&resources);
}

/*
 * Clear a rectangle in the software canvas referenced by `canvas` +0x24.
 * `rectangle` supplies offset-derived x/y/width/height fields at +4/+8/+0xC/
 * +0x10; coordinates are scaled by six and converted to the DS 8x8 tiled
 * 16-bit bitmap layout. Pixel memory changes, nothing is returned, and no
 * hardware register is touched directly. The first argument is unused.
 */
extern "C" void func_ov046_0220bc80(void *unused, void *canvas,
                                     const void *rectangle)
{
    const u8 *bounds = (const u8 *)rectangle;
    u16 *pixels = FIELD(u16 *, canvas, 0x24);
    s32 startX = FIELD(s32, bounds, 0x04) * 8;
    s32 startY = FIELD(s32, bounds, 0x08) * 6;
    s32 endX = (FIELD(s32, bounds, 0x04) +
                FIELD(s32, bounds, 0x0c)) * 8;
    s32 endY = (FIELD(s32, bounds, 0x08) +
                FIELD(s32, bounds, 0x10)) * 6;
    s32 y;

    (void)unused;
    for (y = startY; y < endY; ++y) {
        s32 row = (y / 32) * 2048 + (y & 31) * 32;
        s32 x;
        for (x = startX; x < endX; ++x) {
            pixels[row + (x / 32) * 1024 + (x & 31)] = 0;
        }
    }
}

/*
 * Recompute the three visible selection slots from panel origin +0x10C/+0x110
 * and the seven layout records at data_ov046_0220ce28. It updates slot indices
 * +0xC8, loads mode-dependent tile resources for changed slots, redraws their
 * software canvases, and refreshes sprite attributes/visibility. `panel` and
 * graphics resources change; temporary resource sets are released; no value
 * is returned. Table field meanings beyond confirmed coordinates and resource
 * IDs remain inferred from offset use.
 */
extern "C" void func_ov046_0220bd14(void *panel)
{
    s32 candidates[7];
    s32 candidateCount = 0;
    s32 centerX = FIELD(s32, panel, 0x10c);
    s32 centerY = FIELD(s32, panel, 0x110);
    s32 index;

    for (index = 0; index < 7; ++index) {
        const u8 *record = data_ov046_0220cdf0 + index * 0x28;
        s32 x = FIELD(s32, record, 0x18);
        s32 y = FIELD(s32, record, 0x1c);
        s32 width = FIELD(s32, record, 0x20);
        s32 height = FIELD(s32, record, 0x24);
        bool visible = centerX - 0x80 <= x + width - 0x40 &&
                       centerY - 0x60 <= y + height - 0x30 &&
                       centerX + 0x80 >= x + 0x40 &&
                       centerY + 0x60 >= y + 0x30;

        if (visible) {
            candidates[candidateCount++] = index;
        } else {
            s32 slot;
            for (slot = 0; slot < 3; ++slot) {
                if (FIELD(s32, panel, 0xc8 + slot * 4) == index) {
                    FIELD(s32, panel, 0xc8 + slot * 4) = -1;
                    break;
                }
            }
        }
    }

    for (index = 0; index < candidateCount; ++index) {
        s32 candidate = candidates[index];
        s32 slot;
        bool assigned = false;

        for (slot = 0; slot < 3; ++slot) {
            if (FIELD(s32, panel, 0xc8 + slot * 4) == candidate) {
                assigned = true;
                break;
            }
        }
        if (assigned) {
            continue;
        }

        for (slot = 0; slot < 3; ++slot) {
            GraphicsResourceSet resources;
            const u8 *record;
            const u16 *ids;
            s32 first;
            s32 second;
            s32 firstState;
            s32 secondState;

            if (FIELD(s32, panel, 0xc8 + slot * 4) >= 0) {
                continue;
            }
            FIELD(s32, panel, 0xc8 + slot * 4) = candidate;
            record = data_ov046_0220cdf0 + candidate * 0x28;
            first = FIELD(s32, record, 0x00);
            second = FIELD(s32, record, 0x04);
            firstState = FIELD(s32, panel, 0xe0 + first * 4);
            secondState = second < 0 ? 0 :
                FIELD(s32, panel, 0xe0 + second * 4);
            if (second < 0) {
                ids = (const u16 *)(record + (firstState != 0 ? 0x08 : 0x0c));
            } else if (firstState != 0) {
                ids = (const u16 *)(record + (secondState != 0 ? 0x08 : 0x0c));
            } else {
                ids = (const u16 *)(record + (secondState != 0 ? 0x14 : 0x10));
            }

            GraphicsResourceSet_Init(&resources);
            GraphicsResourceSet_Load(&resources, data_020f4e18,
                                     ids[0], 0xb10e, ids[1]);
            if (firstState == 1) {
                func_ov046_0220bc80(
                    panel, resources.resource2,
                    data_ov046_0220cd14 + first * 0x14);
            }
            if (second >= 0 && secondState == 1) {
                func_ov046_0220bc80(
                    panel, resources.resource2,
                    data_ov046_0220cd14 + second * 0x14);
            }
            func_020b44e8();
            if (FIELD(void *, panel, 0) == data_020f4e14) {
                func_02072048(&resources, slot, 0);
            } else {
                GraphicsResourceSet_Apply(&resources, slot, 0);
            }
            GraphicsResourceSet_Destroy(&resources);
            break;
        }
    }

    FIELD(s32, panel, 0xc0) = 0x18;
    for (index = 0; index < 3; ++index) {
        if (FIELD(s32, panel, 0xc8 + index * 4) >= 0) {
            FIELD(s32, panel, 0xc0) |= 1 << index;
        }
    }
}

/*
 * Hide all 32 item sprites, then populate them for selection `index` using
 * the corresponding 0x34-byte data_020d780C record and 0x14-byte placement
 * record. `value` selects a record variant and `flag` controls the auxiliary
 * sprite path. The routine updates sprite glyphs, positions, visibility, and
 * finally rebuilds panel slots; it returns no value and affects renderer/OAM
 * state through SDK helpers.
 */
extern "C" void func_ov046_0220bffc(void *panel, s32 index, s32 enabled,
                                     s32 selectedFlag)
{
    GraphicsSpriteState *auxiliary =
        (GraphicsSpriteState *)FIELD(void *, panel, 0xbc);
    const u8 *placement = data_ov046_0220cd14 + index * 0x14;
    const u8 *descriptor =
        FIELD(const u8 *, data_020d7834, index * 0x34);
    s32 category = FIELD(s32, placement, 0);
    const u8 *layout = data_ov046_0220cdf0 + category * 0x28;
    s32 i;

    if (enabled)
        auxiliary->flags |= 4;
    for (i = 0; i < 32; ++i) {
        GraphicsSpriteState *sprite =
            (GraphicsSpriteState *)FIELD(void *, panel, 0x3c + i * 4);
        sprite->flags |= 4;
    }

    if (FIELD(s32, panel, 0xe0 + index * 4) == 2) {
        for (i = 0; i < 32; ++i, descriptor += 0x0c) {
            GraphicsSpriteState *sprite;
            s32 x;
            s32 y;

            if (FIELD(s16, descriptor, 0) == 3)
                break;
            if (FIELD(u16, descriptor, 0x0a) != 0 &&
                !GameWork_TestFlag(gGameWork,
                                   FIELD(u16, descriptor, 0x0a))) {
                continue;
            }

            sprite = (GraphicsSpriteState *)
                FIELD(void *, panel, 0x3c + i * 4);
            GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
                (GraphicsSpriteGroup *)FIELD(void *, panel, 4), sprite,
                (const GraphicsSpriteSource3 *)
                    ((u8 *)panel + 0x14 + FIELD(s16, descriptor, 2) * 0x0c));
            GraphicsSpriteState_SetAnimationIndex(
                sprite, (u8)FIELD(s16, descriptor, 4));

            x = FIELD(s16, descriptor, 6) + FIELD(s32, layout, 0x18) +
                FIELD(s32, placement, 4) * 0x40;
            y = FIELD(s16, descriptor, 8) + FIELD(s32, layout, 0x1c) +
                FIELD(s32, placement, 8) * 0x30;
            sprite->screenX = (s16)x;
            sprite->screenY = (s16)y;
            sprite->flags &= (u16)~4;

            if (enabled && FIELD(u16, descriptor, 0x0a) == selectedFlag) {
                auxiliary->screenX = (s16)x;
                auxiliary->screenY = (s16)y;
                auxiliary->flags &= (u16)~4;
            }
        }
    }
    func_ov046_0220bd14(panel);
}

/*
 * Write panel scroll/blend configuration and three slot positions into the
 * selected display engine's BG/OAM registers. Inputs are read from panel
 * origin +0x10C/+0x110, selected slots +0xC8, and layout records. No panel
 * fields are modified and no value is returned; this routine directly writes
 * Nintendo DS main- or sub-engine MMIO according to the font/display owner.
 */
extern "C" void func_ov046_0220c1d8(void *panel)
{
    bool mainEngine = FIELD(void *, panel, 0) == data_020f4e14;
    volatile u32 *registers = (volatile u32 *)(
        mainEngine ? 0x04000000 : 0x04001000);
    u32 systemOffset = FIELD(u32, gSystemState, 0x64);
    s32 slot;

    registers[0] = (registers[0] & ~0x1f00u) |
                   (FIELD(u32, panel, 0xc0) << 8);
    registers[7] = (systemOffset & 0x1ff) |
                   ((systemOffset << 16) & 0x01ff0000);

    for (slot = 0; slot < 3; ++slot) {
        s32 layoutIndex = FIELD(s32, panel, 0xc8 + slot * 4);
        const u8 *layout;
        s32 x;
        s32 y;

        if (layoutIndex < 0)
            continue;
        layout = data_ov046_0220cdf0 + layoutIndex * 0x28;
        x = FIELD(s32, panel, 0x10c) - 0x80 - FIELD(s32, layout, 0x18);
        y = FIELD(s32, panel, 0x110) - 0x60 - FIELD(s32, layout, 0x1c);
        registers[4 + slot] = ((u32)x & 0x1ff) |
                              (((u32)y << 16) & 0x01ff0000);
    }
}
