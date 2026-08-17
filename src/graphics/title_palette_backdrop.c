/*
 * Main/sub BG palette backdrop setters shared by title-style presentation
 * scenes. Each setter updates color zero of one DS engine immediately.
 */
#include "tingle/types.h"

/* Write color to the main engine's first BG palette entry at 0x05000000. */
void TitlePalette_SetMainBackdrop(u16 color)
{
    *(volatile u16 *)0x05000000 = color;
}

/* Write color to the sub engine's first BG palette entry at 0x05000400. */
void TitlePalette_SetSubBackdrop(u16 color)
{
    *(volatile u16 *)0x05000400 = color;
}
