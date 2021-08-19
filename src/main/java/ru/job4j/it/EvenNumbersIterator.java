package ru.job4j.it;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class EvenNumbersIterator implements Iterator<Integer> {
    private final int[] data;
    private int index;

    public EvenNumbersIterator(int[] data) {
        this.data = data;
    }

    public boolean hasNext() {
        if (index < data.length && data[index] % 2 != 0) {
            index++;
        }
        return index < data.length;
    }

    public Integer next() {
        if (!hasNext()) {
           throw new NoSuchElementException();
        }
        return data[index++];
    }
}