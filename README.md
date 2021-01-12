## Dynamic Spriteset System
This package of ASM hacks allows the users to automatically fill their VRAM area dedicated to Sprite GFX.
This whole repo still is being worked on. **Please come back later when an actual release happens or if you really want to contribute something**.

### Features
* Easy to use API, just call a routine to do the heavy work for you
* Lunar Magic's ExGFX system to store sprite graphics
* VRAM queue system; used to fill the VRAM at the sprite area, but it may be used for something else
* more to come later, i just wanted to prepare the repo to upload the files

### Requirements
* SA-1 Pack 1.35
* asar 1.71 or superior
* PIXI 1.31 or superior
* UberASMTool 1.4 or superior

### Installation
* Patch `asm/dynamic_spritesets.asm` with asar
* Apply the included UberASM scripts to your ROM
* Apply PIXI's ASM hacks
* Enjoy

### For developers
Some parts of the code are commented if you want to check them out

To use the DSS API you have to call via JSL the `find_and_queue_gfx` routine, this will either put the tiles in queue OR prepare them for easy usage.

`find_and_queue_gfx`:

X, Y and the data bank are preserved.
* Input:
  * A: Lower 8-bits of the ExGFX number you want to check. Full list of possible values at `dynamic_spritesets_defines.asm`
* Output:
  * Carry set: Graphics are ready to use.
  * Carry clear: Graphics aren't ready to be used.
  * `!dss_tile_buffer`: This RAM table (long) will hold your actual sprite tile number data for the requested ExGFX file.
  * `$0D-$0F`: 24-bit pointer to the sprite tile number data in `!dss_tile_buffer_complete`.
  * A: Same as the input. Not really useful.
 
**Note**: Putting graphics into the queue does NOT count as graphics being ready, they have to be loaded in VRAM in order to count as ready.

**Tip #1**: You can copy the 24-bit pointer to another RAM and perform another GFX request within the same sprite in the same frame to not make even more complex your GFX routine.

**Tip #2**: To handle 8x8 tiles, check out `asm/original_sprites/rex.asm` or `first_shared_gfx_write` in `asm/original_sprites/shared_gfx_routines.asm`. It really isn't optimal yet, but it may give help as a reference.

more info later (maybe)
