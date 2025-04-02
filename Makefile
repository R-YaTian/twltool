OBJS = dsi.o main.o f_xy.o utils.o
POLAR_OBJS = polarssl/aes.o polarssl/bignum.o polarssl/rsa.o polarssl/sha2.o sha1.o
CFLAGS = -Wall -Wno-unused-variable -Wno-unused-but-set-variable -I. -Os -s -fno-strict-aliasing -fno-tree-loop-vectorize -fno-ipa-pta
OUTPUT = twltool

main: $(OBJS) $(POLAR_OBJS)
	$(CC) -fno-strict-aliasing -fno-tree-loop-vectorize -fno-ipa-pta -s -o $(OUTPUT) $(LIBS) $(OBJS) $(POLAR_OBJS)

clean:
	rm -rf $(OUTPUT) $(OBJS) $(POLAR_OBJS)
