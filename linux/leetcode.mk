DATE = $(shell date +"%Y-%m-%d")
WEEKLY-CONTEST-DIR = 周赛/第$(CONTEST_NO)场\($(DATE)\)

CC = clang++
CFLAGS = -g -O
RM = rm -f

SOURCES = $(wildcard *.cpp)
TARGETS = $(SOURCES:.cpp=.out)

all: $(TARGETS)

$(TARGETS): %.out : %.cpp
	$(CC) $(CFLAGS) -o $@ $<

clean:
	@rm -f $(TARGETS)
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
	@touch $(WEEKLY-CONTEST-DIR)/1.cpp
	@touch $(WEEKLY-CONTEST-DIR)/2.cpp
	@touch $(WEEKLY-CONTEST-DIR)/3.cpp
	@touch $(WEEKLY-CONTEST-DIR)/4.cpp
endif	
