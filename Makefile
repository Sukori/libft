# Target executable/library name
NAME		= libft.a

# Compiler
CC			= cc

# Compiler flags
CFLAGS		= -g3 -Wall -Wextra -Werror

# Linker flags
LDFLAGS		= -fsanitize=address

# Header files
HSRC		= header/

# Source directories

SRC_DIR			= src/

CHAR_DIR	= $(SRC_DIR)characters
STR_DIR		= $(SRC_DIR)strings
NUM_DIR		= $(SRC_DIR)numbers
MEM_DIR		= $(SRC_DIR)memory
FD_DIR		= $(SRC_DIR)file_descriptor
LIST_DIR	= $(SRC_DIR)linked_list
PRINTF_DIR	= $(SRC_DIR)ft_printf
GNL_DIR		= $(SRC_DIR)get_next_line

# Source files
CHAR_SRC	= $(CHAR_DIR)/ft_isalnum.c \
			$(CHAR_DIR)/ft_isalpha.c \
			$(CHAR_DIR)/ft_isascii.c \
			$(CHAR_DIR)/ft_isdigit.c \
			$(CHAR_DIR)/ft_isprint.c \
			$(CHAR_DIR)/ft_isspace.c \
			$(CHAR_DIR)/ft_tolower.c \
			$(CHAR_DIR)/ft_toupper.c

STR_SRC		= $(STR_DIR)/ft_atoi.c \
			$(STR_DIR)/ft_bzero.c \
			$(STR_DIR)/ft_split.c \
			$(STR_DIR)/ft_strchr.c \
			$(STR_DIR)/ft_strdup.c \
			$(STR_DIR)/ft_striteri.c \
			$(STR_DIR)/ft_strjoin.c \
			$(STR_DIR)/ft_strlcat.c \
			$(STR_DIR)/ft_strlcpy.c \
			$(STR_DIR)/ft_strlen.c \
			$(STR_DIR)/ft_strmapi.c \
			$(STR_DIR)/ft_strncmp.c \
			$(STR_DIR)/ft_strnstr.c \
			$(STR_DIR)/ft_strrchr.c \
			$(STR_DIR)/ft_strtrim.c \
			$(STR_DIR)/ft_substr.c

NUM_SRC		= $(NUM_DIR)/ft_itoa.c \
			$(NUM_DIR)/ft_pow.c

MEM_SRC		= $(MEM_DIR)/ft_calloc.c \
			$(MEM_DIR)/ft_memchr.c \
			$(MEM_DIR)/ft_memcmp.c \
			$(MEM_DIR)/ft_memcmp_int.c \
			$(MEM_DIR)/ft_memcpy.c \
			$(MEM_DIR)/ft_memmove.c \
			$(MEM_DIR)/ft_memset.c

FD_SRC		= $(FD_DIR)/ft_putchar_fd.c \
			$(FD_DIR)/ft_putendl_fd.c \
			$(FD_DIR)/ft_puterr_fd.c \
			$(FD_DIR)/ft_puthex_fd.c \
			$(FD_DIR)/ft_putnbr_fd.c \
			$(FD_DIR)/ft_putptr_fd.c \
			$(FD_DIR)/ft_putstr_fd.c \
			$(FD_DIR)/ft_putuint_fd.c

LIST_SRC	= $(LIST_DIR)/ft_lstadd_back.c \
			$(LIST_DIR)/ft_lstadd_front.c \
			$(LIST_DIR)/ft_lstclear.c \
			$(LIST_DIR)/ft_lstdelone.c \
			$(LIST_DIR)/ft_lstiter.c \
			$(LIST_DIR)/ft_lstlast.c \
			$(LIST_DIR)/ft_lstmap.c \
			$(LIST_DIR)/ft_lstnew.c \
			$(LIST_DIR)/ft_lstsize.c

PRINTF_SRC	= $(PRINTF_DIR)/ft_printf.c

GNL_SRC		= $(GNL_DIR)/get_next_line.c

SRCS		= $(CHAR_SRC) \
			$(STR_SRC) \
			$(NUM_SRC) \
			$(MEM_SRC) \
			$(FD_SRC) \
			$(LIST_SRC) \
			$(PRINTF_SRC) \
			$(GNL_SRC)

# Object files
OBJ_DIR		= obj/

# hier ist falsch
OBJ			= $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRCS))

# Default target
all: $(NAME)
	@echo "Thanks for using pberset's Makefile!"

# Build target
$(NAME): $(OBJ)
	@echo "	Compilation successfull!"
	@echo "Creating $(NAME)..."
	@ar -rcs $@ $<
	@if [ -f $(NAME) ]; then \
		echo "$(NAME) successfully created!"; \
	else \
		echo "$(NAME) ERROR!"; \
	fi

# Build object files
$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(HSRC)
	@echo "Creating obj directories..."
	@mkdir -p $@
	@if [ -d obj/ ]; then \
		echo "Folders successfully created!"; \
	else \
		echo "mkdir ERROR!"; \
	fi
	@echo "Compiling..."
	@$(MAKE) --no-print-directory progress_bar
	@printf "%-20s" $<
	@printf "\e[20D"
	@sleep 0.02
	@printf "%-20s" "					"
	@printf "\e[20D"
	@$(CC) $(CFLAGS) $(HSRC) -c $< -o $@

# Clean compiled files
clean:
	@echo "Cleaning obj/ directory..."
	@rm -rf $(OBJ_DIR)

# Full clean
fclean: clean
	@echo "Removing $(NAME)..."
	@rm -rf $(NAME)
	@echo "Cleaning complete!"

# Rebuild from scratch
re: fclean
	@echo "Remaking project..."
	@$(MAKE) --no-print-directory all

#progress bar
progress_bar:
	@printf "█"

# Phony targets
.PHONY: all clean fclean re progress_bar

# $@ nom de la cible
# $< nom de la premiere dependance
# $ˆ liste des dependances
# $? liste des dependances mises a jour
# $* nom du fichier sans son extension
# $(wildcard *.c)
