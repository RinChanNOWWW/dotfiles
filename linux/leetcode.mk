DATE = $(shell date +"%Y-%m-%d")
WEEKLY-CONTEST-DIR = 周赛/第$(CONTEST_NO)场\($(DATE)\)

define HEADER
#include <bits/stdc++.h>
using namespace std;
endef
export HEADER

CC = clang++
CPPSTD = -std=c++17
CFLAGS = -g -O
RM = rm -f

SOURCES = $(wildcard *.cpp)
TARGETS = $(SOURCES:.cpp=.out)

all: $(TARGETS)

$(TARGETS): %.out : %.cpp
	$(CC) $(CFLAGS) $(CPPSTD) -o $@ $<

clean:
	@${RM} -f $(TARGETS)
	@find . -name '*.out' -type f -exec $(RM) {} \;

create-weekly-contest:
ifeq ($(CONTEST_NO),)
	@echo "Please set CONTEST_NO"
	exit 1
else ifneq ($(shell echo $(CONTEST_NO) | sed 's/[0-9]//g'),)
	@echo "Please set an integer to CONTEST_NO"
	exit 1
else
	@echo "创建周赛目录: $(WEEKLY-CONTEST-DIR)"
	@mkdir -p $(WEEKLY-CONTEST-DIR);
	@echo "$$HEADER" > $(WEEKLY-CONTEST-DIR)/1.cpp
	@echo "$$HEADER" > $(WEEKLY-CONTEST-DIR)/2.cpp
	@echo "$$HEADER" > $(WEEKLY-CONTEST-DIR)/3.cpp
	@echo "$$HEADER" > $(WEEKLY-CONTEST-DIR)/4.cpp
endif	
