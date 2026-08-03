# ARM9 startup map

This page tracks the initial ARM9 execution path. Names in the confirmed
tables are backed either by an exact NitroSDK source pattern or by direct
hardware-register behavior. Unidentified game routines retain their address
names until their roles are clear from multiple callers.

## Entry and main loop

| Address | Name | Role |
| --- | --- | --- |
| `0x02000800` | `Entry` | ARM9 CRT startup and autoload/BSS setup |
| `0x02000BA0` | `main` | Game initialization and perpetual frame loop |
| `0x02000ED8` | `PAD_Read` | Reads active-high A/B/d-pad/shoulder/X/Y/debug input |
| `0x02000F10` | `UpdateSystemFrame` | Per-frame timing, input, reset, and system-state update |
| `0x02001064` | `UpdateKeyState` | Produces pressed, released, held, and repeated key masks |

`main` initializes SDK and game subsystems through approximately
`0x02000D24`. Its persistent frame loop begins at approximately `0x02000D28`
and returns to that address after input, game-state, and rendering updates.

`PAD_Read` is the compiler-emitted form of the NitroSDK inline function: it
combines `REG_KEYINPUT` (`0x04000130`) with the shared X/Y button word
(`0x027FFFA8`), inverts the active-low bits, and masks the result with
`PAD_ALL_MASK` (`0x2FFF`).

## Confirmed SDK initialization path

| Address | Symbol | Evidence |
| --- | --- | --- |
| `0x020B24EC` | `OS_WaitIrq` | IRQ flag clearing and sleep loop |
| `0x020B4FC4` | `OS_WaitVBlankIntr` | Spin wait followed by `OS_WaitIrq(TRUE, OS_IE_V_BLANK)` |
| `0x020B4FEC` | `OS_ResetSystem` | DMA shutdown, reset parameter write, and reset handoff |
| `0x020B73A4` | `PXI_Init` | Tail call to `PXI_InitFifo` |
| `0x020B7588` | `PXI_IsCallbackReady` | Tests the per-processor FIFO tag bit |
| `0x020B75B0` | `PXI_SetFifoRecvCallback` | Installs the tag callback and updates its ready bit |
| `0x020B761C` | `PXI_InitFifo` | FIFO register, callback table, IRQ, and handshake setup |
| `0x020B9158` | `FS_Init` | One-time guard followed by `FSi_InitRom` |
| `0x020B91E8` | `FSi_InitRom` | CARD and ROM archive setup using FNT/FAT header regions |
| `0x020BB22C` | `MicCommonCallback` | Decodes microphone FIFO replies and dispatches callbacks |
| `0x020BB36C` | `MIC_Init` | PXI tag 9 handshake and microphone callback registration |
| `0x020BBD80` | `PMi_CommonCallback` | Decodes power-management FIFO replies and dispatches callbacks |
| `0x020BBE6C` | `PM_Init` | PXI tag 8 handshake and PM callback registration |

## Confirmed graphics and memory initialization

| Address | Symbol | Role |
| --- | --- | --- |
| `0x020AE1F8` | `FX_Init` | Fixed-point library initialization; empty in this final build |
| `0x020AE2F8` | `GX_DispOn` | Enables the saved main-display mode |
| `0x020AE344` | `GX_VBlankIntr` | Controls the DISPSTAT VBlank IRQ-enable bit |
| `0x020AE374` | `GX_HBlankIntr` | Controls the DISPSTAT HBlank IRQ-enable bit |
| `0x020AE3A4` | `GX_Init` | Initializes both 2D engines and VRAM ownership state |
| `0x020AE528` | `GX_InitGXState` | Clears the SDK VRAM state and bank registers |
| `0x020AE6F0` | `GX_DisableBankForLCDC` | Releases LCDC-mapped VRAM banks |
| `0x020AEC30` | `GX_SetBankForLCDC` | Maps selected VRAM banks to LCDC |
| `0x020B0258` | `G3X_InitTable` | Clears edge, fog, and toon tables |
| `0x020B0474` | `G3X_InitMtxStack` | Resets and initializes geometry matrix stacks |
| `0x020B0524` | `G3X_ClearFifo` | Clears the geometry FIFO and waits until idle |
| `0x020B05E0` | `G3X_Init` | Initializes the 3D geometry engine |
| `0x020B5744` | `MI_DmaFill32` | Synchronous 32-bit DMA fill |
| `0x020B5808` | `MIi_CpuClear32` | Word-at-a-time CPU fill primitive |
| `0x020B5834` | `MIi_CpuClearFast` | Eight-word CPU fill primitive |
| `0x020B5984` | `MI_CpuCopy8` | Alignment-safe byte copy used by game-work initialization |

The CRT path reaches `InitRuntime` (`0x02002330`), which calls `OS_Init`,
`OS_InitThread`, `OS_InitTick`, and the game heap initializer at `0x02002638`
before entering `main`.

The source comparison uses the public NitroSDK reconstruction only as a
reference. It is intentionally kept under the ignored `build/references`
directory and is not part of this repository.

## Runtime helper under review

`0x020C0900` walks the constructor pointer range beginning at `0x020CDC24`
and calls every non-null entry. Its behavior is the static-initializer runner,
but the exact runtime-library symbol spelling remains unconfirmed, so the
address-based name is retained for now.

The inferred input-state layout and its update behavior are documented in
[system.md](system.md).
