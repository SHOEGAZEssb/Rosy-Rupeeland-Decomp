/*
 * Recovered overlay 90 title-cinematic actor subsystem.
 *
 * The first actor owns the retail phase-90 title sequence reached from overlay
 * 225. It binds three title actors, owns logo/copyright sprite resources, and
 * advances a 0x00-0x20 state machine containing NDS display fades, camera and
 * actor motion, audio cues, timed effects, and terminal scene transitions.
 * Later actor types implement the participants and effects used by that path.
 * Unconfirmed members retain address-based names and offset descriptions.
 */

/* Initialize the title controller, bind three actors, set phase flags, and white both NDS engines. */
void func_ov090_022177e0(void);

/* Load and create the retail title logo and copyright sprite resources. */
void func_ov090_02217a3c(void);

/* Release title sprites/resources and embedded vectors without freeing the actor. */
void func_ov090_02217b70(void);

/* Perform the complete title-controller teardown and free its actor allocation. */
void func_ov090_02217c6c(void);

/*
 * Advance the canonical title sequence. States 0x00-0x0b initialize display
 * routing and fades; 0x0c-0x17 animate the three bound actors and camera;
 * 0x18-0x20 run the long effect branch and its final brightness transitions.
 * The routine increments the shared state timer, blends camera vectors, updates
 * the two phase render helpers, and preserves the original NDS GX boundaries.
 */
void func_ov090_02217d70(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a3cc(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a3dc(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a420(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a460(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a498(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a504(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a544(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a6ac(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a6b0(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a6b4(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a6d8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a738(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a784(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221a8bc(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221aa98(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221aab8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ab2c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ab4c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ad64(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ae1c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b03c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b194(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b280(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b3d0(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b428(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b7e0(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b7f8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b8c8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b8d0(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b8d8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b8e8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b8f4(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b908(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b910(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b914(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b918(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b91c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b92c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b934(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b93c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b944(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b94c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b950(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b954(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b958(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b964(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b96c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b974(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b97c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221b9a0(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ba6c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221baa8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221baec(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bb84(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bc0c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bc5c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bc84(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bd78(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221bdd8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221be40(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c138(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c170(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c184(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c318(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c350(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c3dc(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c434(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c440(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c44c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c454(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c468(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c5ec(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c638(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c68c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c728(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c73c(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c780(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221c9f8(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ca14(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ca34(void);

/* Processes the supplied ABI arguments and offset-based object state; observable mutations, calls, and the encoded return value are preserved by the matching implementation, while higher-level semantics remain unconfirmed. */
void func_ov090_0221ca58(void);

