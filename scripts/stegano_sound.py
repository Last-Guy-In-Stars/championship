import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile 

class Plotter:
    def __init__(self, format="pdf"):
        self.format = format

    def saveplot(self, name, data, length=-1, height=-1, dpi=None):
        plt.plot(data)
        if length != -1:
            plt.axis(xmax=length)
        if height != -1:
            plt.axis(ymax=height)
        plt.savefig(f"{name}.{self.format}", format=self.format, dpi=dpi)
        plt.cla()

    def specgram(self, name, signal):
        f, t, Sxx, im = plt.specgram(signal) 
        plt.savefig(f"{name}.{self.format}", format=self.format)
        plt.cla()
        return f, t, Sxx


class SpectreAnalyzer:
    def __init__(self, plotter):
        self.plotter = plotter 

    def spectrogram(self, signal):
        return self.plotter.specgram("spectrogram", signal)

    def findpulses(self, soundfile):
        sound_data = soundfile.getdata()  # Получаем данные звука
        f, t, Sxx = self.spectrogram(sound_data)  # Получаем частоты, времена и спектрограмму
        red_matrix = Sxx  # Используем полученные значения спектрограммы
        vec_sum = self.sumarizecolumns(red_matrix)
        presence = self.findpresence(vec_sum)
        return presence

    def sumarizecolumns(self, matrix):
        return np.sum(matrix, axis=0)

    def findpresence(self, vector):
        threshold = np.mean(vector)  # Устанавливаем порог на уровне среднего
        presence = vector > threshold 
        return presence


class SoundFile:
    def __init__(self, file_path):
        self.file_path = file_path
        self.rate, self.data = wavfile.read(file_path)  # Чтение WAV-файла

    def getdata(self):
        # Если аудиофайл стерео (2 канала), возвращаем только один канал
        if len(self.data.shape) > 1:  # Проверяем, является ли массив 2D
            return self.data[:, 0]  # Возвращаем левый канал
        return self.data  # Возвращаем данные, если они уже одномерные


def main():
    plotter = Plotter(format="pdf")
    analyzer = SpectreAnalyzer(plotter)

    the_file = SoundFile("sound_ufo.wav")  # Замените на путь к вашему файлу
    pulses = analyzer.findpulses(the_file)
    
    # Вывод результатов
    print(f"Pulses detected: {pulses}")

if __name__ == "__main__":
    main()