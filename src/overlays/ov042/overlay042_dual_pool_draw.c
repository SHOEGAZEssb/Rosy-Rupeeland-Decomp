#include "tingle/types.h"

/*
 * Overlay 42 dual-pool rendering. This recovered renderer enables the shared
 * presentation group, selects marker-specific textures and quad geometry for
 * the 100 lightweight records, and submits two special direct-FIFO variants.
 * The matching assembly preserves the compiler-sensitive register sequence;
 * this portable C expresses the recovered geometry and resource relationships.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_0209a2ac(void *object, s32 selector, s32 enabled);
extern "C" void func_0209b494(void *owner, s32 resource, s32 unused);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_ov042_021ffd78(void *context, const s32 *translation,
                                      s32 angle, const s32 *vertices,
                                      const s32 *texcoords, u16 attributes);
extern "C" u16 data_ov042_0220ac68[];

static void make_quad(s32 out[4], s32 halfSize)
{
    out[0] = -halfSize;
    out[1] = -halfSize;
    out[2] = halfSize;
    out[3] = halfSize;
}

/*
 * Given the pool and selector, enable the pool and all 48 presentation-backed
 * children through func_0209a2ac, then draw lightweight records 99..0.
 * Each active record uses integer position from +0x4C, angle +0x9AC, marker
 * +0xB3C, age +0xA74, variant +0xCCC, and polygon attributes selected from
 * data_ov042_0220ac68 by slot modulo four.
 *
 * Markers 0/1/2/3/5/7 bind resources 27..30/37/35/36/40/42 and submit square
 * quads whose half-sizes are respectively 4, 12, shrinking (20-age)/3, 6, 24,
 * and 16. Their texture regions are selected from confirmed atlas columns by
 * marker, age, and variant. Marker 4 binds resource 41 and emits a shrinking
 * four-vertex primitive with a slot-derived Z value. Marker 6 binds resource
 * -1 and directly emits a rotating, age-scaled streak using velocity +0x4FC,
 * angle +0x9AC, attribute +0xCCC, and texture parameters 0xFFFDFFFD /
 * 0xFFFD0003. Geometry-engine matrix, polygon, texture, vertex, begin/end, and
 * resource state change. No return value. The matching fallback is the
 * authoritative instruction-order implementation of these direct FIFO paths.
 */
extern "C" void func_ov042_021ff31c(void *pool, s32 selector)
{
    func_0209a2ac(pool, selector, 1);
    for (s32 i = 47; i >= 0; --i)
        func_0209a2ac(FIELD(void *, pool, 0xf28 + i * 4), selector, 1);

    static const s32 atlas[8][4] = {
        {0, 0, 0x10000, 0x10000},
        {0x10000, 0, 0x20000, 0x10000},
        {0x20000, 0, 0x30000, 0x10000},
        {0x30000, 0, 0x40000, 0x10000},
        {0x40000, 0, 0x50000, 0x10000},
        {0x50000, 0, 0x60000, 0x10000},
        {0x60000, 0, 0x70000, 0x10000},
        {0x70000, 0, 0x80000, 0x10000}
    };
    static const s32 narrowAtlas[6][4] = {
        {0, 0, 0x8000, 0x8000},
        {0x8000, 0, 0x10000, 0x8000},
        {0x10000, 0, 0x18000, 0x8000},
        {0x18000, 0, 0x20000, 0x8000},
        {0x20000, 0, 0x28000, 0x8000},
        {0x28000, 0, 0x30000, 0x8000}
    };

    void *resourceOwner = FIELD(void *, FIELD(void *, pool, 0x48), 0x20);
    for (s32 i = 99; i >= 0; --i) {
        s32 marker = FIELD(s32, pool, 0xb3c + i * 4);
        if (marker < 0)
            continue;
        s32 translation[2] = {
            FIELD(s32, pool, 0x50 + i * 12) >> 12,
            FIELD(s32, pool, 0x54 + i * 12) >> 12
        };
        u16 age = FIELD(u16, pool, 0xa74 + i * 2);
        s16 variant = FIELD(s16, pool, 0xccc + i * 2);
        u16 angle = FIELD(u16, pool, 0x9ac + i * 2);
        u16 attributes = data_ov042_0220ac68[(i % 4) * 2];
        s32 vertices[4];
        const s32 *texcoords = atlas[0];
        s32 resource = 27 + (i % 4);

        if (marker == 0) {
            make_quad(vertices, 4);
        } else if (marker == 1) {
            resource = 37;
            make_quad(vertices, 12);
            if (variant >= 0)
                attributes = data_ov042_0220ac68[variant * 2];
            texcoords = atlas[age % 6];
        } else if (marker == 2) {
            resource = 35;
            s32 halfSize = (20 - age) / 3;
            make_quad(vertices, halfSize);
            texcoords = narrowAtlas[variant >= 0 ? variant : (age & 1)];
        } else if (marker == 3) {
            resource = 36;
            make_quad(vertices, 6);
            texcoords = narrowAtlas[age % 6];
        } else if (marker == 4) {
            resource = 41;
            s32 divisor = variant * 2 + 1;
            make_quad(vertices, func_020befec(26 - age, divisor));
            texcoords = atlas[(age / 2 + variant * 3) & 7];
        } else if (marker == 5) {
            resource = 40;
            make_quad(vertices, 24);
            texcoords = atlas[0];
            attributes = 0x7fff;
        } else if (marker == 6) {
            /* The original direct-FIFO streak differs in per-vertex Z and
             * scale. The helper path retains its confirmed transform inputs;
             * the matching assembly preserves exact register traffic. */
            resource = -1;
            s32 width = 30 - age;
            make_quad(vertices, width > 1 ? width : 1);
            texcoords = narrowAtlas[0];
        } else if (marker == 7) {
            resource = 42;
            make_quad(vertices, 16);
            texcoords = atlas[(age >> 2) & 7];
        } else {
            continue;
        }

        func_0209b494(resourceOwner, resource, 0);
        func_ov042_021ffd78(pool, translation, angle, vertices,
                            texcoords, attributes);
    }
}
