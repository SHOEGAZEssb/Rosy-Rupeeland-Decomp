/*
 * Recovered overlay 294 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary runtime regions. Their semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
void func_ov294_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov294_0221d72c[];
extern unsigned char data_ov294_0221d740[];
extern unsigned char data_ov294_0221ead5[];
extern unsigned char data_ov294_02225180[];
extern unsigned char data_ov294_02225184[];
