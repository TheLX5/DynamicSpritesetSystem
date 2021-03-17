Every script here expects you to have the scripts in the same folder structure as the system, specifically being in the same folder as where the 'ExGraphics' folder is and have access to dss's files in PIXI's folder via 'pixi/asm/dss/exgfx_lenght.asm'. Feel free to edit them if you have different requirements.

None of the scripts here are Highly Produced:tm:, they're quick scripts I made for my own convenience and may be useful for you.

Those scripts were made with Python 3.7+ in mind.

:--------------------------------------------:

join_dss_exgfx.py
	Merges every ExGFX in the D00-DFF range for easy editing.
	It creates a single .bin file and a handy .jumplist file* for easy access to every sprite available.
	
	* no idea if .jumplist files are supported outside YY-CHR.NET

separate_dss_exgfx.py
	Separates every ExGFX file that was merged into DSS_GFX.bin into their respective ExGFX slot and file size.