OBJS = dsi.o main.o f_xy.o utils.o
POLAR_OBJS = polarssl/aes.o polarssl/bignum.o polarssl/rsa.o polarssl/sha2.o sha1.o
CFLAGS = -Wall -Wno-unused-variable -Wno-unused-but-set-variable -I. -Os
OUTPUT = twltool

ifeq ($(ARM),1)
    CFLAGS += -target arm64-apple-macos11
else
    CFLAGS += -target x86_64-apple-macos10.12
endif

main: $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)
	$(CC) -o $(OUTPUT) $(LIBS) $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)

x86_app: $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)
	$(CC) -o x86_app -target x86_64-apple-macos10.12 $(LIBS) $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)

arm_app: $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)
	$(CC) -o arm_app -target arm64-apple-macos11 $(LIBS) $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)

universal_app:
	lipo -create -output $(OUTPUT) x86_app arm_app

clean:
	rm -rf $(OUTPUT) $(OBJS) $(POLAR_OBJS) $(TINYXML_OBJS)
