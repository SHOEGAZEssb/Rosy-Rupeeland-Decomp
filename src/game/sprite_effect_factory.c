/* Resident sprite-effect preset selection and slot allocation. */

#include "tingle/heap.h"
#include "tingle/sprite_effect.h"

extern const char data_020f3308[];
extern s32 func_020befec(s32 numerator, s32 denominator);

/*
 * Configure and allocate the effect kind requested by the caller. The manager
 * owns the new 0x74-byte instance, bounds are copied into it by the canonical
 * constructor, and the fourth argument supplies the one preset-dependent
 * scalar. Returns the descending manager-slot index, or 0xff when full.
 * Unknown kinds preserve retail's no-allocation return of the free slot.
 */
u32 func_020a4df0(SpriteEffectManager *manager, s32 kind,
                  const SpriteEffectBounds *bounds, s32 parameter)
{
    SpriteEffectConfig config;
    SpriteEffectInstance *effect;
    s32 slot;

    func_020a32e0(&config);
    for (slot = SPRITE_EFFECT_SLOT_COUNT - 1; slot >= 0; --slot) {
        if (manager->slots04[slot] != 0)
            continue;

        switch (kind) {
        case 0:
            config.mode00 = 0;
            config.count02 = 0x28;
            config.velocity14 = 0x5000;
            config.velocity18 = 0x5000;
            config.descriptor1c = 0x4cd;
            config.acceleration20 = -0x6000;
            config.angle24 = 0x3000;
            config.lifetime28 = (s16)parameter;
            config.lifetimeRange2a = 0x24;
            config.flags34 = 1;
            config.animation41 = 3;
            config.tiles42 = 5;
            config.palettes43 = 3;
            break;

        case 1:
            config.mode00 = 1;
            config.count02 = 6;
            config.lifetime28 = 0x7fff;
            config.lifetimeRange2a = 0x3c;
            config.start2c = (s16)parameter;
            config.startRange2e = (s16)(parameter >> 1);
            config.scale30 = 0x800;
            config.scaleRange32 = 0x19a;
            config.color36 = 0;
            break;

        case 2:
            config.mode00 = 1;
            config.count02 = 6;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x3c;
            config.scale30 = 0x1800;
            config.color36 = 0;
            break;

        case 3:
        case 4:
        case 5:
            config.mode00 = kind == 4 ? 8 : 0;
            config.count02 = 8;
            config.descriptor1c = (u32)-0x11f;
            config.angle24 = 0x4cd;
            config.lifetime28 = 0x10;
            config.lifetimeRange2a = 0x1e;
            config.start2c = (s16)parameter;
            config.startRange2e = (s16)(parameter >> 1);
            config.scale30 = 0x14cd;
            config.scaleRange32 = 0x333;
            config.animation41 = kind == 3 ? 4 : (kind == 4 ? 0x11 : 0x12);
            config.tiles42 = 6;
            config.palettes43 = 5;
            break;

        case 6:
        case 10:
            config.mode00 = 2;
            config.count02 = 0x28;
            config.velocity14 = 0x6000;
            config.velocity18 = 0x2000;
            config.descriptor1c = 0x11f;
            config.acceleration20 = -0x2000;
            config.angle24 = 0x1800;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x20;
            config.start2c = 8;
            config.scale30 = 0x2000;
            config.scaleRange32 = 0xccd;
            config.flags34 = 1;
            config.initialCount3e = 0x28;
            config.animation41 = kind == 6 ? 6 : 0x1a;
            config.tiles42 = 8;
            config.palettes43 = 4;
            break;

        case 7:
        case 9:
            /* Retail expresses these linear terms as rounded fx32 products. */
            config.mode00 = kind == 7 ? 4 : 0;
            config.velocity14 = (s32)(0x1000 + (s64)parameter * 0xf6);
            config.velocity18 = config.velocity14;
            config.descriptor1c = 0x7b;
            config.acceleration20 =
                (s32)(-0x333 - (s64)parameter * 0x19a);
            config.angleRange26 = 0x7b;
            config.lifetime28 = 6;
            config.lifetimeRange2a = 0x28;
            config.start2c = 2;
            config.scale30 = (s16)(0xccd + (s64)parameter * 0x171);
            config.scaleRange32 = 0x333;
            config.flags34 = 1;
            config.initialCount3e = 7;
            config.distribution40 = 2;
            config.animation41 = kind == 7 ? 9 : 0x1e;
            config.tiles42 = 8;
            config.palettes43 = 5;
            break;

        case 8:
            config.mode00 = 4;
            config.count02 = 5;
            config.velocity14 = (s32)(0x1666 + (s64)parameter * 0x19a);
            config.velocity18 = 0;
            config.descriptor1c = 0x148;
            config.acceleration20 =
                (s32)(-0x1e66 - (s64)parameter * 0xf6);
            config.angle24 = 0xb33;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x30;
            config.start2c = 8;
            config.scale30 = 0x666;
            config.scaleRange32 = 0x19a;
            config.flags34 = 1;
            config.initialCount3e = 5;
            config.animation41 = 9;
            config.tiles42 = 8;
            config.palettes43 = 6;
            break;

        case 11:
            config.mode00 = 2;
            config.count02 = 0x28;
            config.velocity14 = 0x7000;
            config.velocity18 = 0x2000;
            config.descriptor1c = (u32)-0xa4;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x2a;
            config.scaleRange32 = 0x99a;
            config.initialCount3e = 0x28;
            config.animation41 = 5;
            config.tiles42 = 7;
            config.palettes43 = 6;
            break;

        case 12:
            config.mode00 = 2;
            config.count02 = 1;
            config.descriptor1c = (u32)-0xa4;
            config.angle24 = 0x19a;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x1c;
            config.scaleRange32 = 0x19a;
            config.initialCount3e = 1;
            config.animation41 = 5;
            config.tiles42 = 7;
            config.palettes43 = 4;
            break;

        case 13:
            config.mode00 = 4;
            config.count02 = 0x28;
            config.velocity14 = 0x7000;
            config.velocity18 = 0x2000;
            config.descriptor1c = (u32)-0xa4;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x30;
            config.scaleRange32 = 0x99a;
            config.initialCount3e = 0x28;
            config.animation41 = 9;
            config.tiles42 = 8;
            config.palettes43 = 6;
            break;

        case 14:
        case 15:
        case 16:
        case 18:
        case 19:
            config.mode00 = 4;
            config.count02 = (u16)(func_020befec(parameter, 0x2b2) + 5);
            config.velocity14 = parameter;
            config.velocity18 = parameter;
            config.descriptor1c = (u32)-0xa4;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x30;
            config.scaleRange32 = 0x99a;
            config.initialCount3e = (u16)(config.count02 & 0xff);
            config.distribution40 = 1;
            if (kind == 14)
                config.animation41 = 9;
            else if (kind == 15)
                config.animation41 = 0x13;
            else if (kind == 16)
                config.animation41 = 0x14;
            else if (kind == 18)
                config.animation41 = 0x16;
            else
                config.animation41 = 0x0a;
            config.tiles42 = 8;
            config.palettes43 = 6;
            break;

        case 17:
            config.count02 = (u16)(func_020befec(parameter, 0x2b2) + 5);
            config.velocity14 = parameter;
            config.velocity18 = parameter;
            config.descriptor1c = (u32)-0xa4;
            config.angleRange26 = 0x11f;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x31;
            config.scaleRange32 = 0x99a;
            config.initialCount3e = (u16)(config.count02 & 0xff);
            config.distribution40 = 1;
            config.animation41 = 5;
            config.tiles42 = 7;
            config.palettes43 = 7;
            break;

        case 20:
            config.count02 = 1;
            config.velocity14 = 0x800;
            config.velocity18 = 0x800;
            config.descriptor1c = 0x19a;
            config.acceleration20 = -0x800;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 9;
            config.scale30 = (s16)parameter;
            config.animation41 = 7;
            config.tiles42 = 3;
            config.palettes43 = 3;
            break;

        case 21:
            config.count02 = 1;
            config.descriptor1c = 0x19a;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x18;
            config.scale30 = (s16)parameter;
            config.animation41 = 8;
            config.tiles42 = 8;
            config.palettes43 = 3;
            break;

        case 22:
        case 23:
        case 24:
            config.mode00 = 3;
            config.count02 = 1;
            config.lifetime28 = 2;
            config.lifetimeRange2a = (s16)parameter;
            config.distribution40 = 4;
            config.animation41 = kind == 22 ? 0x17 : (kind == 23 ? 0x19 : 0x18);
            config.tiles42 = 3;
            config.palettes43 = 3;
            break;

        case 25:
            config.mode00 = 3;
            config.count02 = 1;
            config.velocity14 = 0x19a;
            config.velocity18 = 0x19a;
            config.acceleration20 = -0xb33;
            config.angle24 = 0x19a;
            config.lifetime28 = 1;
            config.lifetimeRange2a = (s16)parameter;
            config.start2c = 0x14;
            config.startRange2e = 5;
            config.scale30 = 0xe66;
            config.scaleRange32 = 0x800;
            config.animation41 = 0x0b;
            config.tiles42 = 3;
            config.palettes43 = 6;
            break;

        case 26:
        case 27:
            config.mode00 = 3;
            config.count02 = kind == 26 ? 1 : 7;
            config.velocity14 = 0x19a;
            config.velocity18 = 0x19a;
            config.acceleration20 = -0x1000;
            config.angle24 = 0x19a;
            config.lifetime28 = kind == 26 ? 1 : 0x78;
            config.lifetimeRange2a = (s16)parameter;
            config.start2c = 0x14;
            config.startRange2e = 5;
            config.scale30 = 0xccd;
            config.scaleRange32 = 0x666;
            config.animation41 = 0x0c;
            config.tiles42 = 3;
            config.palettes43 = 6;
            break;

        case 28:
            config.mode00 = 4;
            config.count02 = 1;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x30;
            config.start2c = 0x14;
            config.scale30 = 0x119a;
            config.scaleRange32 = 0x333;
            config.color36 = 0;
            config.animation41 = 0x0d;
            config.tiles42 = 8;
            config.palettes43 = 6;
            break;

        case 29:
            config.mode00 = 4;
            config.count02 = 1;
            config.velocity14 = 0x4cd;
            config.velocity18 = 0x19a;
            config.descriptor1c = (u32)-0x19;
            config.acceleration20 = -0x4cd;
            config.angle24 = 0x19a;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x28;
            config.start2c = 0;
            config.scale30 = 0x14cd;
            config.scaleRange32 = 0x4cd;
            config.animation41 = 0x0e;
            config.tiles42 = 4;
            config.palettes43 = 0x0a;
            break;

        case 30:
            config.mode00 = 9;
            config.count02 = 1;
            config.velocity14 = 0x2000;
            config.descriptor1c = 0x2b8;
            config.acceleration20 = 0x52;
            config.angle24 = 0x333;
            config.angleRange26 = 0x39;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x14;
            config.color36 = 0;
            config.alpha3c = (u16)parameter;
            break;

        case 31:
            config.mode00 = 10;
            config.count02 = 1;
            config.descriptor1c = (u32)-0x19a;
            config.acceleration20 = -0x800;
            config.angle24 = 0x1000;
            config.angleRange26 = 0x39;
            config.lifetime28 = 1;
            config.color36 = 0;
            break;

        case 32:
            config.count02 = 0x32;
            config.velocity14 = func_020befec(
                bounds->maximum_x - bounds->minimum_x, -0x30);
            config.velocity18 = func_020befec(
                bounds->maximum_y - bounds->minimum_y, -0x30);
            config.descriptor1c = 0xa4;
            config.acceleration20 = -0x1333;
            config.angle24 = 0xcd;
            config.angleRange26 = 0x14;
            config.lifetime28 = 1;
            config.lifetimeRange2a = 0x30;
            config.scaleRange32 = 0xb33;
            config.color36 = 0;
            config.initialCount3e = 0x32;
            config.distribution40 = 3;
            config.animation41 = 0x15;
            config.tiles42 = 8;
            config.palettes43 = 6;
            break;

        default:
            return (u8)slot;
        }

        func_020a376c(&config.bounds04, bounds);
        effect = (SpriteEffectInstance *)Heap_Alloc(
            sizeof(SpriteEffectInstance), data_020f3308, 4, &gHeapContext);
        if (effect != 0)
            effect = func_020a3480(effect, manager->owner00, &config);
        manager->slots04[slot] = effect;
        return (u8)slot;
    }
    return 0xff;
}
