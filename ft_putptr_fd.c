/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putptr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pberset <pberset@student.42lausanne.ch>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/01 12:46:54 by pberset           #+#    #+#             */
/*   Updated: 2023/12/05 10:57:01 by pberset          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_putptr_fd(void *p, int fd)
{
	int				check;
	unsigned long	address;

	check = 0;
	address = (unsigned long)p;
	if (!address)
		check += ft_putstr_fd("0x0", fd);
	else
	{
		check += ft_putstr_fd("0x", fd);
		check += ft_puthex_fd(address, 0, fd);
	}
	return (check);
}
