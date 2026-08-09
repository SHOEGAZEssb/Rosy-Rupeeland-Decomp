/*
 * Recovered overlay 64 scripted multi-phase scene subsystem.
 *
 * The scene allocates several actor and graphics-resource groups, drives debug
 * text, Lupy/world interactions, sound, and GameWork flags, and selects among
 * multiple scripted update branches.  Its 84-byte read-only tables remain in
 * the original rodata section; uncertain structure members stay offset-based.
 */

/* Constructs the scene and all actor/resource groups from ABI inputs, clears
 * initial GameWork flags, initializes sound/debug state, and returns the scene. */
void func_ov064_0220fd20(void);

/* Destroys all scene-owned actors, resources, sound/debug state, and the base
 * Scene while retaining the allocation; returns no meaningful value. */
void func_ov064_02210658(void);

/* Deleting destructor: performs the ordinary teardown and conditionally frees
 * the scene allocation according to the ABI deletion flag. */
void func_ov064_0221089c(void);

/* Runs the scene's top-level update dispatcher, synchronizes world/Lupy state,
 * and returns the selected scripted branch's frame status. */
void func_ov064_02210ae8(void);

/* Executes one large scripted update branch, including debug text, sound,
 * resource allocation, actor updates, and transitions; returns frame status. */
void func_ov064_02210c5c(void);

/* Initializes or copies one offset-based graphics descriptor via the shared
 * resource API; it mutates caller-owned state and returns no value. */
void func_ov064_0221102c(void);

/* Finalizes one graphics descriptor and submits its derived resource state;
 * it changes SDK graphics state and returns no meaningful value. */
void func_ov064_02211098(void);

/* Initializes three offset-selected resource descriptors and associated
 * graphics state; it returns the initialized owner/result. */
void func_ov064_022110d0(void);

/* Executes a second scripted update branch, updating actors, sound, messages,
 * allocations, and transitions; returns the observable frame status. */
void func_ov064_02211114(void);

/* Executes a third scripted update branch with debug text, sound, message, and
 * actor effects; returns the observable frame status. */
void func_ov064_02211374(void);

/* Executes the longest scripted branch, coordinating multiple resource sets,
 * effects, messages, sounds, and state transitions; returns frame status. */
void func_ov064_0221155c(void);

/* Builds a compact presentation record and derives its shared SDK resource;
 * it mutates the supplied owner and returns the ABI-prescribed result. */
void func_ov064_02211abc(void);

/* Builds a related three-component presentation record through shared SDK
 * helpers; it mutates the supplied owner and returns its result. */
void func_ov064_02211af4(void);

/* Stores or returns a small offset-based state value without direct SDK or
 * hardware effects. */
void func_ov064_02211b3c(void);

/* Chooses and configures a randomized scene event, consulting and setting
 * GameWork flags and updating world resources; returns event status. */
void func_ov064_02211b4c(void);

/* Dispatches the final indirect scene transition and updates its associated
 * presentation values; returns the callback/status result. */
void func_ov064_02211cec(void);
