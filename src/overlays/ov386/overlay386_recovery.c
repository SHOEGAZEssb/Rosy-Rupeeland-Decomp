/*
 * Recovered overlay 386 interpreter-data subsystem.
 *
 * The overlay installs a medium-sized initialized table as a three-entry
 * runtime block, registers an additional interpreter record, and exposes a
 * work word to the engine. Table-entry semantics remain unconfirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov386_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov386_02233ca0[];
extern unsigned char data_ov386_022349aa[];
extern unsigned char data_ov386_02235020[];
extern unsigned char data_ov386_02235024[];
