import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sb


# standaryzacja danych
def standardize(data):
    mean = np.mean(data, axis=0)
    std = np.std(data, axis=0)
    std[std == 0] = 1
    standardized_data = (data - mean) / std

    return standardized_data


def wiPCA(Input_Data, component_amount):
    standardized_Objects = standardize(Input_Data)
    # plt.scatter(standardized_Objects, standardized_Objects)
    # plt.title('Standardized Objects')
    # plt.grid(True)
    #plt.show()
    # macierz kowariancji
    cov_Objects = np.cov(standardized_Objects, rowvar=False)
    # Wektory własne i wartosci wlasne
    eigenvalues, eigenvectors = np.linalg.eig(cov_Objects)
    print("Wartości własne:")
    print(eigenvalues)
    print("\nWektory własne:")
    print(eigenvectors)
    # sortowanie wlasnosci wlasnych

    sorted_index = np.argsort(eigenvalues)[::-1]
    sorted_eigenvalue = eigenvalues[sorted_index]
    sorted_eigenvectors = eigenvectors[:, sorted_index]

    eigenvector = sorted_eigenvectors[:, 0:component_amount]

    print("\n wektor własny:")
    print(eigenvector)
    # macierz rzutu
    projection_matrix = eigenvector
    print("Macierz rzutu:")
    print(projection_matrix)
    # redukcja wymiarowosci

    reduced = np.dot(eigenvector.transpose(), standardized_Objects.transpose()).transpose()
    print("Zredukowane dane:")
    print(reduced)
    return reduced



Input_Data = np.random.rand(200, 2)


reduced_data = wiPCA(Input_Data, 1)

standardized_Data = standardize(Input_Data)
plt.scatter(standardized_Data[:, 0], standardized_Data[:, 1], alpha=0.5)
plt.scatter(reduced_data, np.zeros_like(reduced_data), alpha=0.5, color='red')

eigenvectors = wiPCA(Input_Data, 2)

plt.quiver(0, 0, eigenvectors[0, 0], eigenvectors[1, 0], angles='xy', scale_units='xy', scale=1, color='r')
plt.quiver(0, 0, eigenvectors[0, 1], eigenvectors[1, 1], angles='xy', scale_units='xy', scale=1, color='g')

plt.grid(True)
plt.show()





# zad 2
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
data = pd.read_csv(url, names=['sepal length', 'sepal width', 'petal length', 'petal width', 'target'])

x = data.iloc[:, 0:4]

target = data.iloc[:, 4]

mat_reduced = wiPCA(x, 2)

principal_df = pd.DataFrame(mat_reduced, columns=['PC1', 'PC2'])
principal_df = pd.concat([principal_df, pd.DataFrame(target)], axis=1)

plt.figure(figsize=(6, 6))
sb.scatterplot(data=principal_df, x='PC1', y='PC2', hue='target', s=60, palette='icefire')
plt.show()


# zad 3

from sklearn.datasets import load_digits

digits = load_digits()
data_digits = digits.data
target_digits = digits.target

mat_reduced_digits = wiPCA(data_digits, 2)




standardized_data = standardize(data_digits)
cov_matrix = np.cov(standardized_data, rowvar=False)
eigenvalues, _ = np.linalg.eig(cov_matrix)
explained_variance_ratio = np.cumsum(eigenvalues) / np.sum(eigenvalues)

plt.plot(range(1, len(explained_variance_ratio) + 1), explained_variance_ratio)
plt.show()


plt.figure(figsize=(8, 6))
for i in range(10):
    plt.scatter(mat_reduced_digits[target_digits == i, 0], mat_reduced_digits[target_digits == i, 1], label=str(i))

plt.title('zbiór  PCA')
plt.xlabel('składowa 1')
plt.ylabel('składowa 2')
plt.grid(True)
plt.show()




def inverse_wiPCA(reduced_data, eigenvectors):
    return np.dot(reduced_data, eigenvectors.T)

def reconstruction_error(original_data, reconstructed_data):
    return np.mean(np.linalg.norm(original_data - reconstructed_data, axis=1))

max_components = 64
standardized_data = standardize(data_digits)
cov_matrix = np.cov(standardized_data, rowvar=False)
eigenvalues, eigenvectors = np.linalg.eig(cov_matrix)
sorted_index = np.argsort(eigenvalues)[::-1]

reconstruction_errors = []
for i in range(1, max_components + 1):
    eigenvector = eigenvectors[:, sorted_index[:i]]
    reduced_data = np.dot(standardized_data, eigenvector)
    reconstructed_data = inverse_wiPCA(reduced_data, eigenvector)
    error = reconstruction_error(standardized_data, reconstructed_data)
    reconstruction_errors.append(error)


plt.plot(range(1, max_components + 1), reconstruction_errors)
plt.grid(True)
plt.show()

