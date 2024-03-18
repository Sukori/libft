/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pberset <pberset@student.42lausanne.ch>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/16 12:36:46 by pberset           #+#    #+#             */
/*   Updated: 2024/03/18 10:47:46 by pberset          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_putstr_fd(char *s, int fd)
{
	int	check;

	check = 0;
	if (!s)
		ft_puterr_fd("(null)");
	while (*s)
	{
		check += ft_putchar_fd(*s, fd);
		s++;
	}
	return (check);
}
