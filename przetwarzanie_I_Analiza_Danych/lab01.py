import numpy as np
from numpy.lib.stride_tricks import as_strided

# Zadanie 1
M = np.random.randint(0, 101, size=(10, 5))
sum = np.trace(M)
print("Suma głównej przekątnej:", sum) #Suma głównej przekątnej: 414
wartosciNaPrzekatnej = np.diag(M)
print("Wartości na przekątnej:", wartosciNaPrzekatnej) #Wartości na przekątnej: [73 96 87 88 70]


# Zadanie 2
array1 = np.random.randn(5, 5)
array2 = np.random.randn(5, 5)
wynik = np.dot(array1, array2)
print("Wynik mnożenia macierzy:", wynik)

#[[ 1.1695895   3.20782599  0.48364278  1.34130915  2.46627048]
 #[-1.63438043  1.44404428  5.58165814  1.80290862  2.41828806]
 #[-0.58094215  0.60516569  1.39105368  1.39695806  0.28597189]
 #[ 1.29281563  1.66812345  1.88458843 -0.83915061  3.87352691]
# [-0.02719678  3.55094331  3.11265183  2.3872484   1.52439067]]

# Zadanie 3
array3 = np.random.randint(1, 101, size=(5, 5))
array4 = np.random.randint(1, 101, size=(5, 5))
sum = array3 + array4
print("Suma dwóch macierzy:", sum)


#[[ 94 183  75  51  99]
 #[ 79 116 169  70 102]
 #[116  23  95  73  95]
 #[ 80 160 140 113  62]
 #[178 144 147 154 130]]


# Zadanie 4
matrix1 = np.random.randint(1, 11, size=(4, 5))
print("matrix1: ",matrix1)
matrix2 = np.random.randint(1, 11, size=(5, 4))
print("matrix2: ",matrix2)

matrix2=matrix2.T



sum = np.add(matrix1, matrix2)
print("Wynik dodawania macierzy:", sum)



#matrix1:  [[10  8 10  6  4]
 #[ 3  6  4  6  4]
#[ 3  7  2  1  7]
 #[ 3 10  8  4  3]]

#matrix2:  [[10  9  9  8]
 #[ 9  9  5  4]
 #[10  7  5  7]
 #[10  2  6  5]
 #[ 2  4  6  4]]
#suma =
#[[15 20 10  9 17]
 #[12 11 14 12 14]
 #[ 5  4  7 11  5]
 #[14 10  8  9  5]]



# Zadanie 5
k3 = matrix1[:, 2]
k4  = matrix2[:, 3]
multiply = k3 * k4
print("Wynik mnożenia kolumn:", multiply)  # Wynik mnożenia kolumn: [40  4 18 30]





# Zadanie 6
matrixN = np.random.normal(size=(5, 5))
print("norlny rozklad", matrixN)
matrixJ = np.random.uniform(size=(5, 5))
print("jednostajny  ", matrixJ)
print("Średnia dla macierzy normalnej:", np.mean(matrixN))
print("Odchylenie standardowe dla macierzy normalnej:", np.std(matrixN))
print("Wariancja dla macierzy normalnej:", np.var(matrixN))
print("Suma dla macierzy normalnej:", np.sum(matrixN))
print("Wartość minimalna dla macierzy normalnej:", np.min(matrixN))
print("Wartość maksymalna dla macierzy normalnej:", np.max(matrixN))
print("Średnia dla macierzy jednostajnej:", np.mean(matrixJ))
print("Odchylenie standardowe dla macierzy jednostajnej:", np.std(matrixJ))
print("Wariancja dla macierzy jednostajnej:", np.var(matrixJ))
print("Suma dla macierzy jednostajnej:", np.sum(matrixJ))
print("Wartość minimalna dla macierzy jednostajnej:", np.min(matrixJ))
print("Wartość maksymalna dla macierzy jednostajnej:", np.max(matrixJ))




#macierz rozkłądu normalnego
#[[-1.03203911 -0.47776874  0.49533479  0.57725814  0.83384197]
# [-0.21286064 -0.46261284  2.15344428 -0.78975355  0.4253524 ]
# [-2.3809909  -1.15853805 -0.80385083 -1.30038351 -1.25777441]
# [-0.71405789 -0.14435062 -0.12768128 -1.88635933 -0.46916551]
# [-0.04675783 -2.30393003  0.38361666 -0.16932393  0.28339788]]

# macierz rozkładu jednostajnego
#  [[0.7973735  0.52196724 0.0871425  0.74483201 0.77570136]
# [0.12333735 0.53352696 0.48909271 0.08260791 0.93843221]
# [0.33357205 0.14551752 0.08970457 0.82932797 0.83539502]
# [0.24459167 0.42092042 0.17379525 0.54499093 0.27146632]
# [0.21850395 0.00689833 0.00401223 0.55282592 0.88862399]]




#Średnia dla macierzy normalnej: -0.20497222459541567
#Odchylenie standardowe dla macierzy normalnej: 0.8339941657004764
#Wariancja dla macierzy normalnej: 0.6955462684224336
#Suma dla macierzy normalnej: -5.124305614885392
#Wartość minimalna dla macierzy normalnej: -2.099647067248445
#Wartość maksymalna dla macierzy normalnej: 1.2663577283134924
#Średnia dla macierzy jednostajnej: 0.6142570009325333
#Odchylenie standardowe dla macierzy jednostajnej: 0.32013617654083065
#Wariancja dla macierzy jednostajnej: 0.10248717153018189
#Suma dla macierzy jednostajnej: 15.356425023313333
#Wartość minimalna dla macierzy jednostajnej: 0.011140119828458528
#Wartość maksymalna dla macierzy jednostajnej: 0.982791028360821




# Zadanie 7
a = np.random.randint(1, 11, size=(5, 5))
b = np.random.randint(1, 11, size=(5, 5))
wynik1 = a * b
wynik2 = np.dot(a, b)
print("Wynik mnożenia *:", wynik1)
print("Wynik mnożenia dot:", wynik2)



# Wynik mnożenia *: [[ 8 90 36 90 40]
#  [81 20  6 20 12]
#  [18 18 21 70 60]
#  [56 16 40  3 60]
#  [18  6 30 45 30]]
# Wynik mnożenia dot: [[265 223 177 251 294]
#  [104 139  92 145 135]
#  [167 143 133 161 210]
#  [116 153  85 184 142]
#  [190 226 145 271 243]]



# operacje * używamy jak chcemu każdy element macierzy a pomnożyć przez odpowiadający mu element macierzy b
# jak używamy dot to mnożymy macierze A x B zgodnie z Algebrą liniową



# Zadanie 8
stridesArray = np.lib.stride_tricks.as_strided(matrix1[:3, :5], (3, 5), matrix1.strides)
print("Zastosowanie funkcji strides:", stridesArray)

#
# Zastosowanie funkcji strides:
# [[ 9  3  4  9  7]
#  [ 9  7  7  6  6]
#  [10  9  5  3  8]]


# Zadanie 9
a = np.random.randint(1, 11, size=(2, 2))
b = np.random.randint(1, 11, size=(2, 2))
vstack = np.vstack((a, b))
stack = np.stack((a, b))
print("Wynik vstack:", vstack)
print("Wynik stack:", stack)


# Wynik vstack: [[3 7]
#  [5 8]
#  [5 5]
#  [5 4]]

# otrzymujemy maceirz o takim samym wymiarze

# Wynik stack: [[[3 7]
#   [5 8]]
#
#  [[5 5]
#   [5 4]]]

# otrzymujemy maceirz o dodatkowym wymiarze




# zadanie 10

M = np.array([[0, 1, 2, 3, 4, 5],
              [6, 7, 8, 9, 10, 11],
              [12, 13, 14, 15, 16, 17],
              [18, 19, 20, 21, 22, 23]])


block_rows = 2
block_cols = 3


row_stride, col_stride = M.strides
block_row_stride = row_stride * block_rows
block_col_stride = col_stride * block_cols


blocks_view = as_strided(M, shape=(M.shape[0] // block_rows, M.shape[1] // block_cols, block_rows, block_cols),
                         strides=(block_row_stride, block_col_stride, row_stride, col_stride))


max_values = np.max(blocks_view, axis=(2, 3))


print("Wartości maksymalne dla każdego bloku danych:")
print(max_values)


# Wartości maksymalne dla każdego bloku danych:
# [[ 8 11]
#  [20 23]]