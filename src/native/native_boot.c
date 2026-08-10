/*
 * Recovered native boot and title-phase presentation.
 *
 * GamePhase_Bootstrap enters phase 225, whose scripts fade the Vanpool splash
 * in for 30 frames, hold for 60, fade out for 30, and request phase 90. Phase
 * 90 contributes the title sprite descriptors while its secondary overlay
 * loads the B000/B001/B002 text background. This host scene preserves that
 * program and asset data while replacing DS brightness, BG, and OBJ hardware.
 */
#include "tingle/native_boot.h"

#include <string.h>

enum {
    BOOT_SPLASH_PHASE = 225,
    BOOT_TITLE_PHASE = 90,
    BOOT_NEXT_PHASE = 5,
    BOOT_FADE_FRAMES = 30,
    BOOT_SPLASH_HOLD_END = 90,
    BOOT_SPLASH_END = 120
};

/* Loads the two background triplets issued by phase 225's recovered script. */
static s32 LoadSplashResources(TingleNativeData *data,
                               TingleNativeBootScene *scene)
{
    return TingleNativeGraphics_LoadResourceSet(
               data, "BGLibKatsu", 0xa135, 0xa136, 0xa137,
               &scene->splash_main) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "BGLibKatsu", 0xa132, 0xa133, 0xa134,
               &scene->splash_sub);
}

/* Loads phase 90 resources, taking OBJ IDs and positions from its descriptors. */
static s32 LoadTitleResources(TingleNativeData *data,
                              TingleNativeBootScene *scene)
{
    const TingleNativeActorDescriptor *logo;
    const TingleNativeActorDescriptor *copyright;

    if (!scene->phase.primary_descriptors_decoded ||
        scene->phase.primary_registration.descriptor_count < 3) return 0;
    logo = &scene->phase.primary_descriptors[1];
    copyright = &scene->phase.primary_descriptors[2];
    /* B000-B002 are the resource arguments to the secondary BG dispatcher. */
    return TingleNativeGraphics_LoadResourceSet(
               data, "BGLibOba", 0xb000, 0xb001, 0xb002,
               &scene->title_background) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "anmLibKatsu", logo->character_resource_id,
               logo->palette_resource_id, logo->layout_resource_id,
               &scene->title_logo) &&
           TingleNativeGraphics_LoadResourceSet(
               data, "anmLibKatsu", copyright->character_resource_id,
               copyright->palette_resource_id, copyright->layout_resource_id,
               &scene->title_copyright);
}

/* Enters phase 90 through the same metadata/overlay boundary used by debugging. */
static s32 EnterTitlePhase(TingleNativeBootScene *scene,
                           TingleNativeData *data)
{
    TingleNativeGamePhaseBoundary_Destroy(&scene->phase);
    if (!TingleNativeGamePhaseBoundary_Start(&scene->phase, data,
                                              scene->game_work,
                                              BOOT_TITLE_PHASE) ||
        !LoadTitleResources(data, scene)) return 0;
    scene->state = TINGLE_NATIVE_BOOT_TITLE;
    scene->frame = 0;
    return 1;
}

/* Constructs phase 225 and validates the archive-backed publisher layers. */
s32 TingleNativeBootScene_Init(TingleNativeBootScene *scene,
                               TingleNativeData *data,
                               TingleNativeGameWork *game_work)
{
    if (scene == NULL || data == NULL) return 0;
    memset(scene, 0, sizeof(*scene));
    scene->game_work = game_work;
    if (!TingleNativeGamePhaseBoundary_Start(&scene->phase, data, game_work,
                                              BOOT_SPLASH_PHASE) ||
        !LoadSplashResources(data, scene)) {
        TingleNativeBootScene_Destroy(scene);
        return 0;
    }
    scene->state = TINGLE_NATIVE_BOOT_SPLASH;
    scene->resources_loaded = 1;
    return 1;
}

/* Advances script-confirmed waits, fades, and the title-to-phase-five request. */
void TingleNativeBootScene_Update(TingleNativeBootScene *scene,
                                  TingleNativeData *data,
                                  const TingleNativeInput *input)
{
    if (scene == NULL || input == NULL || !scene->resources_loaded) return;
    ++scene->frame;
    if (scene->state == TINGLE_NATIVE_BOOT_SPLASH) {
        if (scene->frame >= BOOT_SPLASH_END && !EnterTitlePhase(scene, data))
            scene->resources_loaded = 0;
    } else if (scene->state == TINGLE_NATIVE_BOOT_TITLE) {
        if (scene->frame >= BOOT_FADE_FRAMES &&
            (((input->pressed & (TINGLE_KEY_A | TINGLE_KEY_START)) != 0) ||
             input->touching)) {
            scene->state = TINGLE_NATIVE_BOOT_LEAVING_TITLE;
            scene->frame = 0;
        }
    } else if (scene->state == TINGLE_NATIVE_BOOT_LEAVING_TITLE &&
               scene->frame >= BOOT_FADE_FRAMES) {
        TingleNativeGamePhaseBoundary_Destroy(&scene->phase);
        if (TingleNativeGamePhaseBoundary_Start(&scene->phase, data,
                                                 scene->game_work,
                                                 BOOT_NEXT_PHASE)) {
            scene->state = TINGLE_NATIVE_BOOT_NEXT_PHASE;
            scene->frame = 0;
        } else {
            scene->resources_loaded = 0;
        }
    }
}

/* Applies the DS darken-brightness coefficient to both stacked screens. */
static void DarkenCanvas(TingleNativeCanvas *canvas, s32 coefficient)
{
    size_t pixel_count;
    size_t index;

    if (coefficient <= 0) return;
    if (coefficient > 16) coefficient = 16;
    pixel_count = (size_t)canvas->stride * canvas->height;
    for (index = 0; index < pixel_count; ++index) {
        u32 color = canvas->pixels[index];
        u32 scale = (u32)(16 - coefficient);
        u32 red = ((color >> 16) & 0xff) * scale / 16;
        u32 green = ((color >> 8) & 0xff) * scale / 16;
        u32 blue = (color & 0xff) * scale / 16;

        canvas->pixels[index] = (red << 16) | (green << 8) | blue;
    }
}

/* Draws phase 225, phase 90, or the metadata boundary reached after input. */
void TingleNativeBootScene_Draw(const TingleNativeBootScene *scene,
                                TingleNativeCanvas *canvas)
{
    s32 darkness = 0;

    if (scene == NULL || canvas == NULL) return;
    TingleNativeCanvas_FillRect(canvas, 0, 0, canvas->width, canvas->height, 0);
    if (!scene->resources_loaded) {
        TingleNativeCanvas_DrawText(canvas, 12, 12,
                                    "RETAIL BOOT DATA UNAVAILABLE",
                                    0x00e07070u, 1);
        return;
    }
    if (scene->state == TINGLE_NATIVE_BOOT_SPLASH) {
        (void)TingleNativeGraphics_DrawTextBackground(&scene->splash_main,
                                                       canvas, 0);
        (void)TingleNativeGraphics_DrawTextBackground(&scene->splash_sub,
                                                       canvas,
                                                       TINGLE_SCREEN_HEIGHT);
        if (scene->frame < BOOT_FADE_FRAMES)
            darkness = 16 - scene->frame * 16 / BOOT_FADE_FRAMES;
        else if (scene->frame >= BOOT_SPLASH_HOLD_END)
            darkness = (scene->frame - BOOT_SPLASH_HOLD_END) * 16 /
                       BOOT_FADE_FRAMES;
    } else if (scene->state == TINGLE_NATIVE_BOOT_TITLE ||
               scene->state == TINGLE_NATIVE_BOOT_LEAVING_TITLE) {
        const TingleNativeActorDescriptor *logo =
            &scene->phase.primary_descriptors[1];
        const TingleNativeActorDescriptor *copyright =
            &scene->phase.primary_descriptors[2];

        (void)TingleNativeGraphics_DrawTextBackground(&scene->title_background,
                                                       canvas,
                                                       TINGLE_SCREEN_HEIGHT);
        (void)TingleNativeGraphics_DrawSpriteCell(&scene->title_logo, canvas,
                                                   logo->position_x,
                                                   logo->position_y, 0);
        (void)TingleNativeGraphics_DrawSpriteCell(&scene->title_copyright,
                                                   canvas,
                                                   copyright->position_x,
                                                   copyright->position_y, 0);
        if (scene->state == TINGLE_NATIVE_BOOT_TITLE &&
            scene->frame < BOOT_FADE_FRAMES)
            darkness = 16 - scene->frame * 16 / BOOT_FADE_FRAMES;
        else if (scene->state == TINGLE_NATIVE_BOOT_LEAVING_TITLE)
            darkness = scene->frame * 16 / BOOT_FADE_FRAMES;
    } else {
        TingleNativeGamePhaseBoundary_Draw(&scene->phase, canvas);
    }
    DarkenCanvas(canvas, darkness);
}

/* Releases every allocation retained across boot and title phases. */
void TingleNativeBootScene_Destroy(TingleNativeBootScene *scene)
{
    if (scene == NULL) return;
    TingleNativeGamePhaseBoundary_Destroy(&scene->phase);
    TingleNativeGraphics_DestroyResourceSet(&scene->splash_main);
    TingleNativeGraphics_DestroyResourceSet(&scene->splash_sub);
    TingleNativeGraphics_DestroyResourceSet(&scene->title_background);
    TingleNativeGraphics_DestroyResourceSet(&scene->title_logo);
    TingleNativeGraphics_DestroyResourceSet(&scene->title_copyright);
    memset(scene, 0, sizeof(*scene));
}
