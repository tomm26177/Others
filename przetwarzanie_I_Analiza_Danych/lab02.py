import pandas as pd
import numpy as np
from scipy.stats import pearsonr
import matplotlib.pyplot as plt
from scipy import stats

# Zadanie 1
df = pd.DataFrame({"x": [1, 2, 3, 4, 5], 'y': ['a', 'b', 'a', 'b', 'b']})
mean_by_group = df.groupby('y')['x'].mean()

#print(mean_by_group)


# Zadanie 1:
# y
# a    2.000000
# b    3.666667
# Name: x, dtype: float64


# Zadanie 2
value_counts_y = df['y'].value_counts()

#print(value_counts_y)

# Zadanie 2:
# y
# b    3
# a    2



# Zadanie 3


# w numpy musimy okreslic typ danych, dane są przechowywane w tablicy
data_np = np.loadtxt('autos.csv', delimiter=',',dtype=str)
#  pandas dostarcza elastyczne struktury dannych oraz automatycznie
#wykeywa typ danych
data_pd = pd.read_csv('autos.csv')


# Zadanie 4
# Przykładowe dane:
df = pd.read_csv('autos.csv')
mean_fuel_consumption = df.groupby('make')['city-mpg'].mean()
#print(mean_fuel_consumption)

# alfa-romero      20.333333
# audi             18.857143
# bmw              19.375000
# chevrolet        41.000000
# dodge            28.000000
# honda            30.384615
# isuzu            31.000000
# jaguar           14.333333
# mazda            25.705882
# mercedes-benz    18.500000
# mercury          19.000000
# mitsubishi       24.923077
# nissan           27.000000
# peugot           22.454545
# plymouth         28.142857
# porsche          17.400000
# renault          23.000000
# saa              20.333333
# subaru           26.333333
# toyota           27.500000
# volkswagen       28.583333
# volvo            21.181818


# Zadanie 5
count_fuel_type = df.groupby('make')['fuel-type'].value_counts()
#print(count_fuel_type)

# make           fuel-type
# alfa-romero    gas           3
# audi           gas           7
# bmw            gas           8
# chevrolet      gas           3
# dodge          gas           9
# honda          gas          13
# isuzu          gas           4
# jaguar         gas           3
# mazda          gas          15
#                diesel        2
# mercedes-benz  diesel        4
#                gas           4
# mercury        gas           1
# mitsubishi     gas          13
# nissan         gas          17
#                diesel        1
# peugot         gas           6
#                diesel        5
# plymouth       gas           7
# porsche        gas           5
# renault        gas           2
# saa            gas           6
# subaru         gas          12
# toyota         gas          29
#                diesel        3
# volkswagen     gas           8
#                diesel        4
# volvo          gas          10
#                diesel        1
# Name: count, dtype: int64
#




# Zadanie 6

np.polyfit(df['length'], df['city-mpg'], 1)
np.polyfit(df['length'], df['city-mpg'], 2)
# print(np.polyfit(df['length'], df['city-mpg'], 1 ),np.polyfit(df['length'], df['city-mpg'], 2))
# [-0.35576533 87.14020723] [ 4.39610791e-03 -1.89441985e+00  2.21104093e+02]


# Zadanie 7
correlation_coefficient, p_value = pearsonr(df['length'], df['city-mpg'])

# print("Współczynnik korelacji liniowej Pearsona:", correlation_coefficient)
# print("Wartość p:", p_value)
# Współczynnik korelacji liniowej Pearsona: -0.6709086615585711
# Wartość p: 3.5955288422256646e-28


# Zadanie 8
# plt.scatter(df['length'], df['city-mpg'])
# plt.plot(df['length'], np.polyval(np.polyfit(df['length'], df['city-mpg'], 1), df['length']), label='Linear Fit')
# plt.plot(df['length'], np.polyval(np.polyfit(df['length'], df['city-mpg'], 2), df['length']), label='Quadratic Fit')
# plt.legend()
# plt.show()


# Zadanie 9

# kde = stats.gaussian_kde(df['length'])
# x = np.linspace(min(df['length']), max(df['length']), 1000)
# plt.plot(x, kde(x), label='Density Estimate')
# plt.hist(df['length'], density=True, alpha=0.5, label='Samples')
# plt.legend()
# plt.show()

# Zadanie 10

# fig, axs = plt.subplots(1, 2)
# axs[0].plot(df['length'])
# axs[1].plot(df['width'])
# plt.show()

# Zadanie 11

# kde_2d = stats.gaussian_kde([df['width'], df['length']])
# x_grid, y_grid = np.meshgrid(np.linspace(min(df['width']), max(df['width']), 100), np.linspace(min(df['length']), max(df['length']), 100))
# density = kde_2d((x_grid.flatten(), y_grid.flatten())).reshape(x_grid.shape)
# plt.contour(x_grid, y_grid, density)
# plt.scatter(df['width'], df['length'])
# plt.show()
# plt.savefig('density_plot.png')
# plt.savefig('density_plot.pdf')




