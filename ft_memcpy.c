/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pberset <pberset@student.42lausanne.ch>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/09 15:20:11 by pberset           #+#    #+#             */
/*   Updated: 2023/10/17 15:42:07 by pberset          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <signal.h>

void	*ft_memcpy(void *dst, const void *src, size_t n)
{
	char		*dest;
	const char	*str;

	if (dst == NULL && src == NULL)
		return (dst);
	dest = (char *)dst;
	str = (const char *)src;
	while (n)
	{
		*dest = *str;
		dest++;
		str++;
		n--;
	}
	return (dst);
}
