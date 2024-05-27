# Colours
b		= \033[0;34m
bb		= \033[1;34m
g		= \033[0;32m
gb		= \033[1;32m
gbg		= \033[42m
p		= \033[1;35m
rb		= \033[1;31m
y		= \033[0;33m
yb		= \033[1;33m
x		= \033[0m

# Target executable/library name
NAME	= libft.a

# Compiler
CC		= cc

# Compiler flags
CFLAGS	= -g3 -Wall -Wextra -Werror

# Linker flags
LDFLAGS	= -fsanitize=address -lasan

# Folders
SRCDIR	= src/
OBJDIR	= obj/
HEADDIR	= header/

FD_DIR	= fd_/
MEMDIR	= mem/
CHRDIR	= chr/
NUMDIR	= num/
STRDIR	= str/
LSTDIR	= lst/
GNLDIR	= gnl/
PRTFDIR	= prtf/

# Header files
HEADSRC	= $(HEADDIR)libft.h \
		$(HEADDIR)ft_printf.h \
		$(HEADDIR)get_next_line.h

# Source files
SRCFD_	= ft_putchar_fd \
		ft_putstr_fd \
		ft_putendl_fd \
		ft_putnbr_fd \
		ft_puterr_fd \
		ft_puthex_fd \
		ft_putptr_fd \
		ft_putuint_fd

SRFMEM	= ft_memset \
		ft_bzero \
		ft_memcpy \
		ft_memmove \
		ft_memchr \
		ft_memcmp \
		ft_memcmp_int \
		ft_free_tab \
		ft_free_int_tab \
		ft_calloc

SRCCHR	= ft_isalpha \
		ft_isdigit \
		ft_isalnum \
		ft_isascii \
		ft_isprint \
		ft_isspace

SRCNUM	= ft_itoa \
		ft_pow10

SRCSTR	= ft_strlen \
		ft_atoi \
		ft_strrchr \
		ft_split \
		ft_strtrim \
		ft_strjoin \
		ft_strmapi \
		ft_striteri \
		ft_strchr \
		ft_strnstr \
		ft_strncmp \
		ft_strlcpy \
		ft_strlcat \
		ft_strdup \
		ft_substr \
		ft_tolower \
		ft_toupper

SRCLST	= ft_lstnew \
		ft_lstadd_front \
		ft_lstsize \
		ft_lstlast \
		ft_lstadd_back \
		ft_lstdelone \
		ft_lstclear \
		ft_lstiter \
		ft_lstmap

SRCGNL	= get_next_line

SRCPRTF	= ft_printf

SRC		= $(addprefix $(SRCDIR)$(FD_DIR), $(addsuffix .c, $(SRCFD_))) \
		$(addprefix $(SRCDIR)$(MEMDIR), $(addsuffix .c, $(SRFMEM))) \
		$(addprefix $(SRCDIR)$(CHRDIR), $(addsuffix .c, $(SRCCHR))) \
		$(addprefix $(SRCDIR)$(NUMDIR), $(addsuffix .c, $(SRCNUM))) \
		$(addprefix $(SRCDIR)$(STRDIR), $(addsuffix .c, $(SRCSTR))) \
		$(addprefix $(SRCDIR)$(LSTDIR), $(addsuffix .c, $(SRCLST))) \
		$(addprefix $(SRCDIR)$(GNLDIR), $(addsuffix .c, $(SRCGNL))) \
		$(addprefix $(SRCDIR)$(PRTFDIR), $(addsuffix .c, $(SRCPRTF)))

# Object files
OBJ		= $(addprefix $(OBJDIR)$(FD_DIR), $(addsuffix .o, $(SRCFD_))) \
		$(addprefix $(OBJDIR)$(MEMDIR), $(addsuffix .o, $(SRFMEM))) \
		$(addprefix $(OBJDIR)$(CHRDIR), $(addsuffix .o, $(SRCCHR))) \
		$(addprefix $(OBJDIR)$(NUMDIR), $(addsuffix .o, $(SRCNUM))) \
		$(addprefix $(OBJDIR)$(STRDIR), $(addsuffix .o, $(SRCSTR))) \
		$(addprefix $(OBJDIR)$(LSTDIR), $(addsuffix .o, $(SRCLST))) \
		$(addprefix $(OBJDIR)$(GNLDIR), $(addsuffix .o, $(SRCGNL))) \
		$(addprefix $(OBJDIR)$(PRTFDIR), $(addsuffix .o, $(SRCPRTF)))

# Default target
all: $(OBJDIR) $(NAME)
	@echo "$p    ,d88b.d88b,                                      ,d88b.d88b,"
	@echo "    88888888888                                      88888888888"
	@echo "    \`Y8888888Y' Thanks for using pberset's Makefile! \`Y8888888Y'"
	@echo "      \`Y888Y'                                          \`Y888Y'"
	@echo "        \`Y'                                              \`Y'    $x"

# Build target
$(NAME): $(OBJ)
	@echo "$(g) Compilation successfull!$x"
	@echo ""
	@echo "$(bb)Creating $(NAME)...$x"
	@ar -rcs $@ $(OBJ)
	@if [ -f $(NAME) ]; then \
		  echo "$b$(NAME) successfully created!$x"; \
		  echo ""; \
	 else \
		  echo "$(rb)$(NAME) ERROR!$x"; \
		  echo ""; \
	 fi

# Create object files directory
$(OBJDIR):
	@$(MAKE) --no-print-directory tux
	@echo "$(yb)Creating obj directories...$x"
	@mkdir -p $(OBJDIR)
	@mkdir -p $(OBJDIR)$(FD_DIR)
	@mkdir -p $(OBJDIR)$(MEMDIR)
	@mkdir -p $(OBJDIR)$(CHRDIR)
	@mkdir -p $(OBJDIR)$(NUMDIR)
	@mkdir -p $(OBJDIR)$(STRDIR)
	@mkdir -p $(OBJDIR)$(LSTDIR)
	@mkdir -p $(OBJDIR)$(GNLDIR)
	@mkdir -p $(OBJDIR)$(PRTFDIR)
	@if [ -d obj/ ]; then \
		  echo "$(y)Folders successfully created!$x"; \
		  echo ""; \
	 else \
		  echo "$(rb)mkdir ERROR!$x"; \
		  echo ""; \
	 fi
	@echo "$(gb)Compiling...$x"

# Build object files
$(OBJDIR)%.o: $(SRCDIR)%.c | $(HEADSRC)
	@$(MAKE) --no-print-directory progress_bar
	@printf "%-30s" $*
	@sleep 0.01
	@printf "\e[30D\e[K"
	@$(CC) $(CFLAGS) -c $^ -o $@

# Clean compiled files
clean:
	@echo "$(yb)Cleaning obj/ directory...$x"
	@rm -rf $(OBJDIR)
	@echo "$(y)Cleaned!$x"
	@echo ""

# Full clean
fclean: clean
	@echo "$(bb)Removing $(NAME)...$x"
	@rm -rf $(NAME)
	@echo "$(b)Removed!$x"
	@echo ""

# Rebuild from scratch
re: fclean
	@echo "$(rb)Reseting...$x"
	@echo ""
	@$(MAKE) --no-print-directory all

# TUX
 tux:
	@echo " ________________________ "
	@echo "< Let's compile $(NAME)! >"
	@echo " ------------------------ "
	@echo "   \\"
	@echo "    \\"
	@echo "        .--."
	@echo "       |o_o |"
	@echo "       |:_/ |"
	@echo "      //   \ \\"
	@echo "     (|     | )"
	@echo "    /'\\_   _/\`\\"
	@echo "    \\___)=(___/"
	@echo ""

#progress bar
progress_bar:
	@printf "$(gbg) $x"

# Phony targets
.PHONY: all clean fclean re  progress_bar

# $@ nom de la cible
# $< nom de la premiere dependance
# $ˆ liste des dependances
# $? liste des dependances mises a jour
# $* nom du fichier sans son extension
# $(wildcard *.c)
