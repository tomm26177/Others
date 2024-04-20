import numpy as np
import matplotlib.pyplot as plt

def sin(f, fs):
    krok = 1 / fs
    t = np.arange(0, 1, krok)
    s = np.sin(2 * np.pi * f * t)
    return t, s

t, s = sin(10, 20)
plt.plot(t, s)
plt.show()

t, s = sin(10, 21)
plt.plot(t, s)
plt.show()

t, s = sin(10, 30)
plt.plot(t, s)
plt.show()

t, s = sin(10, 45)
plt.plot(t, s)
plt.show()

t, s = sin(10, 50)
plt.plot(t, s)
plt.show()

t, s = sin(10, 100)
plt.plot(t, s)
plt.show()

t, s = sin(10, 100)
plt.plot(t, s)
plt.show()

t, s = sin(10, 150)
plt.plot(t, s)
plt.show()

t, s = sin(10, 200)
plt.plot(t, s)
plt.show()

t, s = sin(10, 250)
plt.plot(t, s)
plt.show()

t, s = sin(10, 1000)
plt.plot(t, s)
plt.show()



# (Nyquist-Shannon sampling theorem)
#  twierdzenie o próbkowaniu mówi, że częstotliwość próbkowania musi być co najmniej dwukrotnie większa niż najwyższa częstotliwość sygnału,
# który próbkujemy, aby uniknąć zniekształceń znanego jako aliasing.



#zad 5
# zjawisko nazywa sie aliasingiem.



methods = [None, 'none', 'nearest', 'bilinear', 'bicubic', 'spline16',
           'spline36', 'hanning', 'hamming', 'hermite', 'kaiser', 'quadric',
           'catrom', 'gaussian', 'bessel', 'mitchell', 'sinc', 'lanczos']

interp_method = 'catrom'

image = plt.imread('image.png')

plt.imshow(image, interpolation=interp_method, cmap='viridis')
plt.title(f'Interpolacja: {interp_method}')


plt.show()






#zad3
import matplotlib.image as mpimg
#3.1
image = mpimg.imread('image.png')

# 3.2
dimensions = image.shape
print("Wymiary wczytanego obrazka:", dimensions)

# 3.3
pixel_values = image.shape[-1]
print("Ilość wartości opisujących pojedynczy piksel:", pixel_values)

#3.4


brightness_image = (np.maximum(image[:, :, 0], image[:, :, 1], image[:, :, 2]) + np.minimum(image[:, :, 0], image[:, :, 1], image[:, :, 2])) / 2
print("brightness: ", brightness_image)


average_image = (image[:,:,0]+image[:,:,1]+image[:,:,2])/3
print("average: ", average_image)


luminance_image = (0.21*image[:,:,0]+0.72*image[:,:,1]+0.07*image[:,:,2])
print("luminance: ", luminance_image)


#3.5

hist_brightness, bins_brightness = np.histogram(brightness_image.ravel(), bins=16)
hist_average, bins_average = np.histogram(average_image.ravel(), bins=16)
hist_luminance, bins_luminance = np.histogram(luminance_image.ravel(), bins=16)

mean_brightness = (bins_brightness[:-1] + bins_brightness[1:])/2

gray_image = np.zeros_like(brightness_image)

for i in range (len(mean_brightness)):

    mask= np.logical_and(brightness_image >= bins_brightness[i],brightness_image < bins_brightness[i+1] )
    gray_image[mask]=mean_brightness[i]



plt.imshow(gray_image, cmap="gray")
plt.title("Obraz w skali szarości (metoda brightness)")
plt.show()


hist_average, bins_average = np.histogram(average_image.ravel(), bins=16)
hist_luminance, bins_luminance = np.histogram(luminance_image.ravel(), bins=16)

mean_average = (bins_average[:-1] + bins_average[1:]) / 2
mean_luminance = (bins_luminance[:-1] + bins_luminance[1:]) / 2


gray_image2 = np.zeros_like(average_image)
gray_image3 = np.zeros_like(luminance_image)


for i in range(len(mean_average)):
    mask = np.logical_and(average_image >= bins_average[i], average_image < bins_average[i + 1])
    gray_image2[mask] = mean_average[i]


for i in range(len(mean_luminance)):
    mask = np.logical_and(luminance_image >= bins_luminance[i], luminance_image < bins_luminance[i + 1])
    gray_image3[mask] = mean_luminance[i]


plt.imshow(gray_image2, cmap="gray")
plt.title("Obraz w skali szarości (metoda average)")
plt.show()

plt.imshow(gray_image3, cmap="gray")
plt.title("Obraz w skali szarości (metoda luminance)")
plt.show()






plt.figure(figsize=(15, 5))
plt.subplot(131)
plt.bar(bins_brightness[:-1], hist_brightness)
plt.title("Histogram - Metoda 1")


plt.subplot(132)
plt.bar(bins_average[:-1], hist_average)
plt.title("Histogram - Metoda 2")


plt.subplot(133)
plt.bar(bins_luminance[:-1], hist_luminance)
plt.title("Histogram - Metoda 3")


plt.tight_layout()
plt.show()









#3.6
hist_reduced, bins_reduced = np.histogram(brightness_image, bins=16)

plt.bar(range(len(hist_reduced)), hist_reduced, color='blue')
plt.title("Histogram zredukowany do 16 kolorów")
plt.show()


# 3.7
bin_centers = (bins_reduced[:-1] + bins_reduced[1:]) / 2
new_image = np.digitize(brightness_image, bins_reduced[1:])

#3.8
plt.imshow(new_image)
plt.title("obrazek ze zredukowaną liczbą kolorów")
plt.show()







#zad 4.1

import matplotlib.image as mpimg

image2 = mpimg.imread('image.png')


# 4.2
luminance_image = (0.21*image2[:,:,0]+0.72*image2[:,:,1]+0.07*image2[:,:,2])


hist, bins = np.histogram(luminance_image.ravel(), bins=256)

mean = (bins[:-1] + bins[1:])/2


gray_image = np.zeros_like(luminance_image)

for i in range(len(mean)):
    mask = np.logical_and(luminance_image >= bins[i], luminance_image < bins[i + 1])
    gray_image[mask] = mean[i]





plt.imshow(gray_image, cmap="gray")
plt.show()




hist_gray, bins_gray = np.histogram(gray_image, bins=256)



plt.plot(hist_gray)
plt.title("Histogram obrazu w skali szarości")
plt.show()





#4.3
def find_threshold(hist):
    local_mins = []
    peaks = []

    for i in range(1, len(hist) - 1):
        if hist[i] > hist[i - 1] and hist[i] > hist[i + 1]:
            peaks.append(i)

    if len(peaks) >= 2:
        for i in range(len(peaks) - 1):
            left_peak = peaks[i]
            right_peak = peaks[i + 1]
            local_min_index = np.argmin(hist[left_peak:right_peak]) + left_peak
            local_mins.append(local_min_index)

        threshold = (local_mins[0] + local_mins[1]) // 2
        return threshold
    else:
        print("Nie znaleziono wystarczającej liczby maksimów w histogramie.")
        return None


threshold = find_threshold(hist_gray)
print("Znaleziony próg binaryzacji:", threshold)



#4.4
print("Zakres wartości progu:", np.min(gray_image), np.max(gray_image))

scaled_threshold = threshold * 256 / np.max(hist_gray)

binary_image = np.where(gray_image > scaled_threshold, 1, 0)

plt.imshow(binary_image, cmap="gray")
plt.title("Zbinaryzowany obraz")
plt.axis('off')
plt.show()




#4.5

from scipy.ndimage import binary_erosion

eroded_image = binary_erosion(binary_image)

plt.imshow(eroded_image, cmap='gray')
plt.title("segmentacja obiektu")
plt.axis('off')
plt.show()


