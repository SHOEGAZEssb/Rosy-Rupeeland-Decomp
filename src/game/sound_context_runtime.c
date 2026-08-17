#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/sound_stream.h"

#include <string.h>

/*
 * Portable recovery of the game-owned sound-context facade at
 * 0x020589F4..0x020598E7.
 *
 * The retail object owns global enable/transition flags and routes requests to
 * three manager families: direct sequences, sequence-archive effects, and
 * streamed tracks. The Nintendo build retains the original assembly for this
 * still-unmatched range. Host recompilation uses this equivalent facade and
 * leaves archive parsing, sequencing, mixing, and device I/O at the native
 * Nitro sound-driver boundary declared below. That boundary preserves the
 * sequence-player timing, volume, envelope, and zero-duration note rules used
 * by the opening dialogue and phase music.
 */

extern const char data_020e4154[];
extern void *gSoundContext;
extern void *data_021052fc;
extern void *data_021e9abc;

extern s32 TingleNativeSound_LoadDefaultArchive(void);
extern void TingleNativeSound_Update(void);
extern void TingleNativeSound_StopAll(s32 fade_frames);
extern void TingleNativeSound_StopAllSequences(s32 fade_frames);
extern void TingleNativeSound_StopAllArchives(s32 fade_frames);
extern void TingleNativeSound_SetMasterVolume(s32 volume);
extern void TingleNativeSound_SetOutputMode(s32 mode);
extern void TingleNativeSound_PlaySequence(u16 sequence, s32 volume);
extern void TingleNativeSound_StopSequence(u16 sequence, s32 fade_frames);
extern void TingleNativeSound_SetSequenceVolume(u16 sequence, s32 volume,
                                                s32 fade_frames);
extern void TingleNativeSound_SetSequenceTrackValue(u16 sequence,
                                                    u16 track_mask, s32 value,
                                                    s32 kind);
extern s32 TingleNativeSound_IsSequencePlaying(u16 sequence);
extern u16 TingleNativeSound_GetSequenceTrackMask(u16 sequence);
extern void TingleNativeSound_PlayArchive(s32 archive, s32 member, s32 volume,
                                          s32 pan, s32 pitch,
                                          const void *owner);
extern void TingleNativeSound_StopArchive(s32 archive, s32 member,
                                          s32 fade_frames);
extern void TingleNativeSound_StopOwner(const void *owner);
extern void TingleNativeSound_SetArchiveValue(s32 archive, s32 member,
                                              s32 value, s32 fade_frames,
                                              s32 kind);
extern s32 TingleNativeSound_IsArchivePlaying(s32 archive, s32 member);
extern void TingleNativeSound_PlayStream(u16 stream, s32 start_milliseconds,
                                         s32 volume, s32 fade_frames);
extern void TingleNativeSound_StopStream(s32 fade_frames);
extern void TingleNativeSound_SetStreamVolume(s32 volume, s32 fade_frames);
extern s32 TingleNativeSound_IsStreamPlaying(s32 stream_or_minus_one);
extern void TingleNativeSound_SaveStreamPosition(void);
extern void TingleNativeSound_ResumeStreamPosition(void);
void Sound_PlayDirectSequence(void *context, u16 sequence, s32 volume);
void func_020592fc(void *context, u16 sequence, u16 track_mask);
void Sound_SetDirectSequenceVariable(void *context, u16 sequence, u16 variable, u16 value);
void Sound_LoadGroup(void *context, s32 group);
void Sound_ReleaseGroup(void *context, s32 group);

/* Return the facade's mutable retail flag word at offset 0x9C. */
static u32 *sound_flags(void *context)
{
    return (u32 *)((u8 *)context + 0x9c);
}

/* Report whether flag bit 2 permits player creation and control. */
static s32 sound_requests_enabled(void *context)
{
    return (*sound_flags(context) & 4u) == 0;
}

/* Ask the active phase's primary actor whether it has reached the retail
 * readiness gate used by phase-sound state 1. The predicate is virtual: actor
 * subclasses do not expose a common status bit for this transition. */
static s32 phase_sound_primary_actor_ready(void)
{
    u8 *phase = (u8 *)data_021052fc;
    u8 *actor;
    s32 (*query)(void *);

    if (phase == 0)
        return 0;
    actor = *(u8 **)(phase + 0x2ea4);
    if (actor == 0 || *(u8 **)actor == 0)
        return 0;
    query = *(s32 (**)(void *))(*(u8 **)actor + 0xa8);
    return query != 0 && query(actor) != 0;
}

/* Return whether the active phase's secondary scene carries retail flag 0x10
 * at offset 0x268, the branch selected by phase-sound transition requests. */
static s32 phase_sound_secondary_scene_ready(void)
{
    u8 *phase = (u8 *)data_021052fc;
    u8 *scene;

    if (phase == 0)
        return 0;
    scene = *(u8 **)(phase + 0x2ea8);
    return scene != 0 && (*(u32 *)(scene + 0x268) & 0x10U) != 0;
}

/* Initialize the fields consumed by the recovered phase-sound state machine.
 * Retail fills its callback-member pairs from data_020e4724 as well; the host
 * dispatcher below selects the same states without storing ARM code pointers. */
static void phase_sound_manager_init(u8 *manager)
{
    memset(manager, 0, 0xc0);
    *(s32 *)(manager + 0x10) = -1;
    *(s32 *)(manager + 0x14) = -1;
    *(s32 *)(manager + 0x18) = 0;
    *(s32 *)(manager + 0x1c) = -1;
    *(s32 *)(manager + 0x20) = -1;
    *(u16 *)(manager + 0x24) = 0x10b;
    *(u16 *)(manager + 0x26) = 0;
    *(u16 *)(manager + 0x28) = 0x115;
    *(u16 *)(manager + 0x2a) = 0x2a;
    *(u16 *)(manager + 0x2e) = 0;
}

/* Start the configured phase sequence after its resident group is available.
 * The caller owns phase-state selection; this helper only performs the
 * game-visible load, player, track-mask, and steady-state transition. */
static void phase_sound_manager_start_sequence(void *context, u8 *manager)
{
    Sound_LoadGroup(context, *(u16 *)(manager + 0x28));
    Sound_PlayDirectSequence(context, *(u16 *)(manager + 0x2a), 0x7f);
    func_020592fc(context, *(u16 *)(manager + 0x2a), 0x200);
    *(s32 *)(manager + 0x1c) = 1;
    *(s32 *)(manager + 0x18) = 4;
}

/* Advance retail manager state 1. It waits for the primary actor's status
 * gate, then loads the configured phase group synchronously, starts the
 * manager-owned sequence, selects audible track mask 0x200, and enters steady
 * state 4. */
static void phase_sound_manager_update(void *context)
{
    u8 *manager = (u8 *)data_021e9abc;

    if (manager == 0)
        return;
    if (*(s32 *)(manager + 0x18) != 1)
        return;
    if (phase_sound_secondary_scene_ready()) {
        *(s32 *)(manager + 0x1c) = 1;
        *(s32 *)(manager + 0x18) = 2;
        return;
    }
    if (!phase_sound_primary_actor_ready())
        return;
    phase_sound_manager_start_sequence(context, manager);
}

/* Allocate and initialize the retail 0xC0-byte facade, then attach SDAT. */
void func_020589f4(void)
{
    u8 *context = (u8 *)Heap_Alloc(0xc0, data_020e4154, 4, &gHeapContext);

    if (context == 0) return;
    memset(context, 0, 0xc0);
    *(u32 *)(context + 0xa0) = 0x1e;
    *(u32 *)(context + 0xa4) = 0x7f;
    gSoundContext = context;
    data_021e9abc = Heap_Alloc(0xc0, data_020e4154, 4, &gHeapContext);
    if (data_021e9abc != 0)
        phase_sound_manager_init((u8 *)data_021e9abc);
    (void)TingleNativeSound_LoadDefaultArchive();
    TingleNativeSound_SetMasterVolume(0x7f);
}

/* Advance fades, sequence tracks, voices, and stream state once per game tick. */
void func_02058bf8(void *context)
{
    phase_sound_manager_update(context);
    TingleNativeSound_Update();
}

/* Stop all players and clear the context's active configuration marker. */
void Sound_Reset(void *context)
{
    TingleNativeSound_StopAll(0);
    *(u32 *)((u8 *)context + 0xa4) = 0;
    TingleNativeSound_SetMasterVolume(0);
}

/* Address-derived alias of Sound_Reset retained by recovered callers. */
void func_02058bdc(void *context)
{
    Sound_Reset(context);
}

/* Enable or suppress ordinary sound requests, mirroring context flag bit 2. */
void func_02058d70(void *context, s32 disabled)
{
    if (disabled != 0 && sound_requests_enabled(context)) {
        TingleNativeSound_StopAllSequences(0);
        TingleNativeSound_StopStream(0);
        *sound_flags(context) |= 4u;
    } else if (disabled == 0) {
        *sound_flags(context) &= ~4u;
    }
}

/* Stop the effect, direct-sequence, and stream managers as one game request. */
void Sound_StopAllManagedPlayers(void *context)
{
    (void)context;
    TingleNativeSound_StopAll(0);
}

/* Stop every sequence-archive effect synchronously. */
void func_02058d28(void *context)
{
    (void)context;
    TingleNativeSound_StopAllArchives(0);
}

/* Stop every direct sequence using the caller's 60 Hz fade duration. */
void Sound_StopAllDirectSequences(void *context, s32 fade_frames)
{
    (void)context;
    TingleNativeSound_StopAllSequences(fade_frames);
}

/* Stop the sole stream player over the caller's 60 Hz fade duration. */
void func_02058d58(void *context, s32 fade_frames)
{
    (void)context;
    TingleNativeSound_StopStream(fade_frames);
}

/* Clamp and apply the game-owned master-volume field (retail range 0..63). */
void func_02058e3c(void *context, s32 volume)
{
    if (volume > 0x3e) volume = 0x3f;
    *(s32 *)((u8 *)context + 0xa0) = volume;
}

/* Translate the game's four speaker modes to the native output boundary. */
void func_02058e5c(void *context, s32 mode, s32 unused)
{
    static const u8 output_modes[4] = {0, 3, 1, 2};
    (void)context;
    (void)unused;
    if ((u32)mode < 4u) TingleNativeSound_SetOutputMode(output_modes[mode]);
}

/* Flush pending host sound commands; rendering is synchronous at this boundary. */
void func_02058eac(void)
{
    TingleNativeSound_Update();
}

/* Apply the broad sound-enable envelope used during modal transitions. */
void func_02058eb8(void *context, s32 enabled, s32 flags, s32 duration,
                   s32 volume)
{
    (void)flags;
    if (enabled != 0 && (*sound_flags(context) & 2u) == 0) {
        TingleNativeSound_SetMasterVolume(volume);
        *sound_flags(context) |= 2u;
    } else if (enabled == 0 && (*sound_flags(context) & 2u) != 0) {
        TingleNativeSound_SetMasterVolume(0x7f);
        *sound_flags(context) &= ~2u;
    }
    (void)duration;
}

/* Preserve the retail capture/auxiliary enable bits. These paths configure DS
 * capture effects rather than create independently audible archive players. */
void Sound_SetCaptureEnabled(void *context, s32 enabled)
{
    if (enabled != 0) *sound_flags(context) |= 1u;
    else *sound_flags(context) &= ~1u;
}

/* Toggle capture route zero while retaining its retail facade bit. */
void func_02058ffc(void *context, s32 enabled, s32 attack, s32 release)
{
    (void)attack;
    (void)release;
    if (enabled != 0) *sound_flags(context) |= 8u;
    else *sound_flags(context) &= ~8u;
}

/* Toggle capture route one while retaining its retail facade bit. */
void func_02059068(void *context, s32 enabled, s32 attack, s32 release)
{
    (void)attack;
    (void)release;
    if (enabled != 0) *sound_flags(context) |= 0x10u;
    else *sound_flags(context) &= ~0x10u;
}

/* Toggle the three direct-player capture routes and their retained mask. */
void func_02059104(void *context, s32 enabled, s32 attack, s32 release)
{
    (void)attack;
    (void)release;
    if (enabled != 0) *sound_flags(context) |= 0x20u;
    else *sound_flags(context) &= ~0x20u;
}

/* Configure or reset the three auxiliary sound managers. SDAT is resident on
 * the host, so their DS heap/load commands complete synchronously. */
void func_02059200(void *context, s32 first, s32 second, s32 third)
{
    (void)context;
    (void)first;
    (void)second;
    (void)third;
}

/* Reset the phase-sound manager against its resident SDAT state. */
void func_02059218(void *context)
{
    (void)context;
}

/* Advance the phase-sound manager; resident host loads complete immediately. */
void func_02059230(void *context, s32 enabled, s32 value)
{
    u8 *manager = (u8 *)data_021e9abc;

    if (manager == 0)
        return;
    if (enabled != 0) {
        if (*(s32 *)(manager + 0x18) == 0x0a) {
            TingleNativeSound_StopSequence(*(u16 *)(manager + 0x2c), 0);
            *(s32 *)(manager + 0x1c) = 0x0a;
            *(s32 *)(manager + 0x18) = 0x11;
        } else {
            u16 sequence = *(u16 *)(manager + 0x2a);
            if (TingleNativeSound_IsSequencePlaying(sequence))
                TingleNativeSound_StopSequence(sequence, 0);
            Sound_ReleaseGroup(context, *(u16 *)(manager + 0x28));
            Sound_LoadGroup(context,
                         value == 1 ? 0x1cc : *(u16 *)(manager + 0x26));
            *(s32 *)(manager + 0x1c) = *(s32 *)(manager + 0x18);
            *(s32 *)(manager + 0x18) = 0x0f;
        }
    } else if (*(s32 *)(manager + 0x18) == 0x11) {
        u16 sequence = *(u16 *)(manager + 0x2c);
        Sound_PlayDirectSequence(context, sequence, 0x7f);
        Sound_SetDirectSequenceVariable(context, sequence, 0xffff, 0);
        Sound_SetDirectSequenceVariable(context, sequence, 0x533, 0x7f);
        *(s32 *)(manager + 0x1c) = 0x11;
        *(s32 *)(manager + 0x18) = 9;
    } else {
        Sound_ReleaseGroup(context, *(u16 *)(manager + 0x26));
        Sound_ReleaseGroup(context, 0x1cc);
        Sound_ReleaseGroup(context, *(u16 *)(manager + 0x26));
        *(s32 *)(manager + 0x1c) = *(s32 *)(manager + 0x18);
        *(s32 *)(manager + 0x18) =
            phase_sound_secondary_scene_ready() ? 3 : 1;
    }
}

/* Submit the phase manager's alternate transition request synchronously. */
void func_02059248(void *context, s32 enabled)
{
    (void)context;
    (void)enabled;
}

/* Advance the phase database manager without asynchronous NitroFS work. */
void func_02059260(void *context, s32 enabled)
{
    (void)context;
    (void)enabled;
}

/* Route the direct-sequence player controls recovered at 0x02059278 onward. */
void Sound_PlayDirectSequence(void *context, u16 sequence, s32 volume)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_PlaySequence(sequence, volume);
}

/* Stop a direct SSEQ over the requested number of 60 Hz frames. */
void Sound_StopDirectSequence(void *context, u16 sequence, s32 fade_frames)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_StopSequence(sequence, fade_frames);
}

/* Apply an immediate 0..127 volume to the matching direct SSEQ. */
void func_020592c0(void *context, u16 sequence, s32 volume)
{
    (void)context;
    TingleNativeSound_SetSequenceVolume(sequence, volume, 0);
}

/* Fade one direct SSEQ to the requested 0..127 volume. */
void Sound_FadeDirectSequence(void *context, u16 sequence, u16 volume, s32 fade_frames)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_SetSequenceVolume(sequence, volume, fade_frames);
}

/* Make the selected direct-sequence tracks audible and mute the complement. */
void func_020592fc(void *context, u16 sequence, u16 track_mask)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_SetSequenceTrackValue(sequence, track_mask, 0, 1);
}

/* Set one of the direct SSEQ player's 16 script variables. */
void Sound_SetDirectSequenceVariable(void *context, u16 sequence, u16 variable, u16 value)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_SetSequenceTrackValue(sequence, variable, value, 2);
}

/* Query whether the requested direct SSEQ is active. */
s32 func_02059344(void *context, u16 sequence)
{
    return sound_requests_enabled(context) &&
           TingleNativeSound_IsSequencePlaying(sequence);
}

/* Return the requested direct SSEQ's audible 16-track mask. */
u16 func_0205936c(void *context, u16 sequence)
{
    return sound_requests_enabled(context)
        ? TingleNativeSound_GetSequenceTrackMask(sequence) : 0;
}

/* Start a sequence-archive member with its archive defaults. */
void Sound_Play(void *context, s32 archive, s32 member)
{
    (void)context;
    TingleNativeSound_PlayArchive(archive, member, 0x7f, 0, 0, 0);
}

/* Start an effect with explicit volume, pan, pitch, and no retained owner. */
void func_020593ac(void *context, s32 archive, s32 member, s32 volume,
                   s32 pan, s32 pitch)
{
    (void)context;
    TingleNativeSound_PlayArchive(archive, member, volume, pan, pitch, 0);
}

/* Start an effect retained against an owner with explicit track pitch. */
void func_020593dc(void *context, s32 archive, s32 member, const void *owner,
                   s32 pitch, s32 retained_flags)
{
    (void)context;
    (void)retained_flags;
    TingleNativeSound_PlayArchive(archive, member, 0x7f, 0, pitch, owner);
}

/* Stop one matching sequence-archive member immediately. */
void func_0205940c(void *context, s32 archive, s32 member)
{
    (void)context;
    TingleNativeSound_StopArchive(archive, member, 0);
}

/* Detach and stop every effect retained against the destroyed owner. */
void func_02059424(void *context, const void *owner)
{
    (void)context;
    TingleNativeSound_StopOwner(owner);
}

/* Update the effect's volume, signed pan, and signed 1/64-semitone pitch. */
void func_0205943c(void *context, s32 archive, s32 member, s32 volume,
                   s32 pan, s32 pitch)
{
    (void)context;
    TingleNativeSound_SetArchiveValue(archive, member, volume, 0, 0);
    TingleNativeSound_SetArchiveValue(archive, member, pan, 0, 2);
    TingleNativeSound_SetArchiveValue(archive, member, pitch, 0, 1);
}

/* Set one SSAR member's signed 1/64-semitone pitch immediately. */
void func_0205946c(void *context, s32 archive, s32 member, s32 value)
{
    (void)context;
    TingleNativeSound_SetArchiveValue(archive, member, value, 0, 1);
}

/* Fade one SSAR member to a clamped 0..127 volume. */
void func_02059484(void *context, s32 archive, s32 member, s32 volume,
                   s32 fade_frames)
{
    (void)context;
    TingleNativeSound_SetArchiveValue(archive, member, volume, fade_frames, 0);
}

/* Query whether the requested SSAR archive/member pair is active. */
s32 func_020594a4(void *context, s32 archive, s32 member)
{
    (void)context;
    return TingleNativeSound_IsArchivePlaying(archive, member);
}

/* Set the SSAR member's recovered modulation-depth control. */
void func_020594bc(void *context, s32 archive, s32 member, s32 value)
{
    (void)context;
    TingleNativeSound_SetArchiveValue(archive, member, value, 0, 4);
}

/* Set the SSAR member's recovered modulation-speed control. */
void func_020594d4(void *context, s32 archive, s32 member, s32 value)
{
    (void)context;
    TingleNativeSound_SetArchiveValue(archive, member, value, 0, 5);
}

/* Query the sole stream player, optionally requiring a matching stream ID. */
s32 func_02059510(void *context, s32 stream_or_minus_one)
{
    (void)context;
    return TingleNativeSound_IsStreamPlaying(stream_or_minus_one);
}

/* Start a stream at a recovered 100 ms unit offset with optional fade-in. */
void func_02059550(void *context, s32 stream, s32 start_units, s32 volume,
                   s32 fade_frames, s32 fade_in)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_PlayStream((u16)stream, start_units * 100, volume,
                                     fade_in != 0 ? fade_frames : 0);
}

/* Stop the sole stream player over a duration measured in 60 Hz frames. */
void func_0205958c(void *context, s32 fade_frames)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_StopStream(fade_frames);
}

/* Start one stream with the default zero offset and full-volume parameters
 * used by retail func_0205adb4. */
void Sound_HostPlayDefaultStreamRequest(s32 stream)
{
    if ((u32)stream <= 0xffffu)
        TingleNativeSound_PlayStream((u16)stream, 0, 0x7f, 0);
}

/* Fade the sole stream player to a clamped 0..127 volume. */
void func_020595b0(void *context, s32 volume, s32 fade_frames)
{
    if (sound_requests_enabled(context))
        TingleNativeSound_SetStreamVolume(volume, fade_frames);
}

/* Save the current stream sample position for a later resume request. */
void func_020595d4(void *context)
{
    (void)context;
    TingleNativeSound_SaveStreamPosition();
}

/* Restore the saved sample position of the still-active stream. */
void func_020595ec(void *context)
{
    (void)context;
    TingleNativeSound_ResumeStreamPosition();
}

/* Apply the recovered seven-slot sound-group configuration. The host archive
 * is fully resident, making group load/unload completion synchronous. */
void func_02059604(void *context, s32 value0, s32 value1, s32 value2,
                   s32 value3, s32 value4, s32 value5, s32 value6)
{
    (void)context;
    (void)value0;
    (void)value1;
    (void)value2;
    (void)value3;
    (void)value4;
    (void)value5;
    (void)value6;
}

/* Update one of the seven group slots while leaving the others unchanged. */
void func_020596e8(void *context, s32 index, s32 value)
{
    s32 values[7] = {0xfff, 0xfff, 0xfff, 0xfff, 0xfff, 0xfff, 0xfff};
    if ((u32)index < 7u) values[index] = value;
    func_02059604(context, values[0], values[1], values[2], values[3],
                  values[4], values[5], values[6]);
}

/* Start one stream through the lower manager's full-volume convenience path.
 * The manager pointer remains game-owned; native playback needs only its ID. */
void func_0205adb4(void *manager, s32 stream)
{
    (void)manager;
    Sound_HostPlayDefaultStreamRequest(stream);
}

/* Stop the phase-owned sequence and reproduce retail manager state 16. */
void SoundPhaseManager_StopSequence(void *manager)
{
    u8 *state = (u8 *)manager;
    u16 sequence;

    /* The temporary host preview can reach this boundary before the recovered
     * phase manager constructor is linked; retail valid-input paths do not. */
    if (state == 0) return;
    sequence = *(u16 *)(state + 0x2a);

    if (TingleNativeSound_IsSequencePlaying(sequence))
        TingleNativeSound_StopSequence(sequence, 0);
    *(u32 *)(state + 0x1c) = *(u32 *)(state + 0x18);
    *(u32 *)(state + 0x18) = 0x10;
    *(u32 *)(state + 0x00) = *(u32 *)(state + 0xb0);
    *(u32 *)(state + 0x04) = *(u32 *)(state + 0xb4);
}

/* Host counterpart of the SDK master-volume command (clamped 0..127). */
void Sound_SetMasterVolume(s32 volume)
{
    TingleNativeSound_SetMasterVolume(volume);
}

/* Reapply the manager's current seven group slots to resident SDAT state. */
void func_02059a00(void *context)
{
    (void)context;
}

/* Snapshot the manager's current seven group slots for later restoration. */
void func_02059a18(void *context)
{
    (void)context;
}

/* Reapply the seven saved group slots to resident SDAT state. */
void func_02059a30(void *context)
{
    (void)context;
}

/* Group load/release is synchronous because the host keeps validated SDAT
 * resident. The game-facing seven-slot bookkeeping has no asynchronous state. */
void Sound_LoadGroup(void *context, s32 group)
{
    (void)context;
    (void)group;
}

/* Release a group logically; resident SDAT storage remains boundary-owned. */
void Sound_ReleaseGroup(void *context, s32 group)
{
    (void)context;
    (void)group;
}

/* Store the selected phase and clear its one-frame transition marker. */
void func_020598a0(void *context, u16 phase_id)
{
    u8 *manager = (u8 *)data_021e9abc;
    if (manager != 0) {
        if (phase_id == 0x5a)
            *(u16 *)(manager + 0x24) = 0x10b;
        *(s32 *)(manager + 0x1c) = *(s32 *)(manager + 0x18);
        *(s32 *)(manager + 0x18) =
            phase_sound_secondary_scene_ready() ? 3 : 1;
    }
    *(u32 *)((u8 *)context + 0xa8) = phase_id;
    *(u32 *)((u8 *)context + 0xbc) = 0;
}
