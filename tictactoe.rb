bubblesort = [4,3,78,2,0,2]

def bubble_sort(bubblesort)
  bubblesort_largo = bubblesort.size
  return bubblesort if bubblesort_largo <= 1

    loop do
    cambiado = false
    (bubblesort_largo - 1).times do |indiceACTUAL|
      if bubblesort[indiceACTUAL] > bubblesort[indiceACTUAL+1]
        bubblesort[indiceACTUAL], bubblesort[indiceACTUAL+1] = bubblesort[indiceACTUAL+1], bubblesort[indiceACTUAL]
        cambiado = true
      end
    end
    break if not cambiado
    end
  bubblesort
end
