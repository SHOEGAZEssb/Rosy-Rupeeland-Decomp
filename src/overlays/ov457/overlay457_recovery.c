/*
 * Recovered overlay 457 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an embedded
 * interpreter program, and publishes a separate zero-initialized engine work
 * word. Address-derived names remain because the record semantics are not yet
 * confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov457_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov457_02233ca0[];
extern unsigned char data_ov457_02234626[];
extern unsigned char data_ov457_02234660[];
extern unsigned char data_ov457_02234664[];
