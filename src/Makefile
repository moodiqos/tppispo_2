CC=g++
CFLAGS=-Wall -Wextra -std=c++17
TARGET=latin_square
SRC_DIR=src
SRC_FILE=$(SRC_DIR)/latin_square.cpp
DESTDIR=$(CURDIR)/debian/latin-square
BINDIR=$(DESTDIR)/usr/bin
REQUIRED_PKGS="g++ make debhelper"

all: check_deps $(TARGET)

$(TARGET): $(SRC_FILE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC_FILE)

clean:
	rm -f $(TARGET) *.o
	rm -rf $(DESTDIR)

install: $(TARGET)
	mkdir -p $(BINDIR)
	cp $(TARGET) $(BINDIR)/

check_deps:
	@missing_pkgs=""; \
	for pkg in $(REQUIRED_PKGS); do \
		dpkg -s $$pkg >/dev/null 2>&1 || missing_pkgs="$$missing_pkgs $$pkg"; \
	done; \
	if [ -n "$$missing_pkgs" ]; then \
		echo "Устанавливаем отсутствующие пакеты: $$missing_pkgs"; \
		sudo apt update && sudo apt install -y $$missing_pkgs; \
	fi
