/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pberset <pberset@student.42lausanne.ch>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/13 16:07:58 by pberset           #+#    #+#             */
/*   Updated: 2023/10/20 13:12:19 by pberset          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../header/libft.h"

static int	ft_count_splits(char const *str, char chr)
{
	int	words;
	int	letters;

	words = 0;
	while (*str)
	{
		letters = 0;
		while (*str != chr && *str)
		{
			letters++;
			str++;
		}
		if ((*str == chr && letters) || !*str)
			words++;
		if (*str)
			str++;
	}
	return (words);
}

static int	ft_splitlen(char const *str, char chr)
{
	int	len;

	len = 0;
	while (*(str + len) != chr && *(str + len))
		len++;
	return (len);
}

static void	ft_free_tab(char **tab)
{
	int	i;

	i = 0;
	while (tab[i])
	{
		free(tab[i]);
		i++;
	}
	free(tab);
}

static char	*ft_fill_array_index(const char *src, char c)
{
	int		l_split;
	char	*dst;

	l_split = ft_splitlen(src, c);
	dst = ft_substr(src, 0, l_split);
	return (dst);
}

char	**ft_split(char const *s, char c)
{
	char	**str_array;
	int		i;
	int		c_splits;

	c_splits = ft_count_splits(s, (unsigned char)c);
	str_array = (char **)malloc(sizeof(char *) * (c_splits + 1));
	if (!str_array)
		return (NULL);
	i = 0;
	while (i < c_splits && *s)
	{
		while (*s == c)
			s++;
		str_array[i] = ft_fill_array_index(s, c);
		if (!str_array[i])
		{
			ft_free_tab(str_array);
			return (NULL);
		}
		s += ft_strlen(str_array[i]) + 1;
		i++;
	}
	str_array[i] = 0;
	return (str_array);
}
