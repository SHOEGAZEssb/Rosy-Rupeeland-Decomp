/*
 * Recovered overlay 61 scene subsystem.
 *
 * This module constructs a sound-backed scene, owns its graphics/debug-text
 * lifecycle, and updates two confirmed world-object presentation paths.
 * Unconfirmed members remain described by their offset-based use.
 */

/* Constructs the scene from ABI inputs, initializes graphics state, starts its
 * sound, sets scene flags, and returns the initialized scene pointer. */
void func_ov061_0220fd20(void);

/* Initializes the scene's offset-based private fields without confirmed SDK
 * side effects and returns the ABI-prescribed object/result. */
void func_ov061_0220fdd0(void);

/* Destroys graphics and sound resources and the base Scene while retaining the
 * allocation; returns no meaningful value. */
void func_ov061_0220fe04(void);

/* Deleting destructor: performs ordinary scene teardown and conditionally
 * frees the allocation according to the ABI deletion flag. */
void func_ov061_0220fe6c(void);

/* Runs the scene frame state machine, updates debug text and object displays,
 * invokes the routed transition callback, and returns update status. */
void func_ov061_0220fedc(void);

/* Invokes the indirect scene transition selected through shared routing data;
 * it changes caller-visible scene state and returns the callback result. */
void func_ov061_0221009c(void);

/* Updates the first world-object presentation path using shared actor and Lupy
 * contexts, changing render state and returning no value. */
void func_ov061_022100e4(void);

/* Updates the second world-object presentation path using shared actor and
 * Lupy contexts, changing render state and returning no value. */
void func_ov061_022101dc(void);
