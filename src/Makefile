CC=g++
CFLAGS=-Wall -Wextra -std=c++17
TARGET=latin_square
SRC_FILE=latin_square.cpp  # Без src/!

all: check_deps $(TARGET)

$(TARGET): $(SRC_FILE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC_FILE)

clean:
	rm -f $(TARGET) *.o

install: $(TARGET)
	mkdir -p ../usr/bin
	cp $(TARGET) ../usr/bin/

check_deps:
	@missing_pkgs=""; \
	for pkg in g++ make debhelper; do \
		dpkg -s $$pkg >/dev/null 2>&1 || missing_pkgs="$$missing_pkgs $$pkg"; \
	done; \
	if [ -n "$$missing_pkgs" ]; then \
		echo "Устанавливаем отсутствующие пакеты: $$missing_pkgs"; \
		sudo apt update && sudo apt install -y $$missing_pkgs; \
	fi
