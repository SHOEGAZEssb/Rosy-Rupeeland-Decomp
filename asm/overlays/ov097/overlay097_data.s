; Matching fallback for documented parameter and dispatch tables in
; src/overlays/ov097/overlay097_recovery.c.
.extern data_020f35e0
.extern data_020f35d0
.extern func_ov097_0221794c
.extern func_ov097_02217974
.extern func_ov097_02219b58
.extern func_ov097_02219ce4
.extern func_ov078_02212bb4
.extern func_020314b8
.extern Actor_SnapshotTransientState
.extern func_ov097_02218034
.extern ActorExtendedType2_ClearTransientInteractionState
.extern func_02031564
.extern func_ov097_02217cec
.extern ActorDerivedRuntime_HandlePairEnded
.extern func_02031f44
.extern func_0203213c
.extern func_02032144
.extern func_020320fc
.extern func_02032208
.extern func_ov097_02219b94
.extern ActorExtendedType2_UpdateSceneInteraction
.extern ActorDerivedRuntime_ClearInteractionQueryState
.extern ActorDerivedRuntime_TestInteractionQuery
.extern Actor_RequestAttachmentActivation
.extern ActorExtendedType2_RunRenderCallback
.extern func_ov078_02212bc0
.extern func_ov097_02219c94
.extern func_ov097_02219c7c
.extern func_ov097_02219c64
.extern func_ov097_02219be0
.extern Actor_AssignPrimaryResourceWithEffect
.extern Actor_AssignPrimaryResource
.extern Actor_SetResourceVariant
.extern func_ov097_02217cf8
.extern func_ov097_02217d44
.extern ActorExtendedType2_DrawDebugOverlay
.extern Actor_RefreshTerrainHeightIfEnabled
.extern ActorExtendedType2_TriggerContactFeedback
.extern Actor_ConvergeToTargetHeight
.extern func_ov097_02219cc4
.extern func_ov097_02219b90
.extern func_ov097_022195d8
.extern func_ov097_02219b7c
.extern Actor_IntegrateMotion
.extern func_ov097_02219b70
.extern Actor_SetResourceSlot
.extern func_ov097_02217b14
.extern func_ov097_02219b60
.extern func_ov097_022191b8
.extern func_02031464
.extern ActorDerivedRuntime_NoOp
.extern ActorExtendedType2_ResetRuntimeState
.extern ActorExtendedType2_CopyAdjustedDescriptor
.extern ActorExtendedType2_RestoreRandomizedPosition
.extern ActorExtendedType2_UpdateTargetMotion
.extern ActorExtendedType2_EnterTargetInteractionState7
.extern func_ov097_02219cc0
.extern ActorExtendedType2_SetTargetCallbackPair40AndResetCounters
.extern ActorExtendedType2_SetTargetCallbackPairC0
.extern ActorExtendedType2_SetTargetCallbackPair48
.extern ActorExtendedType2_ConfigureCallbacks00And170
.extern ActorExtendedType2_ConfigureCallbacks78And70
.extern ActorExtendedType2_ConfigureCallbacks18And240
.extern ActorExtendedType2_BindTargetAndSpawnEffect
.extern ActorExtendedType2_ConfigureCallback08
.extern ActorExtendedType2_DisableModesAndSetCallbackPair80
.extern ActorExtendedType2_RunVirtualFCAndResetProgress
.extern func_ov097_02219d08
.extern ActorExtendedType2_UpdateActiveCountdown
.extern func_ov097_02219cf8
.extern ActorExtendedType2_SetCallbackPair88
.extern ActorExtendedType2_RestoreState1AndCallbackPair28
.extern func_ov097_02219cbc
.extern ActorExtendedType2_TryDescriptorInteraction120
.extern func_ov075_02213368
.extern ActorExtendedType2_TryDescriptorInteraction128
.extern ActorExtendedType2_DispatchProximityCallback
.extern ActorExtendedType2_ReturnZeroInteraction
.extern ActorExtendedType2_TriggerStoredTargetCallback
.extern ActorExtendedType2_CheckRuntimeGroupProximity
.extern ActorExtendedType2_AdvancePositionTarget
.extern ActorExtendedType2_TrackCandidate
.extern func_ov097_02219cb4
.extern func_ov097_02219cac
.extern ActorExtendedType2_IsInteractionEligible
.extern ActorExtendedType2_UpdateTimedAttachmentTransition
.extern ActorExtendedType2_UpdateAttachmentScaleTransition
.extern ActorExtendedType2_DispatchTransitionCallback
.extern ActorExtendedType2_RouteDescriptorTransition
.extern ActorExtendedType2_TryCompleteAttachmentGate
.extern func_ov078_02213574
.extern ActorExtendedType2_UpdateTargetApproach
.extern ActorExtendedType2_UpdateTargetFollowEffect
.extern ActorExtendedType2_ResetTerminalAttachmentState
.extern ActorExtendedType2_UpdateTerminalState18
.extern ActorExtendedType2_EnterState2WithCallbacks
.extern ActorExtendedType2_ReturnFalseLateState
.extern ActorExtendedType2_DispatchNearTargetState
.extern ActorExtendedType2_DispatchTargetTransform
.extern ActorExtendedType2_LookupSpecialTarget65
.extern ActorExtendedType2_UpdateState22Countdown
.extern ActorExtendedType2_CancelTargetState
.extern ActorExtendedType2_SelectRandomDescriptorCallback
.extern ActorExtendedType2_UpdateRandomCallbackDelay
.extern ActorExtendedType2_UpdateRandomWaypoint
.extern ActorExtendedType2_UpdateCenterWaypoint
.extern ActorExtendedType2_UpdateLongDelayAudio
.extern func_ov097_02219c44
.extern func_ov097_02219c30
.extern func_ov097_02219be8
.extern ActorExtendedType2_SetCallbackPair130AndForwardD0
.extern func_ov097_022179a4
.extern ActorExtendedType2_UpdateDescriptorQueryFlags
.extern func_ov097_02219458
.extern func_ov097_02219d1c
.extern func_ov097_022195e0
.extern func_ov097_02219ba0
.extern func_ov097_022195ec
.extern ActorExtendedType2_IsInteractionActive
.extern func_ov097_02217b4c
.extern func_ov097_02218b1c
.extern func_ov078_02213e78
.extern func_ov078_02213f24
.extern func_ov078_02213f54
.extern func_ov078_02213fbc
.extern func_ov078_02214020
.extern func_ov097_022180bc
.extern func_ov097_022181a0
.extern func_ov097_02218940
.extern func_ov097_02219cf4
.extern func_ov076_02213a3c
.extern func_ov097_02217ac0
.extern func_ov077_02213c30
.extern func_ov097_02219d14
.extern func_ov097_02219718
.extern func_ov097_0221972c
.extern ActorExtendedType2_UpdateFrame
.extern func_ov078_0221361c
.extern ActorExtendedType2_PrepareRelease
.extern ActorExtendedType2_InitializeReentryState
.extern func_ov097_02219b50
.extern func_ov097_02219760
.extern ActorExtendedType2_ApplyMotionImpulseIfEnabled
.extern func_ov097_02219748
.extern func_ov097_0221978c
.extern func_ov078_022138c0
.extern func_ov097_02219bc8
.extern func_ov097_02219bb0
.extern func_ov097_02219ba8
.extern func_ov097_02219b98
.extern func_ov078_02213280
.extern func_ov097_022198e8
.extern func_ov097_02218b3c
.extern func_ov097_022180b8
.extern func_ov097_0221819c
.extern func_ov097_022197e0
.extern func_ov078_02213be0
.extern func_ov097_02219cec
.extern func_ov097_02219e4c
.extern func_ov097_02219e80
.extern func_ov097_0221a494
.extern TrackedResourceActor_SetupPresentationResources
.extern func_ov097_0221a07c
.extern Actor_ClearTransientContactState
.extern TrackedResourceActor_HandleInteractionCallback
.extern func_02032abc
.extern func_ov097_0221a05c
.extern Actor_ClearInteractionFlag2000
.extern Actor_TestQueryPointAndClearFlag2000
.extern TrackedResourceActor_ApplyTouchData
.extern func_ov097_0221a490
.extern func_ov097_0221a488
.extern func_ov097_0221a480
.extern func_ov097_0221a478
.extern func_ov097_0221a470
.extern func_ov097_0221a460
.extern Actor_SetPosition
.extern func_02033b38
.extern func_ov097_0221a45c
.extern func_ov097_0221a458
.extern func_ov097_0221a450
.extern func_02033f4c
.extern Actor_ApplyMotionImpulse
.extern func_ov097_02219ebc
.extern func_ov097_0221a1c8
.extern func_0205258c
.extern TrackedResourceActor_ActivateBoundedAction
.extern func_ov097_0221a420
.extern func_ov097_0221a3b8
.global data_ov097_0221a4a4
.global data_ov097_0221a4c0
.global data_ov097_0221a4c8
.global data_ov097_0221a4d0
.global data_ov097_0221a500
.global data_ov097_0221a510
.global data_ov097_0221a518
.global data_ov097_0221a520
.global data_ov097_0221a538
.global data_ov097_0221a544
.global data_ov097_0221a550
.global data_ov097_0221a55c
.global data_ov097_0221a568
.global data_ov097_0221a574
.global data_ov097_0221a580
.global data_ov097_0221a58c
.global data_ov097_0221a598
.global data_ov097_0221a5a4
.global data_ov097_0221a5b8
.global data_ov097_0221a5d0
.global data_ov097_0221a5f4
.global data_ov097_0221a80c
.global data_ov097_0221aa1c
.global data_ov097_0221aa38
.global data_ov097_0221aa44
.global data_ov097_0221aa50
.global data_ov097_0221aa5c
.global data_ov097_0221aa6c
.global data_ov097_0221aa84
.global data_ov097_0221aaa4
.section .rodata, 4, 1, 4
    ; Unlabelled leading parameter pair at 0x0221a49c.
    .byte 0x3c, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x03, 0x00
data_ov097_0221a4a4:
    .byte 0x2e, 0x16, 0x2f, 0x16, 0x30, 0x16, 0x2b, 0x16, 0x2c, 0x16, 0x2d, 0x16
    .section .data, 4, 1, 4
data_ov097_0221a4c0:
    .byte 0x35, 0x43, 0x46, 0x43, 0x68, 0x72, 0x00, 0x00
data_ov097_0221a4c8:
    .byte 0xf0, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov097_0221a4d0:
    .byte 0xe4, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xd8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0xf8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0xf8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xf4, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov097_0221a500:
    .byte 0x4c, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xd8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov097_0221a510:
    .word data_020f35e0
    .word data_ov097_0221a4c0
data_ov097_0221a518:
    .byte 0xe0, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov097_0221a520:
    .byte 0xe8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xd8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0xd8, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov097_0221a538:
    .word data_020f35d0
    .word data_ov097_0221a58c
    .word data_ov097_0221a55c
data_ov097_0221a544:
    .word data_020f35d0
    .word data_ov097_0221a5d0
    .word data_ov097_0221a550
data_ov097_0221a550:
    .word data_020f35d0
    .word data_ov097_0221a5a4
    .word data_ov097_0221a568
data_ov097_0221a55c:
    .word data_020f35d0
    .word data_ov097_0221a580
    .word data_ov097_0221a510
data_ov097_0221a568:
    .word data_020f35d0
    .word data_ov097_0221a598
    .word data_ov097_0221a538
data_ov097_0221a574:
    .word data_020f35d0
    .word data_ov097_0221a5b8
    .word data_ov097_0221a550
data_ov097_0221a580:
    .byte 0x38, 0x43, 0x46, 0x43, 0x68, 0x72, 0x45, 0x76, 0x74, 0x00, 0x00, 0x00
data_ov097_0221a58c:
    .byte 0x38, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4e, 0x70, 0x63, 0x00, 0x00, 0x00
data_ov097_0221a598:
    .byte 0x39, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4d, 0x6f, 0x6e, 0x73, 0x00, 0x00
data_ov097_0221a5a4:
    .byte 0x31, 0x36, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4d, 0x6f, 0x6e, 0x73, 0x5f, 0x43, 0x61, 0x6d, 0x70
    .byte 0x65, 0x72, 0x00, 0x00
data_ov097_0221a5b8:
    .byte 0x32, 0x31, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4d, 0x6f, 0x6e, 0x73, 0x5f, 0x43, 0x61, 0x6d, 0x70
    .byte 0x65, 0x72, 0x5f, 0x4d, 0x69, 0x6e, 0x69, 0x00
data_ov097_0221a5d0:
    .byte 0x32, 0x34, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4d, 0x6f, 0x6e, 0x73, 0x5f, 0x43, 0x61, 0x6d, 0x70
    .byte 0x65, 0x72, 0x5f, 0x53, 0x74, 0x72, 0x69, 0x6b, 0x65, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word data_ov097_0221a544
data_ov097_0221a5f4:
    .word func_ov097_0221794c
    .word func_ov097_02217974
    .word func_ov097_02219b58
    .word func_ov097_02219ce4
    .word func_ov078_02212bb4
    .word func_020314b8
    .word Actor_SnapshotTransientState
    .word func_ov097_02218034
    .word ActorExtendedType2_ClearTransientInteractionState
    .word func_02031564
    .word func_ov097_02217cec
    .word ActorDerivedRuntime_HandlePairEnded
    .word func_02031f44
    .word func_0203213c
    .word func_02032144
    .word func_020320fc
    .word func_02032208
    .word func_ov097_02219b94
    .word ActorExtendedType2_UpdateSceneInteraction
    .word ActorDerivedRuntime_ClearInteractionQueryState
    .word ActorDerivedRuntime_TestInteractionQuery
    .word Actor_RequestAttachmentActivation
    .word ActorExtendedType2_RunRenderCallback
    .word func_ov078_02212bc0
    .word func_ov097_02219c94
    .word func_ov097_02219c7c
    .word func_ov097_02219c64
    .word func_ov097_02219be0
    .word Actor_AssignPrimaryResourceWithEffect
    .word Actor_AssignPrimaryResource
    .word Actor_SetResourceVariant
    .word func_ov097_02217cf8
    .word func_ov097_02217d44
    .word ActorExtendedType2_DrawDebugOverlay
    .word Actor_RefreshTerrainHeightIfEnabled
    .word ActorExtendedType2_TriggerContactFeedback
    .word Actor_ConvergeToTargetHeight
    .word func_ov097_02219cc4
    .word func_ov097_02219b90
    .word func_ov097_022195d8
    .word func_ov097_02219b7c
    .word Actor_IntegrateMotion
    .word func_ov097_02219b70
    .word Actor_SetResourceSlot
    .word func_ov097_02217b14
    .word func_ov097_02219b60
    .word func_ov097_022191b8
    .word func_02031464
    .word ActorDerivedRuntime_NoOp
    .word ActorExtendedType2_ResetRuntimeState
    .word ActorExtendedType2_CopyAdjustedDescriptor
    .word ActorExtendedType2_RestoreRandomizedPosition
    .word ActorExtendedType2_UpdateTargetMotion
    .word ActorExtendedType2_EnterTargetInteractionState7
    .word func_ov097_02219cc0
    .word ActorExtendedType2_SetTargetCallbackPair40AndResetCounters
    .word ActorExtendedType2_SetTargetCallbackPairC0
    .word ActorExtendedType2_SetTargetCallbackPair48
    .word ActorExtendedType2_ConfigureCallbacks00And170
    .word ActorExtendedType2_ConfigureCallbacks78And70
    .word ActorExtendedType2_ConfigureCallbacks18And240
    .word ActorExtendedType2_BindTargetAndSpawnEffect
    .word ActorExtendedType2_ConfigureCallback08
    .word ActorExtendedType2_DisableModesAndSetCallbackPair80
    .word ActorExtendedType2_RunVirtualFCAndResetProgress
    .word func_ov097_02219d08
    .word ActorExtendedType2_UpdateActiveCountdown
    .word func_ov097_02219cf8
    .word ActorExtendedType2_SetCallbackPair88
    .word ActorExtendedType2_RestoreState1AndCallbackPair28
    .word func_ov097_02219cbc
    .word ActorExtendedType2_TryDescriptorInteraction120
    .word func_ov075_02213368 ; func_ov078_02213368
    .word ActorExtendedType2_TryDescriptorInteraction128
    .word ActorExtendedType2_DispatchProximityCallback
    .word ActorExtendedType2_ReturnZeroInteraction
    .word ActorExtendedType2_TriggerStoredTargetCallback
    .word ActorExtendedType2_CheckRuntimeGroupProximity
    .word ActorExtendedType2_AdvancePositionTarget
    .word ActorExtendedType2_TrackCandidate
    .word func_ov097_02219cb4
    .word func_ov097_02219cac
    .word ActorExtendedType2_IsInteractionEligible
    .word ActorExtendedType2_UpdateTimedAttachmentTransition
    .word ActorExtendedType2_UpdateAttachmentScaleTransition
    .word ActorExtendedType2_DispatchTransitionCallback
    .word ActorExtendedType2_RouteDescriptorTransition
    .word ActorExtendedType2_TryCompleteAttachmentGate
    .word func_ov078_02213574
    .word ActorExtendedType2_UpdateTargetApproach
    .word ActorExtendedType2_UpdateTargetFollowEffect
    .word ActorExtendedType2_ResetTerminalAttachmentState
    .word ActorExtendedType2_UpdateTerminalState18
    .word ActorExtendedType2_EnterState2WithCallbacks
    .word ActorExtendedType2_ReturnFalseLateState
    .word ActorExtendedType2_DispatchNearTargetState
    .word ActorExtendedType2_DispatchTargetTransform
    .word ActorExtendedType2_LookupSpecialTarget65
    .word ActorExtendedType2_UpdateState22Countdown
    .word ActorExtendedType2_CancelTargetState
    .word ActorExtendedType2_SelectRandomDescriptorCallback
    .word ActorExtendedType2_UpdateRandomCallbackDelay
    .word ActorExtendedType2_UpdateRandomWaypoint
    .word ActorExtendedType2_UpdateCenterWaypoint
    .word ActorExtendedType2_UpdateLongDelayAudio
    .word func_ov097_02219c44
    .word func_ov097_02219c30
    .word func_ov097_02219be8
    .word ActorExtendedType2_SetCallbackPair130AndForwardD0
    .word func_ov097_022179a4
    .word ActorExtendedType2_UpdateDescriptorQueryFlags
    .word func_ov097_02219458
    .word func_ov097_02219d1c
    .word func_ov097_022195e0
    .word func_ov097_02219ba0
    .word func_ov097_022195ec
    .word ActorExtendedType2_IsInteractionActive
    .word func_ov097_02217b4c
    .word func_ov097_02218b1c
    .word func_ov078_02213e78 ; data_ov080_02213e78, data_ov083_02213e78
    .word func_ov078_02213f24 ; data_ov080_02213f24, data_ov083_02213f24
    .word func_ov078_02213f54 ; data_ov080_02213f54, data_ov083_02213f54
    .word func_ov078_02213fbc ; data_ov080_02213fbc, data_ov083_02213fbc
    .word func_ov078_02214020 ; data_ov080_02214020, data_ov083_02214020
    .word func_ov097_022180bc
    .word func_ov097_022181a0
    .word func_ov097_02218940
    .word func_ov097_02219cf4
    .word func_ov076_02213a3c ; func_ov078_02213a3c
    .word func_ov097_02217ac0
    .word func_ov077_02213c30 ; func_ov078_02213c30, data_ov079_02213c30
    .word func_ov097_02219d14
    .byte 0x00, 0x00, 0x00, 0x00
    .word data_ov097_0221a574
data_ov097_0221a80c:
    .word func_ov097_02219718
    .word func_ov097_0221972c
    .word func_ov097_02219b58
    .word func_ov097_02219ce4
    .word func_ov078_02212bb4
    .word func_020314b8
    .word Actor_SnapshotTransientState
    .word ActorExtendedType2_UpdateFrame
    .word ActorExtendedType2_ClearTransientInteractionState
    .word func_02031564
    .word func_ov078_0221361c
    .word ActorDerivedRuntime_HandlePairEnded
    .word func_02031f44
    .word func_0203213c
    .word func_02032144
    .word func_020320fc
    .word func_02032208
    .word func_ov097_02219b94
    .word ActorExtendedType2_UpdateSceneInteraction
    .word ActorDerivedRuntime_ClearInteractionQueryState
    .word ActorDerivedRuntime_TestInteractionQuery
    .word Actor_RequestAttachmentActivation
    .word ActorExtendedType2_RunRenderCallback
    .word func_ov078_02212bc0
    .word func_ov097_02219c94
    .word func_ov097_02219c7c
    .word func_ov097_02219c64
    .word func_ov097_02219be0
    .word Actor_AssignPrimaryResourceWithEffect
    .word Actor_AssignPrimaryResource
    .word Actor_SetResourceVariant
    .word ActorExtendedType2_PrepareRelease
    .word ActorExtendedType2_InitializeReentryState
    .word ActorExtendedType2_DrawDebugOverlay
    .word Actor_RefreshTerrainHeightIfEnabled
    .word ActorExtendedType2_TriggerContactFeedback
    .word Actor_ConvergeToTargetHeight
    .word func_ov097_02219cc4
    .word func_ov097_02219b90
    .word func_ov097_02219b50
    .word func_ov097_02219b7c
    .word Actor_IntegrateMotion
    .word func_ov097_02219b70
    .word Actor_SetResourceSlot
    .word func_ov097_02219760
    .word func_ov097_02219b60
    .word ActorExtendedType2_ApplyMotionImpulseIfEnabled
    .word func_02031464
    .word ActorDerivedRuntime_NoOp
    .word ActorExtendedType2_ResetRuntimeState
    .word ActorExtendedType2_CopyAdjustedDescriptor
    .word ActorExtendedType2_RestoreRandomizedPosition
    .word ActorExtendedType2_UpdateTargetMotion
    .word ActorExtendedType2_EnterTargetInteractionState7
    .word func_ov097_02219cc0
    .word ActorExtendedType2_SetTargetCallbackPair40AndResetCounters
    .word ActorExtendedType2_SetTargetCallbackPairC0
    .word ActorExtendedType2_SetTargetCallbackPair48
    .word ActorExtendedType2_ConfigureCallbacks00And170
    .word ActorExtendedType2_ConfigureCallbacks78And70
    .word ActorExtendedType2_ConfigureCallbacks18And240
    .word ActorExtendedType2_BindTargetAndSpawnEffect
    .word ActorExtendedType2_ConfigureCallback08
    .word ActorExtendedType2_DisableModesAndSetCallbackPair80
    .word func_ov097_02219748
    .word func_ov097_02219d08
    .word ActorExtendedType2_UpdateActiveCountdown
    .word func_ov097_02219cf8
    .word ActorExtendedType2_SetCallbackPair88
    .word ActorExtendedType2_RestoreState1AndCallbackPair28
    .word func_ov097_02219cbc
    .word ActorExtendedType2_TryDescriptorInteraction120
    .word func_ov075_02213368 ; func_ov078_02213368
    .word ActorExtendedType2_TryDescriptorInteraction128
    .word ActorExtendedType2_DispatchProximityCallback
    .word ActorExtendedType2_ReturnZeroInteraction
    .word ActorExtendedType2_TriggerStoredTargetCallback
    .word ActorExtendedType2_CheckRuntimeGroupProximity
    .word ActorExtendedType2_AdvancePositionTarget
    .word ActorExtendedType2_TrackCandidate
    .word func_ov097_02219cb4
    .word func_ov097_02219cac
    .word ActorExtendedType2_IsInteractionEligible
    .word func_ov097_0221978c
    .word ActorExtendedType2_UpdateAttachmentScaleTransition
    .word ActorExtendedType2_DispatchTransitionCallback
    .word ActorExtendedType2_RouteDescriptorTransition
    .word ActorExtendedType2_TryCompleteAttachmentGate
    .word func_ov078_02213574
    .word ActorExtendedType2_UpdateTargetApproach
    .word ActorExtendedType2_UpdateTargetFollowEffect
    .word ActorExtendedType2_ResetTerminalAttachmentState
    .word ActorExtendedType2_UpdateTerminalState18
    .word ActorExtendedType2_EnterState2WithCallbacks
    .word ActorExtendedType2_ReturnFalseLateState
    .word ActorExtendedType2_DispatchNearTargetState
    .word ActorExtendedType2_DispatchTargetTransform
    .word ActorExtendedType2_LookupSpecialTarget65
    .word ActorExtendedType2_UpdateState22Countdown
    .word ActorExtendedType2_CancelTargetState
    .word ActorExtendedType2_SelectRandomDescriptorCallback
    .word ActorExtendedType2_UpdateRandomCallbackDelay
    .word ActorExtendedType2_UpdateRandomWaypoint
    .word ActorExtendedType2_UpdateCenterWaypoint
    .word ActorExtendedType2_UpdateLongDelayAudio
    .word func_ov097_02219c44
    .word func_ov097_02219c30
    .word func_ov097_02219be8
    .word ActorExtendedType2_SetCallbackPair130AndForwardD0
    .word func_ov078_022138c0
    .word ActorExtendedType2_UpdateDescriptorQueryFlags
    .word func_ov097_02219bc8
    .word func_ov097_02219bb0
    .word func_ov097_02219ba8
    .word func_ov097_02219ba0
    .word func_ov097_02219b98
    .word ActorExtendedType2_IsInteractionActive
    .word func_ov078_02213280
    .word func_ov097_022198e8
    .word func_ov078_02213e78 ; data_ov080_02213e78, data_ov083_02213e78
    .word func_ov078_02213f24 ; data_ov080_02213f24, data_ov083_02213f24
    .word func_ov078_02213f54 ; data_ov080_02213f54, data_ov083_02213f54
    .word func_ov078_02213fbc ; data_ov080_02213fbc, data_ov083_02213fbc
    .word func_ov078_02214020 ; data_ov080_02214020, data_ov083_02214020
    .word func_ov097_02218b3c
    .word func_ov097_022180b8
    .word func_ov097_0221819c
    .word func_ov097_02219cf4
    .word func_ov097_022197e0
    .word func_ov078_02213be0 ; data_ov079_02213be0
    .word func_ov077_02213c30 ; func_ov078_02213c30, data_ov079_02213c30
    .word func_ov097_02219cec
data_ov097_0221aa1c:
    .byte 0x54, 0x41, 0x53, 0x4b, 0x00, 0x00, 0x00, 0x00
    .word data_020f35e0
    .word data_ov097_0221a4c0
    .word data_020f35d0
    .word data_ov097_0221a580
    .word data_ov097_0221a510
data_ov097_0221aa38:
    .word data_020f35d0
    .word data_ov097_0221aa5c
    .word data_ov097_0221a55c
data_ov097_0221aa44:
    .word data_020f35d0
    .word data_ov097_0221aa6c
    .word data_ov097_0221aa38
data_ov097_0221aa50:
    .word data_020f35d0
    .word data_ov097_0221aa84
    .word data_ov097_0221aa44
data_ov097_0221aa5c:
    .byte 0x31, 0x33, 0x43, 0x46, 0x43, 0x68, 0x72, 0x46, 0x69, 0x42, 0x75, 0x6c, 0x6c, 0x65, 0x74, 0x00
data_ov097_0221aa6c:
    .byte 0x32, 0x30, 0x43, 0x46, 0x43, 0x68, 0x72, 0x46, 0x69, 0x42, 0x75, 0x6c, 0x6c, 0x65, 0x74, 0x5f
    .byte 0x52, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x00, 0x00
data_ov097_0221aa84:
    .byte 0x32, 0x31, 0x43, 0x46, 0x43, 0x68, 0x72, 0x46, 0x69, 0x42, 0x75, 0x6c, 0x6c, 0x65, 0x74, 0x5f
    .byte 0x52, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00
    .word data_ov097_0221aa50
data_ov097_0221aaa4:
    .word func_ov097_02219e4c
    .word func_ov097_02219e80
    .word func_ov097_02219b58
    .word func_ov097_0221a494
    .word TrackedResourceActor_SetupPresentationResources
    .word func_020314b8
    .word Actor_SnapshotTransientState
    .word func_ov097_0221a07c
    .word Actor_ClearTransientContactState
    .word func_02031564
    .word TrackedResourceActor_HandleInteractionCallback
    .word func_02032abc
    .word func_02031f44
    .word func_0203213c
    .word func_02032144
    .word func_020320fc
    .word func_02032208
    .word func_ov097_02219b94
    .word func_ov097_0221a05c
    .word Actor_ClearInteractionFlag2000
    .word Actor_TestQueryPointAndClearFlag2000
    .word Actor_RequestAttachmentActivation
    .word TrackedResourceActor_ApplyTouchData
    .word func_ov097_0221a490
    .word func_ov097_0221a488
    .word func_ov097_0221a480
    .word func_ov097_0221a478
    .word func_ov097_0221a470
    .word Actor_AssignPrimaryResourceWithEffect
    .word Actor_AssignPrimaryResource
    .word Actor_SetResourceVariant
    .word func_ov097_0221a460
    .word Actor_SetPosition
    .word func_02033b38
    .word Actor_RefreshTerrainHeightIfEnabled
    .word func_ov097_0221a45c
    .word Actor_ConvergeToTargetHeight
    .word func_ov097_0221a458
    .word func_ov097_02219b90
    .word func_ov097_0221a450
    .word func_ov097_02219b7c
    .word Actor_IntegrateMotion
    .word func_ov097_02219b70
    .word Actor_SetResourceSlot
    .word func_02033f4c
    .word func_ov097_02219b60
    .word Actor_ApplyMotionImpulse
    .word func_02031464
    .word func_ov097_02219ebc
    .word func_ov097_0221a1c8
    .word func_0205258c
    .word TrackedResourceActor_ActivateBoundedAction
    .word func_ov097_0221a420
    .word func_ov097_0221a3b8
    .byte 0x00, 0x00, 0x00, 0x00
