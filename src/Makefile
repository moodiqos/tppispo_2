CC=g++
CFLAGS=-Wall -Wextra -std=c++17
TARGET=latin_square
DESTDIR=$(CURDIR)/debian/latin-square
BINDIR=$(DESTDIR)/usr/bin
REQUIRED_PKGS="g++ make debhelper"

SRC_DIR=src
SRC_FILE=$(SRC_DIR)/latin_square.cpp

all: check_deps $(TARGET)

$(TARGET): $(SRC_FILE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC_FILE)

install: $(TARGET)
	mkdir -p $(BINDIR)
	cp $(TARGET) $(BINDIR)/
	chmod +x $(BINDIR)/$(TARGET)  # Добавление команды chmod

clean:
	rm -f $(TARGET) *.o
	rm -rf $(DESTDIR)

check_deps:
	@missing_pkgs=""; \
	for pkg in $(REQUIRED_PKGS); do \
		dpkg -s $$pkg >/dev/null 2>&1 || missing_pkgs="$$missing_pkgs $$pkg"; \
	done; \
	if [ -n "$$missing_pkgs" ]; then \
		echo "Устанавливаем отсутствующие пакеты: $$missing_pkgs"; \
		sudo apt update && sudo apt install -y $$missing_pkgs; \
	fi
