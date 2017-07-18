DTC ?= dtc
DTC_FLAGS ?= -@

OBJ := $(patsubst overlays/%.dts, bin/%.dtbo, $(wildcard overlays/*.dts))

bin/%.dtbo: overlays/%.dts
		@$(DTC) $(DTC_FLAGS) -I dts -O dtb -o $@ $^

all: dirs $(OBJ)

dirs:
		@mkdir -p bin

clean:
		@rm -rf bin

.PHONY: all dirs clean
