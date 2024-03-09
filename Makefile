NAME = libft.a

CC = cc

CFLAGS = -g3 -Wall -Wextra -Werror

LDFLAGS = -fsanitize=address

SRC_DIR = src

MEM_SRC_DIR = $(addprefix $(SRC_DIR)/, memory)
CHR_SRC_DIR = $(addprefix $(SRC_DIR)/, characters)
STR_SRC_DIR = $(addprefix $(SRC_DIR)/, strings)
NUM_SRC_DIR = $(addprefix $(SRC_DIR)/, numbers)
FD_SRC_DIR = $(addprefix $(SRC_DIR)/, file_descriptor)
FTPRINTF_SRC_DIR = $(addprefix $(SRC_DIR)/, ft_printf)
LST_SRC_DIR = $(addprefix $(SRC_DIR)/, linked_list)
GNL_SRC_DIR = $(addprefix $(SRC_DIR)/, get_next_line)

H_LIB = header/libft.h
H_FTPRINTF = src/ft_printf/header/ft_printf.h
H_GNL = src/get_next_line/header/get_next_line.h

MEM_SRC = $(addprefix $(MEM_SRC_DIR)/, ft_atoi.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_bzero.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_calloc.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_memchr.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_memcmp.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_memcpy.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_memmove.c) \
	$(addprefix $(MEM_SRC_DIR)/, ft_memset.c)

CHR_SRC = $(addprefix $(CHR_SRC_DIR)/, ft_isalnum.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_isalpha.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_isascii.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_isdigit.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_isprint.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_isspace.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_tolower.c) \
	$(addprefix $(CHR_SRC_DIR)/, ft_toupper.c)

STR_SRC = $(addprefix $(STR_SRC_DIR)/, ft_split.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strchr.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strdup.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_striteri.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strjoin.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strlcat.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strlcpy.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strlen.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strmapi.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strncmp.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strnstr.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strrchr.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_strtrim.c) \
	$(addprefix $(STR_SRC_DIR)/, ft_substr.c)

NUM_SRC = $(addprefix $(NUM_SRC_DIR)/, ft_itoa.c) \
	$(addprefix $(NUM_SRC_DIR)/, ft_pow.c)

FD_SRC = $(addprefix $(FD_SRC_DIR)/, ft_putchar_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_putendl_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_puterr_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_puthex_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_putnbr_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_putptr_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_putstr_fd.c) \
	$(addprefix $(FD_SRC_DIR)/, ft_putuint_fd.c)

LST_SRC = $(addprefix $(LST_SRC_DIR)/, ft_lstnew.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstadd_front.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstsize.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstlast.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstadd_back.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstdelone.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstclear.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstiter.c) \
	$(addprefix $(LST_SRC_DIR)/, ft_lstmap.c)

FTPRINTF_SRC = $(addprefix $(FTPRINTF_SRC_DIR)/, ft_printf.c)

GNL_SRC = $(addprefix $(GNL_SRC_DIR)/, get_next_line.c)

OBJ_DIR = $(addprefix $(SRC_DIR)/, obj)

OBJ = $(SRC:%.c=$(OBJ_DIR)/%.o)

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJ) 
	ar -rcs $@ $(OBJ)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: %.c | $(HSRC)
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(NAME)

re: fclean
	make all

.PHONY: all clean fclean re bonus

# $@ nom de la cible
# $< nom de la premiere dependance
# $ˆ liste des dependances
# $? liste des dependances mises a jour
# $* nom du fichier sans son extension
# $(wildcard *.c)
