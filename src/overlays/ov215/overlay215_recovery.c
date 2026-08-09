/*
 * Recovered overlay 215 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers 27 records plus auxiliary
 * initialized and work regions. Record semantics remain unconfirmed, so
 * address-derived names are retained.
 */

/*
 * Initializes and registers the overlay's 27 records when r0 is zero; updates
 * engine registration state, returns no value, and has no direct hardware effects.
 */
void func_ov215_0221d6c0(void);

/* Exact initialized tables, records, and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov215_0221d720[];
extern unsigned char data_ov215_0221d734[];
extern unsigned char data_ov215_0221d750[];
extern unsigned char data_ov215_0221f09c[];
extern unsigned char data_ov215_02222f60[];
