number = []
name = []
with open("pixi/asm/dss/exgfx_lenght.asm", "r") as f:
    f.readline()
    f.readline()
    f.readline()
    current_line = ""
    for i in range(256):
        current_line = f.readline()
        number.append(int(f"0x{current_line.split()[1][1:]}", 16))
        name.append(current_line.split("# ")[1].split("\n")[0])

with open("DSS_GFX.bin", "wb") as s:
    s.seek(0)
    s.truncate()
    for i in range(256):
        g = "ExGFXD"+"{0:0{1}X}".format(i,2)+".bin"
        try:
            with open("ExGraphics/"+g, "rb") as f:
                s.write(f.read())
                f.close()
            if number[i] <= 8:
                s.seek(2048,1)
            elif number[i] <= 16:
                s.seek(1024,1)
            else:
                continue
        except:
            s.seek(3072,1)

with open("DSS_GFX.bin.jumplist", "w") as s:
    s.write("HEAD_SIZE_DEF_MAKER=000400\nHEAD_SIZE_DEF_USER=000400\n\n")
    for i in range(256):
        s.write(f"{name[i].replace(', ','/').replace(',','')},{i*3072:08X},8,0\n\n")