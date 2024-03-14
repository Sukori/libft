# Target executable/library name
NAME     = libft.a

# Compiler
CC       = cc

# Compiler flags
CFLAGS   = -g3 -Wall -Wextra -Werror

# Linker flags
LDFLAGS  = -fsanitize=address -lasan

# Source files
SRC      = ft_atoi.c \
           ft_bzero.c \
           ft_calloc.c \
           ft_isalnum.c \
           ft_isalpha.c \
           ft_isascii.c \
           ft_isdigit.c \
           ft_isprint.c \
           ft_isspace.c \
           ft_itoa.c \
		   ft_free_tab.c \
           ft_memchr.c \
           ft_memcmp.c \
           ft_memcmp_int.c \
           ft_memcpy.c \
           ft_memmove.c \
           ft_memset.c \
		   ft_pow10.c \
           ft_printf.c \
           ft_putchar_fd.c \
           ft_putendl_fd.c \
           ft_puterr_fd.c \
           ft_puthex_fd.c \
           ft_putnbr_fd.c \
           ft_putptr_fd.c \
           ft_putstr_fd.c \
           ft_putuint_fd.c \
           ft_split.c \
           ft_strchr.c \
           ft_strdup.c \
           ft_striteri.c \
           ft_strjoin.c \
           ft_strlcat.c \
           ft_strlcpy.c \
           ft_strlen.c \
           ft_strmapi.c \
           ft_strncmp.c \
           ft_strnstr.c \
           ft_strrchr.c \
           ft_strtrim.c \
           ft_substr.c \
           ft_tolower.c \
           ft_toupper.c \
           ft_lstnew.c \
           ft_lstadd_front.c \
           ft_lstsize.c \
           ft_lstlast.c \
           ft_lstadd_back.c \
           ft_lstdelone.c \
           ft_lstclear.c \
           ft_lstiter.c \
           ft_lstmap.c \
           get_next_line.c

# Header files
HSRC     = libft.h ft_printf.h get_next_line.h

# Object files directory
OBJ_DIR  = obj

# Object files
OBJ      = $(SRC:%.c=$(OBJ_DIR)/%.o)

# Default target
all: $(NAME)
	@echo "Thanks for using pberset's Makefile!"

# Build target
$(NAME): $(OBJ_DIR) $(OBJ)
	@echo "	Compilation successfull!"
	@echo "Creating $(NAME)..."
	@ar -rcs $@ $(OBJ)
	@if [ -f $(NAME) ]; then \
        echo "$(NAME) successfully created!"; \
    else \
        echo "$(NAME) ERROR!"; \
    fi

# Create object files directory
$(OBJ_DIR):
	@echo "Creating obj directory..."
	@mkdir -p $(OBJ_DIR)
	@if [ -d obj/ ]; then \
        echo "Folder successfully created!"; \
    else \
        echo "mkdir ERROR!"; \
    fi
	@echo "Compiling..."

# Build object files
$(OBJ_DIR)/%.o: %.c | $(HSRC)
	@$(MAKE) --no-print-directory progress_bar
	@printf "%-20s" $<
	@printf "\e[20D"
	@sleep 0.02
	@printf "%-20s" "                    "
	@printf "\e[20D"
	@$(CC) $(CFLAGS) -c $^ -o $@

# Clean compiled files
clean:
	@echo "Cleaning obj/ directory..."
	@rm -rf $(OBJ_DIR)
	@echo "Cleaned!"

# Full clean
fclean: clean
	@echo "Removing $(NAME)..."
	@rm -rf $(NAME)
	@echo "Removed!"

# Rebuild from scratch
re: fclean
	@echo "Reseting..."
	@$(MAKE) --no-print-directory all

#progress bar
progress_bar:
	@printf "█"

# Phony targets
.PHONY: all clean fclean re  progress_bar

# $@ nom de la cible
# $< nom de la premiere dependance
# $ˆ liste des dependances
# $? liste des dependances mises a jour
# $* nom du fichier sans son extension
# $(wildcard *.c)
