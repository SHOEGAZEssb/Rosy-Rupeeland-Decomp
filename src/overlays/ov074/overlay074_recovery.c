/*
 * Recovered overlay 74 gameplay presentation and transition subsystem.
 *
 * The overlay constructs paired scene resources, coordinates actor and UI state,
 * and advances several gameplay/display transition controllers.  Unconfirmed
 * members retain address-derived and offset-based descriptions.
 */

/* Initializes the first compact runtime record through the local helper; mutates the record and returns its initialization result. */
void func_ov074_0220fd20(void);

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void func_ov074_0220fd40(void);

/* Initializes the paired compact runtime record through the local helper; mutates the record and returns its initialization result. */
void func_ov074_0220fd44(void);

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void func_ov074_0220fd64(void);

/* Initializes an offset-based event/controller record and callback state; mutates the record and returns its result. */
void func_ov074_0220fd68(void);

/* Constructs the main scene, resources, presentation records, gameplay links, and display state; returns the initialized scene. */
void func_ov074_0220fda8(void);

/* Forwards controller state into the local pair-update helper; mutates the supplied records and returns its status. */
void func_ov074_02210008(void);

/* Destroys the first scene variant's graphics, callbacks, and embedded resources; returns no meaningful value. */
void func_ov074_02210024(void);

/* Destroys the paired scene variant's graphics, callbacks, and embedded resources; returns no meaningful value. */
void func_ov074_022100fc(void);

/* Advances the scene's large gameplay/presentation state machine, coordinating actors, UI, sound, and transitions; returns frame status. */
void func_ov074_022101dc(void);

/* Runs a scene transition branch that updates actors, UI resources, and display state; returns its transition status. */
void func_ov074_022105b4(void);

/* Runs the paired transition/cleanup branch, updating actors and graphics resources; returns its status. */
void func_ov074_02210730(void);

/* Releases two event-side resources and associated embedded state; returns no meaningful value. */
void func_ov074_022107f8(void);

/* Constructs a four-entry presentation/effect collection and its transform resources; returns the initialized owner. */
void func_ov074_02210878(void);

/* Initializes a transform helper and copies optional source payloads through the shared transform service; returns its result. */
void func_ov074_02210a04(void);

/* Advances an offset-based UI/controller sequence and dispatches its completion callback; returns current status. */
void func_ov074_02210a3c(void);

/* Builds the overlay's full collection of graphics, animation, UI, and callback resources; returns setup status. */
void func_ov074_02210b90(void);

/* Initializes a transform helper and copies optional payloads through the shared transform service; returns its result. */
void func_ov074_02211644(void);

/* Constructs a compact graphics resource pair in the supplied record; returns the initialized record. */
void func_ov074_0221167c(void);

/* Queries and updates an actor-related offset record through shared gameplay services; returns the resulting status. */
void func_ov074_022116a8(void);

/* Releases a gameplay/UI transition resource and its local state; returns no meaningful value. */
void func_ov074_02211790(void);

/* Initializes a four-entry UI/presentation descriptor collection and shared resources; returns setup status. */
void func_ov074_022117d0(void);

/* Stores supplied values into an offset-based descriptor record without direct SDK or hardware effects. */
void func_ov074_02211960(void);

/* Returns or copies an offset-based descriptor value without mutating shared state or invoking SDK services. */
void func_ov074_02211994(void);

/* Copies or updates a compact descriptor from supplied arguments; mutates destination state and returns its result. */
void func_ov074_022119b8(void);

/* Dispatches actor/resource work based on the compact descriptor and local helper state; returns operation status. */
void func_ov074_02211a0c(void);

/* Initializes a two-word compact runtime record from supplied arguments; changes only that record. */
void func_ov074_02211a68(void);

/* Updates paired effect/controller records through shared services and local completion helpers; returns current status. */
void func_ov074_02211a8c(void);

/* Stores a value in an offset-based record and returns no meaningful value without SDK interaction. */
void func_ov074_02211b28(void);

/* Returns a constant or offset-based status value without changing state or invoking SDK services. */
void func_ov074_02211b40(void);

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void func_ov074_02211b44(void);

/* Applies the local record update to both paired entries; mutates them and returns no meaningful value. */
void func_ov074_02211b58(void);

/* Updates one branch of a small state dispatcher and invokes shared system callbacks; returns dispatch status. */
void func_ov074_02211b88(void);

/* Updates the paired branch of the small state dispatcher and invokes shared system callbacks; returns dispatch status. */
void func_ov074_02211c08(void);

/* Returns an offset-based status field from the supplied record without observable side effects. */
void func_ov074_02211c70(void);

/* Returns a second offset-based status field from the supplied record without observable side effects. */
void func_ov074_02211c84(void);

