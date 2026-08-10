/*
 * Native model and presentation of the recovered debug phase selector.
 *
 * Grid arithmetic, input priority, page cycling, touch bounds, and the
 * 16-frame transition preserve the game-owned behavior. DS display setup and
 * the eventual GamePhase_Start call remain outside this portable module.
 */
#include "tingle/native_phase_selector.h"

#include <stdio.h>

enum {
    PHASE_GRID_COLUMNS = 10,
    PHASE_GRID_ROWS = 9,
    PHASES_PER_PAGE = 90,
    PHASE_PAGE_COUNT = 3,
    PHASE_FADE_FRAMES = 16
};

void TingleNativePhaseSelector_Init(TingleNativePhaseSelector *selector)
{
    selector->state = 0;
    selector->selected_phase = -1;
    selector->column = 0;
    selector->row = 0;
    selector->page = 0;
    selector->fade_frames = 0;
    selector->debug_object_requested = 0;
}

static void BeginPhaseTransition(TingleNativePhaseSelector *selector)
{
    selector->state = 1;
    selector->fade_frames = PHASE_FADE_FRAMES;
}

TingleNativePhaseSelectorEvent TingleNativePhaseSelector_Update(
    TingleNativePhaseSelector *selector, const TingleNativeInput *input)
{
    u16 pressed = input->pressed;

    if (selector->state == 2) {
        /* Host-only escape from the unimplemented GamePhase_Start boundary. */
        if ((pressed & TINGLE_KEY_B) != 0) return TINGLE_NATIVE_PHASE_EVENT_BACK;
        return TINGLE_NATIVE_PHASE_EVENT_NONE;
    }

    if (selector->state == 1) {
        selector->fade_frames--;
        if (selector->fade_frames == 0) {
            selector->state = 2;
            return TINGLE_NATIVE_PHASE_EVENT_START_PHASE;
        }
        return TINGLE_NATIVE_PHASE_EVENT_NONE;
    }

    if (input->touching && input->touch_x >= 9 && input->touch_x < 249 &&
        input->touch_y >= 6 && input->touch_y < 186) {
        selector->column = (input->touch_x - 9) / 24;
        selector->row = (input->touch_y - 6) / 20;
        selector->selected_phase = selector->page * PHASES_PER_PAGE +
                                   selector->row * PHASE_GRID_COLUMNS +
                                   selector->column;
    }

    if ((pressed & TINGLE_KEY_B) != 0) {
        return TINGLE_NATIVE_PHASE_EVENT_BACK;
    }
    if (selector->selected_phase != -1) {
        BeginPhaseTransition(selector);
    } else if ((pressed & TINGLE_KEY_SELECT) != 0) {
        selector->debug_object_requested = 1;
        return TINGLE_NATIVE_PHASE_EVENT_DEBUG_OBJECT;
    } else if ((pressed & TINGLE_KEY_A) != 0) {
        selector->selected_phase = selector->page * PHASES_PER_PAGE +
                                   selector->row * PHASE_GRID_COLUMNS +
                                   selector->column;
        BeginPhaseTransition(selector);
    } else if ((pressed & TINGLE_KEY_R) != 0) {
        selector->page++;
        if (selector->page >= PHASE_PAGE_COUNT) selector->page = 0;
    } else if ((input->repeated & TINGLE_KEY_UP) != 0) {
        selector->row--;
        if (selector->row < 0) selector->row = PHASE_GRID_ROWS - 1;
    } else if ((input->repeated & TINGLE_KEY_DOWN) != 0) {
        selector->row++;
        if (selector->row >= PHASE_GRID_ROWS) selector->row = 0;
    } else if ((input->repeated & TINGLE_KEY_LEFT) != 0) {
        selector->column--;
        if (selector->column < 0) selector->column = PHASE_GRID_COLUMNS - 1;
    } else if ((input->repeated & TINGLE_KEY_RIGHT) != 0) {
        selector->column++;
        if (selector->column >= PHASE_GRID_COLUMNS) selector->column = 0;
    }
    return TINGLE_NATIVE_PHASE_EVENT_NONE;
}

static void DrawOutline(TingleNativeCanvas *canvas, s32 x, s32 y,
                        s32 width, s32 height, u32 color)
{
    TingleNativeCanvas_FillRect(canvas, x, y, width, 1, color);
    TingleNativeCanvas_FillRect(canvas, x, y + height - 1, width, 1, color);
    TingleNativeCanvas_FillRect(canvas, x, y, 1, height, color);
    TingleNativeCanvas_FillRect(canvas, x + width - 1, y, 1, height, color);
}

void TingleNativePhaseSelector_Draw(const TingleNativePhaseSelector *selector,
                                    TingleNativeCanvas *canvas)
{
    s32 row;
    s32 column;
    char text[48];

    TingleNativeCanvas_FillRect(canvas, 0, 0, canvas->width, canvas->height, 0x000b1118u);
    TingleNativeCanvas_FillRect(canvas, 0, TINGLE_SCREEN_HEIGHT, canvas->width,
                               TINGLE_SCREEN_HEIGHT, 0x00141b20u);
    TingleNativeCanvas_DrawText(canvas, 12, 14, "PHASE SELECTOR", 0x0078d878u, 2);
    (void)snprintf(text, sizeof(text), "PAGE %d - PHASES %03d-%03d", selector->page + 1,
                   selector->page * PHASES_PER_PAGE + 1,
                   (selector->page + 1) * PHASES_PER_PAGE);
    TingleNativeCanvas_DrawText(canvas, 12, 42, text, 0x00e0e8e0u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 58, "ARROWS: MOVE  W: PAGE", 0x00a0b0b8u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 70, "Z: START  X: BACK", 0x00a0b0b8u, 1);

    if (selector->state == 1) {
        (void)snprintf(text, sizeof(text), "PHASE %03d - FADE %02d",
                       selector->selected_phase + 1, selector->fade_frames);
        TingleNativeCanvas_DrawText(canvas, 12, 102, text, 0x00e0b060u, 1);
    } else if (selector->state == 2) {
        (void)snprintf(text, sizeof(text), "PHASE %03d - RUNTIME BARRIER",
                       selector->selected_phase + 1);
        TingleNativeCanvas_DrawText(canvas, 12, 102, text, 0x00e07070u, 1);
        TingleNativeCanvas_DrawText(canvas, 12, 118, "X: RETURN TO MENU", 0x00a0b0b8u, 1);
    } else if (selector->debug_object_requested) {
        TingleNativeCanvas_DrawText(canvas, 12, 102, "SELECT OBJECT: HOST BARRIER",
                                    0x00e0b060u, 1);
    }

    for (row = 0; row < PHASE_GRID_ROWS; ++row) {
        for (column = 0; column < PHASE_GRID_COLUMNS; ++column) {
            s32 value = selector->page * PHASES_PER_PAGE +
                        row * PHASE_GRID_COLUMNS + column + 1;
            s32 x = 12 + column * 24;
            s32 y = TINGLE_SCREEN_HEIGHT + 10 + row * 20;

            (void)snprintf(text, sizeof(text), "%03d", value);
            TingleNativeCanvas_DrawText(canvas, x, y, text, 0x00d8e0d0u, 1);
        }
    }
    DrawOutline(canvas, 9 + selector->column * 24,
                TINGLE_SCREEN_HEIGHT + 6 + selector->row * 20,
                24, 20, 0x0078d878u);
    DrawOutline(canvas, 11 + selector->column * 24,
                TINGLE_SCREEN_HEIGHT + 8 + selector->row * 20,
                20, 16, 0x00385838u);
}
