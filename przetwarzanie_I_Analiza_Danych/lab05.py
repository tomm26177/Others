import numpy as np
import pandas as pd
from scipy.sparse import csr_matrix


#zad1
def freq(x, prob=True):
    unique_values, counts = np.unique(x, return_counts=True)
    if prob:
        probabilities = counts / len(x)
        return unique_values, probabilities
    else:
        return unique_values, counts



#zad2

def freq2(x, y, prob=True):
    unique_x, counts_x = np.unique(x, return_counts=True)
    unique_y, counts_y = np.unique(y, return_counts=True)
    if prob:
        xy_counts = np.zeros((len(unique_x), len(unique_y)))
        for i, xi in enumerate(unique_x):
            for j, yj in enumerate(unique_y):
                xy_counts[i,j] = np.sum((x == xi) & (y == yj))
        xy_probabilities = xy_counts / np.sum(xy_counts)
        return unique_x, unique_y, xy_probabilities
    else:
        return unique_x, unique_y, counts_x

#zad3
def entropy(x):
     _, prob_x = freq(x)
     return -np.sum(prob_x * np.log2(prob_x))


def joint_entropy(x, y):
    _, _, xy_prob = freq2(x, y)
    return -np.sum(xy_prob * np.log2(xy_prob + (xy_prob == 0)))


def conditional_entropy(x, y):
    _, unique_y, xy_prob = freq2(x, y)
    _, prob_y = freq(y)
    conditional_ent = 0
    for j, yj in enumerate(unique_y):
         conditional_ent += prob_y[j] * entropy(x[y == yj])
    return conditional_ent



def infogain(x, y):
    return entropy(x) - conditional_entropy(x, y)

#zad 4
data = pd.read_csv('zoo.csv')


X = data.iloc[:, :-1]
y = data.iloc[:, -1]




information_gains = {}
for column in X.columns:
    ig = infogain(X[column], y)
    information_gains[column] = ig


sorted_attributes = sorted(information_gains.items(), key=lambda x: x[1], reverse=True)


print("Posortowane atrybuty według przyrostu informacji:")
for attribute, ig in sorted_attributes:
    print(f"{attribute}: {ig}")

# Posortowane atrybuty według przyrostu informacji:
# animal: 2.390559682294038
# legs: 1.3630469031539394
# milk: 0.9743197211096903
# toothed: 0.8656941534932372
# eggs: 0.8301384483633479
# hair: 0.7906745736101796
# feathers: 0.7179499765002912
# backbone: 0.6761627418829198
# breathes: 0.6144940279390552
# tail: 0.5004604482515028
# airborne: 0.46970260950477283
# fins: 0.4666135671503896
# aquatic: 0.3894874837982223
# catsize: 0.30849034491428173
# venomous: 0.13308962953512338
# predator: 0.09344704054083186
# domestic: 0.05066877984551821





#zad 5

X = (0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0)
y = (0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0)

print(freq(X,y))
print(freq2(X,y))
#dziala dla atrybutów rzadkich
# prawdopodobienstwo wystapienia "0" to 0.95238095, dla "1" 0.04761905




