/*
 * Recovered overlay 106 compact interpreter-data subsystem.
 *
 * The overlay exposes one engine callback and a large initialized bytecode-like
 * data set with two trailing work fields. Higher-level record semantics remain
 * unconfirmed, so address-based names are retained.
 */

/* Processes ABI arguments and overlay state; preserves calls, observable mutations, return values, and engine effects while higher-level semantics remain unconfirmed. */
void func_ov106_0221d6c0(void);

/* Exact initialized records and zero-initialized work fields used by the overlay; individual semantic meanings remain unconfirmed. */
extern unsigned char data_ov106_0221d720[];
extern unsigned char data_ov106_0221e380[];

