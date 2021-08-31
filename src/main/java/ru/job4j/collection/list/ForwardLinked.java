package ru.job4j.collection.list;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class ForwardLinked<T> implements Iterable<T> {
    private Node<T> head;
    private Node<T> tail;
    private int size;
    private int modCount;

    public void add(T value) {
        Node<T> node = new Node<T>(value, null);
        if (head == null) {
            head = node;
            return;
        }
        tail = head;
        while (tail.next != null) {
            tail = tail.next;
        }
        tail.next = node;
    }

    public void addFirst(T value) {
        if (head == null) {
            head = new Node<T>(value, null);
            size++;
            modCount++;
            return;
        }
        Node node = new Node<T>(value, null);
        node.next = head;
        head = node;
        size++;
        modCount++;
    }

    public T deleteFirst() {
        if (head == null) {
            throw new NoSuchElementException();
        }
        Node<T> current = head;
        T value = (T) current.value;
        head = current.next;
        current.next = null;
        size--;
        modCount++;
        return value;
    }

    public int size() {
        return this.size;
    }

    public boolean isEmpty() {
        return head == null;
    }

    public boolean revert() {
        boolean rsl = false;
        if (!isEmpty() && head.next != null) {
            rsl = true;
            tail = head;
            Node<T> current = head.next;
            head.next = null;
            while (current != null) {
                Node<T> tmpNext = current.next;
                current.next = head;
                head = current;
                current = tmpNext;
            }
        }
        return rsl;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            Node<T> current = head;

            @Override
            public boolean hasNext() {
                return current != null;
            }

            @Override
            public T next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                T value = current.value;
                current = current.next;
                return value;
            }
        };
    }

    private static class Node<T> {
        T value;
        Node<T> next;

        public Node(T value, Node<T> next) {
            this.value = value;
            this.next = next;
        }
    }
}
