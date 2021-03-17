l = []
with open("pixi/asm/dss/exgfx_lenght.asm", "r") as f:
    f.readline()
    f.readline()
    f.readline()
    for i in range(256):
        l.append(f.readline())
        l[i] = int(f"0x{l[i].split()[1][1:]}", 16)

with open("DSS_GFX.bin", "rb") as s:
    for i in range(256):
        if l[i] == 0 or l[i] == 255:
            s.seek(3072,1)
        else:
            with open(f"ExGraphics/ExGFXD{i:02X}.bin", "wb") as f:
                if l[i] <= 8:
                    f.write(s.read(1024))
                    s.seek(2048,1)
                elif l[i] <= 16:
                    f.write(s.read(2048))
                    s.seek(1024,1)
                else:
                    f.write(s.read(3072))
                f.close()

