package ru.job4j.collection.list;

import java.util.*;

public class SimpleArrayList<T> implements List<T> {
    private Object[] container;
    private int size;
    private int modCount;

    public SimpleArrayList(int capacity) {
        this.container = (T[]) new Object[capacity];
    }

    public SimpleArrayList() {
        this.container = new Object[10];
    }

    @Override
    public void add(T value) {
        if (size == container.length) {
            container = Arrays.copyOf(container, container.length * 2);
        }
        container[size++] = value;
        modCount++;
    }

    @Override
    public T set(int index, T value) {
        Objects.checkIndex(index, container.length);
        Object prevItem = container[index];
        container[index] = value;
        return (T) prevItem;
    }

    @Override
    public T remove(int index) {
        Objects.checkIndex(index, container.length);
        Object prevItem = container[index];
        System.arraycopy(
                container,
                index + 1,
                container,
                index,
                container.length - index - 1
        );
        container[container.length - 1] = null;
        size--;
        modCount++;
        return (T) prevItem;
    }

    @Override
    public T get(int index) {
        Objects.checkIndex(index, container.length);
        return (T) container[index];
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public int length() {
        return container.length;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            int index;
            int expectedModCount = modCount;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                return index < size;
            }

            @Override
            public T next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return (T) container[index++];
            }
        };
    }
}