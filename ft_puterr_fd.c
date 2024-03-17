/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_puterr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pberset <pberset@student.42lausanne.ch>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/18 11:16:09 by pberset           #+#    #+#             */
/*   Updated: 2024/03/17 15:43:43 by pberset          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

#define ANSI_COLOR_BOLD_RED	"\033[1;31m"
#define ANSI_COLOR_RESET	"\033[0m"

int	ft_puterr_fd(char *s)
{
	int		check;

	check = 0;
	write(1, ANSI_COLOR_BOLD_RED, 7);
	if (!s)
	{
		write(1, "(null)", 6);
		return (6);
	}
	while (*s)
	{
		check += ft_putchar_fd(*s, STDERR_FILENO);
		s++;
	}
	write(1, ANSI_COLOR_RESET, 4);
	return (check);
}
