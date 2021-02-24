## Dynamic Spriteset System
This package of ASM hacks allows the users to automatically fill their VRAM area dedicated to Sprite GFX.
This whole repo still is being worked on. **Please come back later when an actual release happens or if you really want to contribute something**.

### Features
* Easy to use API, just call a routine to do the heavy work for you
* Lunar Magic's ExGFX system to store sprite graphics
* Lunar Magic's sprites showing fine regardless of the loaded ExGFX
* VRAM queue system; used to fill the VRAM at the sprite area, but it may be used for something else

### Disclaimer
This project was started to completely remove the time spent building manually a spriteset for my very own purposes and took decisions that fulfilled my requirements. If you find anything that isn't ideal for your very own project I'm sorry about that, but it's not likely that any changes will be made for your specific purposes.

I will not provide any kind of support about this system. It's a very complex package that modifies a lot of parts of the ROM and providing support in such cases is outright impossible.

Any question I receive will most likely replied with a link to the wiki unless it's a bug report about the API or any SMW sprite I've converted.

### To do list
- [x] Convert & evaluate SMW's sprites (some don't require conversion for DSS)
- [x] Write documentation about the API
- [x] Write code examples
- [ ] Set up the wiki (faq, installation process, etc)
- [x] Add custom displays for each sprite in Lunar Magic
- [ ] Test stability
