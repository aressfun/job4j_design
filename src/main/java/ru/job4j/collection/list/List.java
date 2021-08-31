package ru.job4j.collection.list;

public interface List<T> extends Iterable<T> {
    void add(T value);
    T set(int index, T value);
    T remove(int index);
    T get(int index);
    int size();
    int length();
}