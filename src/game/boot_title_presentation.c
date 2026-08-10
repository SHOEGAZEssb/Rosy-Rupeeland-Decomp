#include "tingle/boot_title_presentation.h"
#include "tingle/system.h"

#include <string.h>

/*
 * Recovered boot presentation for phase 225 and title phase 90.
 *
 * Phase 225's script submits BGLibKatsu A135/A136/A137 to the main display
 * and A132/A133/A134 to the sub display, then performs 30-frame fade-in,
 * 60-frame hold, and 30-frame fade-out commands before requesting phase 90.
 * Overlay 25 submits BGLibKatsu A13B/A13C/A13D for the title BG and places
 * logo resources 241B/241C/241D at (128,-176) and copyright resources
 * 2421/2422/2423 at (128,176). The title script accepts A, Start, or touch
 * after fade-in and performs a 30-frame fade-out. Native calls below are only
 * data/DS-hardware boundaries; phase order, resource selection, placement,
 * and timing live here.
 */

enum {
    BOOT_FADE_FRAMES = 30,
    SPLASH_HOLD_END_FRAME = 90,
    SPLASH_END_FRAME = 120,
    TITLE_LOGO_X = 128,
    TITLE_LOGO_Y = -176,
    TITLE_COPYRIGHT_X = 128,
    TITLE_COPYRIGHT_Y = 176,
    TITLE_FIELD_VIEW_X = 256,
    TITLE_FIELD_VIEW_Y = 192
};

/* Phase 90 resource_04 at 0x020d07a0 in the recovered phase metadata. */
static const TingleNativeFieldConfig sTitleMainFieldConfig = {
    0x54baa8, 0x4ad4,
    0x55057c, 0xe8,
    0x550664, 0x910,
    {0x550f74, 0x551298}, {0x324, 0x324},
    48, 36
};

/* Phase 90 resource_08 at 0x020cdc80 in the recovered phase metadata. */
static const TingleNativeFieldConfig sTitleSubFieldConfig = {
    0xb38ed8, 0x3ec8,
    0xb3cda0, 0xdc,
    0xb3ce7c, 0x914,
    {0xb3d790, 0xb3dab4}, {0x324, 0x1a4},
    48, 36
};

/* Load the two background triplets submitted by the phase-225 script. */
static s32 LoadSplash(BootTitlePresentation *self, TingleNativeData *data)
{
    return TingleNativeGraphics_LoadResourceSet(
               data, "BGLibKatsu", gSystemState.language,
               0xa135, 0xa136, 0xa137,
               &self->splashMain) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "BGLibKatsu", gSystemState.language,
               0xa132, 0xa133, 0xa134,
               &self->splashSub);
}

/* Load the phase-90 fields and overlay-25 BG and sprite descriptors. */
static s32 LoadTitle(BootTitlePresentation *self, TingleNativeData *data)
{
    return TingleNativeGraphics_LoadField(
               data, &sTitleMainFieldConfig, &self->titleMainField) &&
           TingleNativeGraphics_LoadField(
               data, &sTitleSubFieldConfig, &self->titleSubField) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "BGLibKatsu", gSystemState.language,
               0xa13b, 0xa13c, 0xa13d,
               &self->titleBackground) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "anmLibKatsu", gSystemState.language,
               0x241b, 0x241c, 0x241d,
               &self->titleLogo) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "anmLibKatsu", gSystemState.language,
               0x2421, 0x2422, 0x2423,
               &self->titleCopyright);
}

/* Initialize at phase 225 frame zero; failure leaves no owned resources. */
s32 BootTitlePresentation_Init(BootTitlePresentation *self,
                               TingleNativeData *data)
{
    if (self == NULL || data == NULL) return 0;
    memset(self, 0, sizeof(*self));
    if (!LoadSplash(self, data)) {
        BootTitlePresentation_Destroy(self);
        return 0;
    }
    self->state = BOOT_TITLE_PRESENTATION_SPLASH;
    return 1;
}

/* Release every ROM-backed resource buffer owned by this presentation. */
void BootTitlePresentation_Destroy(BootTitlePresentation *self)
{
    if (self == NULL) return;
    TingleNativeGraphics_DestroyResourceSet(&self->splashMain);
    TingleNativeGraphics_DestroyResourceSet(&self->splashSub);
    TingleNativeGraphics_DestroyResourceSet(&self->titleBackground);
    TingleNativeGraphics_DestroyResourceSet(&self->titleLogo);
    TingleNativeGraphics_DestroyResourceSet(&self->titleCopyright);
    TingleNativeGraphics_DestroyField(&self->titleMainField);
    TingleNativeGraphics_DestroyField(&self->titleSubField);
    memset(self, 0, sizeof(*self));
}

/*
 * Advance one script frame. Returns zero only if phase-90 resource loading
 * fails; FINISHED denotes the canonical request to leave title for phase 5.
 */
s32 BootTitlePresentation_Update(BootTitlePresentation *self,
                                 TingleNativeData *data,
                                 const TingleNativeHostInput *input)
{
    u16 pressed;

    if (self == NULL || data == NULL || input == NULL) return 0;
    pressed = (u16)(input->keys & (u16)~self->previousKeys);
    self->previousKeys = input->keys;
    self->frame++;
    if (self->state == BOOT_TITLE_PRESENTATION_SPLASH &&
        self->frame >= SPLASH_END_FRAME) {
        if (!LoadTitle(self, data)) return 0;
        self->state = BOOT_TITLE_PRESENTATION_TITLE;
        self->frame = 0;
    } else if (self->state == BOOT_TITLE_PRESENTATION_TITLE &&
               self->frame >= BOOT_FADE_FRAMES &&
               (((pressed & (TINGLE_KEY_A | TINGLE_KEY_START)) != 0) ||
                input->touching)) {
        self->state = BOOT_TITLE_PRESENTATION_LEAVING_TITLE;
        self->frame = 0;
    } else if (self->state == BOOT_TITLE_PRESENTATION_LEAVING_TITLE &&
               self->frame >= BOOT_FADE_FRAMES) {
        self->state = BOOT_TITLE_PRESENTATION_FINISHED;
        self->frame = 0;
    }
    return 1;
}

/* Draw the current recovered phase and apply its master-brightness command. */
s32 BootTitlePresentation_Draw(const BootTitlePresentation *self,
                               TingleNativeCanvas *canvas)
{
    s32 darkness = 0;
    s32 drawn = 1;

    if (self == NULL || canvas == NULL || canvas->pixels == NULL) return 0;
    memset(canvas->pixels, 0,
           sizeof(*canvas->pixels) * (size_t)canvas->stride *
               (size_t)canvas->height);
    if (self->state == BOOT_TITLE_PRESENTATION_SPLASH) {
        drawn = TingleNativeGraphics_DrawTextBackground(
                    &self->splashMain, canvas, 0) &&
                TingleNativeGraphics_DrawTextBackground(
                    &self->splashSub, canvas, TINGLE_SCREEN_HEIGHT);
        if (self->frame < BOOT_FADE_FRAMES)
            darkness = 16 - self->frame * 16 / BOOT_FADE_FRAMES;
        else if (self->frame >= SPLASH_HOLD_END_FRAME)
            darkness = (self->frame - SPLASH_HOLD_END_FRAME) * 16 /
                       BOOT_FADE_FRAMES;
    } else if (self->state == BOOT_TITLE_PRESENTATION_TITLE ||
               self->state == BOOT_TITLE_PRESENTATION_LEAVING_TITLE) {
        drawn = TingleNativeGraphics_DrawField(
                    &self->titleMainField, canvas, 0,
                    TITLE_FIELD_VIEW_X, TITLE_FIELD_VIEW_Y) &&
                TingleNativeGraphics_DrawField(
                    &self->titleSubField, canvas, TINGLE_SCREEN_HEIGHT,
                    TITLE_FIELD_VIEW_X, TITLE_FIELD_VIEW_Y) &&
                TingleNativeGraphics_DrawTextBackgroundTransparent(
                    &self->titleBackground, canvas, TINGLE_SCREEN_HEIGHT) &&
                TingleNativeGraphics_DrawSpriteCell(
                    &self->titleLogo, canvas, TITLE_LOGO_X, TITLE_LOGO_Y, 0) &&
                TingleNativeGraphics_DrawSpriteCell(
                    &self->titleCopyright, canvas, TITLE_COPYRIGHT_X,
                    TITLE_COPYRIGHT_Y, 0);
        if (self->state == BOOT_TITLE_PRESENTATION_TITLE &&
            self->frame < BOOT_FADE_FRAMES)
            darkness = 16 - self->frame * 16 / BOOT_FADE_FRAMES;
        else if (self->state == BOOT_TITLE_PRESENTATION_LEAVING_TITLE)
            darkness = self->frame * 16 / BOOT_FADE_FRAMES;
    } else {
        darkness = 16;
    }
    TingleNativeGraphics_Darken(canvas, darkness);
    return drawn;
}
